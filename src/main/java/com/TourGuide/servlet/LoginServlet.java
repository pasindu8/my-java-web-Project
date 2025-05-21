package com.TourGuide.servlet;

import com.TourGuide.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserService userService = new UserService();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 HttpSession session = request.getSession(false); // Get existing session (do not create a new one)

         
         if (session != null && session.getAttribute("username") != null) {
             response.sendRedirect("dashboard");
             return;
         }
         else
         {
        	 response.sendRedirect("login.jsp");
         }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get existing session (do not create a new one)

        
        if (session != null && session.getAttribute("username") != null) {
            response.sendRedirect("dashboard");
            return;
        }

        String username = request.getParameter("username");
        String password = request.getParameter("password");

       
        Map<String, String> userDetails = userService.authenticateUser(username, password);

       
        if (userDetails != null) {
            session = request.getSession(true); // Create a new session
            session.setAttribute("username", username);
            session.setAttribute("firstname", userDetails.get("firstname"));
            session.setAttribute("lastname", userDetails.get("lastname"));
            session.setAttribute("email", userDetails.get("email"));
            session.setAttribute("action", userDetails.get("action"));
            session.setAttribute("phone", userDetails.get("phone"));
            session.setAttribute("birthDate", userDetails.get("birthDate"));
            session.setMaxInactiveInterval(30 * 60); // Set session timeout (30 min)
            response.sendRedirect("dashboard");
        } else {
            request.setAttribute("message", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
