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
import java.util.Map;

@WebServlet("/EditProfile")
public class EditProfileServlet extends HttpServlet {
	private UserService userService = new UserService();
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if not logged in
            return;
        }
        
        String username =(String) session.getAttribute("username");
        
        // Get parameters from form
        String firstName = request.getParameter("fName");
        String lastName = request.getParameter("lName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String birthDate = request.getParameter("birth");
        
        boolean success = userService.updateProfile(firstName, lastName, email, phone, birthDate, username);
        
        session.setAttribute("firstname", firstName);
        session.setAttribute("lastname", lastName);
        session.setAttribute("email", email);
        session.setAttribute("phone", phone);
        session.setAttribute("birthDate", birthDate);
        session.setMaxInactiveInterval(30 * 60);
        
        if (success) {
        	request.setAttribute("firstname", session.getAttribute("firstname"));
            request.setAttribute("lastname", session.getAttribute("lastname"));
            request.setAttribute("email", session.getAttribute("email"));
            request.setAttribute("phone", session.getAttribute("phone"));
            request.setAttribute("birthDate", session.getAttribute("birthDate"));
        	request.setAttribute("Success", "Profile updated successfully.");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } else {
            request.setAttribute("Error", "Profile Update failed. Try again.");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
    }
    
   
}
