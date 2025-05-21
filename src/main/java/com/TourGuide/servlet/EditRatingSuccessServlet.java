package com.TourGuide.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.TourGuide.service.ActivitieService;
import com.TourGuide.service.RatingService;
import java.io.IOException;

@WebServlet("/EditRatingSuccessful")
public class EditRatingSuccessServlet extends HttpServlet {
	private RatingService ratingService = new RatingService();
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if not logged in
            return;
        }
        
        
        // Get parameters from form
        String fullname = request.getParameter("fullname");
        String activiNo = request.getParameter("activiNo");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String describeRating = request.getParameter("describeRating");
        int id = Integer.parseInt(request.getParameter("id"));
        
        boolean success = ratingService.updateRating(fullname, activiNo, rating, describeRating, id);
        
        if (success) {
        	request.setAttribute("Success", "Rating updated successfully.");
            request.getRequestDispatcher("RatingManagement").forward(request, response);
        } else {
            request.setAttribute("Error", "Rating Update failed. Try again.");
            request.getRequestDispatcher("RatingManagement").forward(request, response);
        }
    }
    
   
}
