package com.TourGuide.servlet;

import com.TourGuide.service.NotificationService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/NotificationSend")

public class NotificationSendServlet extends HttpServlet {
	private NotificationService notificationService = new NotificationService();
	
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("NotificationSend.jsp");
    }
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("date");
        String description = request.getParameter("description");
        int type = Integer.parseInt(request.getParameter("type"));
        String username1 = "all";
        
        boolean success = notificationService.notificationsend(date, description, type, username1);

        if (success) {
        	request.setAttribute("Success", "Notification send successfully.");
            request.getRequestDispatcher("NotificationSend.jsp").forward(request, response);
        } else {
            request.setAttribute("Error", "Notification send failed. Try again.");
            request.getRequestDispatcher("NotificationSend.jsp").forward(request, response);
        }
       
    }
}