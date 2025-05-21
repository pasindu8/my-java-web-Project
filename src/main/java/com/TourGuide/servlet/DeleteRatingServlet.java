package com.TourGuide.servlet;

import com.TourGuide.service.NotificationService;
import com.TourGuide.service.RatingService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/DeleteRating")
public class DeleteRatingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        int ratingid = Integer.parseInt(request.getParameter("id"));
        
	    boolean success = RatingService.deleteRating(ratingid);
	    
	    if (success) {
	    	 request.setAttribute("Success", "Delete rating Successfull");
	        response.sendRedirect("RatingManagement");
	    } else {
	        request.setAttribute("Error", "Failed to delete rating.");
	        request.getRequestDispatcher("RatingManagement.jsp").forward(request, response);
	    }
            
           
     }
}

