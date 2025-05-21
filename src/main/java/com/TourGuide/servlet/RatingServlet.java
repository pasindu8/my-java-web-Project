package com.TourGuide.servlet;

import com.TourGuide.service.RatingService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/ratings")
public class RatingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        String fullname = request.getParameter("fullname");
        String activiNo = request.getParameter("activiNo");
        String describeRating = request.getParameter("describeRating");
        String username = (String) session.getAttribute("username");

        int rating;
        try {
            rating = Integer.parseInt(request.getParameter("rating"));
        } catch (NumberFormatException e) {
            request.setAttribute("Error", "Invalid rating format.");
            request.getRequestDispatcher("rating.jsp").forward(request, response);
            return;
        }

        if (fullname == null || activiNo == null || describeRating == null) {
            request.setAttribute("Error", "Please fill in all required fields.");
            request.getRequestDispatcher("rating.jsp").forward(request, response);
            return;
        }

        fullname = fullname.trim();
        activiNo = activiNo.trim();
        describeRating = describeRating.trim();


        request.setAttribute("fullname", fullname);
        request.setAttribute("activiNo", activiNo);
        request.setAttribute("rating", rating);
        request.setAttribute("describeRating", describeRating);
        boolean success = RatingService.ratingadd(activiNo, rating, describeRating, fullname, username);

        if (success) {
        	 request.setAttribute("Success", "Add rating Successfull.");
            request.getRequestDispatcher("ratings.jsp").forward(request, response);
        } else {
            request.setAttribute("Error", "Add rating failed.");
            request.getRequestDispatcher("rating.jsp").forward(request, response);
        }
    }
}
