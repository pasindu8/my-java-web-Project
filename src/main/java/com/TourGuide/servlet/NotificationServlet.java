package com.TourGuide.servlet;

import com.TourGuide.service.NotificationService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/notification")
public class NotificationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        String username = (String) session.getAttribute("username");

        // Retrieve all notifications
        List<Map<String, String>> notifications = NotificationService.notific(username);

        if (notifications == null || notifications.isEmpty()) {
            request.setAttribute("error", "No notifications found.");
            request.getRequestDispatcher("Notifications.jsp").forward(request, response);
            return;
        }

        // Categorize notifications
        List<Map<String, String>> weatherList = new ArrayList<>();
        List<Map<String, String>> discountList = new ArrayList<>();
        List<Map<String, String>> ratingList = new ArrayList<>();

        for (Map<String, String> notifi : notifications) {
            String type = notifi.get("type");
            if ("1".equals(type)) {
                weatherList.add(notifi);
            } else if ("2".equals(type)) {
                discountList.add(notifi);
            } else if ("3".equals(type)) {
                ratingList.add(notifi);
            }
        }

        // Set attributes for JSP
        request.setAttribute("Weather", weatherList);
        request.setAttribute("Discount", discountList);
        request.setAttribute("Rating", ratingList);

        request.getRequestDispatcher("Notifications.jsp").forward(request, response);
    }

}