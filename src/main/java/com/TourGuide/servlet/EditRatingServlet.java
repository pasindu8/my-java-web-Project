package com.TourGuide.servlet;

import com.TourGuide.service.NotificationService;
import com.TourGuide.service.RatingService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/EditRating")
public class EditRatingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        try {
        	String ratingid = request.getParameter("id");
        	
            List<Map<String, String>> ratings = RatingService.getuserRatings(ratingid);
            request.setAttribute("ratings", ratings);
            
            request.getRequestDispatcher("editRating.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("Error", "An error occurred while retrieving ratings.");
            request.getRequestDispatcher("editRating.jsp").forward(request, response);
        }
     }
}

