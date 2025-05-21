package com.TourGuide.servlet;

import com.TourGuide.service.UserService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/forgotpassword")
public class ForgotpasswordServlet extends HttpServlet {
    private UserService userService = new UserService();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String newPassword = request.getParameter("password");
        String confirmPassword = request.getParameter("cpassword");

        // Validate if passwords match
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("Error", "Passwords do not match.");
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
            return;
        }

        // Check if the username exists
        if (!userService.isUsernameTaken(username)) {
            request.setAttribute("Error", "Username not found.");
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
            return;
        }

        // Update password
        boolean success = userService.updatePassword(username, newPassword);
        if (success) {
            response.sendRedirect("login.jsp?success=Password successfully reset. Please login.");
        } else {
            request.setAttribute("Error", "Password reset failed. Try again.");
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
        }
    }
}
