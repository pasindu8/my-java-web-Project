package com.TourGuide.servlet;

import com.TourGuide.service.ActivitieService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditActivitie")

public class EditActivitiServlet extends HttpServlet {
    private ActivitieService activitieService = new ActivitieService();
    
    // Handle GET requests (optional, to prevent 405 error)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("editActivitie.jsp"); // Redirect to the registration page
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String activiNo = request.getParameter("activiNo").trim();
        String title = request.getParameter("title");
        int duration = Integer.parseInt(request.getParameter("duration"));
        String language = request.getParameter("language");
        String image = request.getParameter("image");
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        String destination = request.getParameter("destination");
        String time = request.getParameter("time");
               
        // Update 
        boolean success = activitieService.updateDetails(activiNo, title, duration, language, image, description, price, destination, time);
        
        if (success) {
        	request.setAttribute("Success", "Update Successfull.");
            request.getRequestDispatcher("editActivitie.jsp").forward(request, response);
        } else {
            request.setAttribute("Error", "Update failed. Try again.");
            request.getRequestDispatcher("editActivitie.jsp").forward(request, response);
        }
    }
}
