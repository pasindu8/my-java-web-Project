package com.TourGuide.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Get existing session (do not create a new one)

        // Check if user is logged in
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=Please login first"); // Redirect to login page if not logged in
        } else {
        	request.setAttribute("username", session.getAttribute("username"));
            request.setAttribute("firstname", session.getAttribute("firstname"));
            request.setAttribute("lastname", session.getAttribute("lastname"));
            request.setAttribute("email", session.getAttribute("email"));
            request.setAttribute("action", session.getAttribute("action"));
            request.setAttribute("phone", session.getAttribute("phone"));
            request.setAttribute("birthDate", session.getAttribute("birthDate"));
            request.getRequestDispatcher("dashboard.jsp").forward(request, response); // Load dashboard
        }
    }
}
