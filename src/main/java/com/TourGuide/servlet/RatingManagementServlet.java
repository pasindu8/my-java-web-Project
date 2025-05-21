package com.TourGuide.servlet;

import com.TourGuide.service.NotificationService;
import com.TourGuide.service.RatingService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/RatingManagement")
public class RatingManagementServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        try {
        	String username = (String) session.getAttribute("username");
        	
            List<Map<String, String>> ratings = RatingService.getAllRatings(username);
            request.setAttribute("ratings", ratings);
            request.getRequestDispatcher("RatingManagement.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("Error", "An error occurred while retrieving ratings.");
            request.getRequestDispatcher("RatingManagement.jsp").forward(request, response);
        }
     }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        try {
        	String username = (String) session.getAttribute("username");
        	
            List<Map<String, String>> ratings = RatingService.getAllRatings(username);
            request.setAttribute("ratings", ratings);
            request.getRequestDispatcher("RatingManagement.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("Error", "An error occurred while retrieving ratings.");
            request.getRequestDispatcher("RatingManagement.jsp").forward(request, response);
        }
     }
    
}

