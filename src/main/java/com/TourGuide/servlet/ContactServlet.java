package com.TourGuide.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("massage");

       
        String subject = URLEncoder.encode(name, StandardCharsets.UTF_8.toString());
        String body = URLEncoder.encode(email + "\n" + message, StandardCharsets.UTF_8.toString());

        
        response.sendRedirect("mailto:SLIIT@my.sliit.lk?subject=" + subject + "&body=" + body);
    }
}
