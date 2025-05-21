package com.TourGuide.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/rating")
public class RatinggetServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Extract parameters from URL
        String activiNo = request.getParameter("no"); // Extract the tour number from the URL parameter

        // Retrieve user details from session
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String firstname = (String) session.getAttribute("firstname");
        String lastname = (String) session.getAttribute("lastname");

        // Ensure user details exist
        if (username == null || firstname == null || lastname == null) {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        // Set attributes to be accessed in JSP
        request.setAttribute("firstname", firstname);
        request.setAttribute("lastname", lastname);
        request.setAttribute("activiNo", activiNo);

        // Forward to JSP
        request.getRequestDispatcher("rating.jsp").forward(request, response);
    }
}
