package com.TourGuide.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.TourGuide.service.ActivitieService;
import com.TourGuide.service.UserService;
import com.TourGuide.service.NotificationService;
import java.io.IOException;

@WebServlet("/NotificationDelete")
public class NotificationDeleteServlet extends HttpServlet {
	private NotificationService notificationService = new NotificationService();
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String id = request.getParameter("no");
        
        boolean success = notificationService.notificationdelete(id);
        
        if (success) {
        	request.setAttribute("Success", "Notification delete successfully.");
            request.getRequestDispatcher("notification").forward(request, response);
        } else {
            request.setAttribute("Error", "Notification delete failed. Try again.");
            request.getRequestDispatcher("notification").forward(request, response);
        }
    }
   
}

