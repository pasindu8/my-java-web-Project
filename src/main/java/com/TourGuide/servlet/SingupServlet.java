package com.TourGuide.servlet;

import com.TourGuide.model.User;
import com.TourGuide.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/singup")

public class SingupServlet extends HttpServlet {
	private UserService userService = new UserService();
	
	// Handle GET requests 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("singup.jsp"); // Redirect to the registration page
    }
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("fName");
        String lastName = request.getParameter("lName");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String action = "user";
        

        User newUser = new User(firstName, lastName, email, username, password, action);

        if (userService.isUsernameTaken(username)) {
            request.setAttribute("message", "Username already exists.");
            request.getRequestDispatcher("singup.jsp").forward(request, response);
        } else if (userService.registerUser(newUser)) {
        	 response.sendRedirect("login.jsp?success=Registration successfully.");
        } else {
            request.setAttribute("message", "Registration failed.");
            request.getRequestDispatcher("singup.jsp").forward(request, response);
        }
    }
}