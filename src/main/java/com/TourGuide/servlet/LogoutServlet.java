package com.TourGuide.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate session
        HttpSession session = request.getSession(false); // Get existing session without creating a new one
        if (session != null) {
            session.invalidate(); // Destroy session
        }

        // Redirect to login page with logout message
        response.sendRedirect("login.jsp?success=You have logged out successfully.");
    }
}
