package com.TourGuide.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.TourGuide.service.ActivitieService;
import com.TourGuide.service.UserService;
import java.io.IOException;

@WebServlet("/delete")
public class DeleteProfile extends HttpServlet {
	private UserService userService = new UserService();
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if not logged in
            return;
        }
        
        String username =(String) session.getAttribute("username");
        
        boolean success = userService.deleteProfile(username);
        
        if (success) {
        	if (session != null) {
                session.invalidate(); // Destroy session
            }
            response.sendRedirect("login.jsp?success=Profile delete successfully.");
        } else {
            request.setAttribute("Error", "Profile delete failed. Try again.");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
    }
   
}
