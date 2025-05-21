package com.TourGuide.servlet;

import com.TourGuide.model.Booking;
import com.TourGuide.model.Notification;
import com.TourGuide.service.BookingService;
import com.TourGuide.service.NotificationService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/book")
public class BookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String titel = request.getParameter("title");
        String date = request.getParameter("date");
        String adults = request.getParameter("adults");
        String cardNumber = request.getParameter("cardNumber");
        String expiry = request.getParameter("expiry");
        String cvv = request.getParameter("cvv");
        String totalAmountStr = request.getParameter("totalAmount");
        String activiNo = request.getParameter("activiNo");

        if (fullname == null || email == null || titel == null || date == null ||
            adults == null || cardNumber == null || expiry == null || cvv == null || 
            totalAmountStr == null || activiNo == null) {
            request.setAttribute("Error", "Please fill in all required fields.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
            return;
        }

        fullname = fullname.trim();
        email = email.trim();
        titel = titel.trim();
        date = date.trim();
        adults = adults.trim();
        cardNumber = cardNumber.trim();
        expiry = expiry.trim();
        cvv = cvv.trim();
        activiNo = activiNo.trim();

        float totalAmount;
        try {
            totalAmount = Float.parseFloat(totalAmountStr.trim());
        } catch (NumberFormatException e) {
            request.setAttribute("Error", "Invalid total amount format.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
            return;
        }

        if (!cardNumber.equals("4168018751587322") || !cvv.equals("546") || !expiry.equals("06/25")) {
            request.setAttribute("Error", "Invalid card details.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
            return;
        }

        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("activiNo", activiNo);
        request.setAttribute("adults", adults);
        request.setAttribute("titel", titel);
        request.setAttribute("date", date);

        int rating = 1;
        String username = (String) session.getAttribute("username");

        if (BookingService.bookadd(email, activiNo, fullname, totalAmount, rating, username)) {
            int type = 3;
            String description = "Thank you for booking with us. Your tour is successfully confirmed <br><br> "
                               + "<a href='" + request.getContextPath() + "/rating?no=" + activiNo + "' "
                               + "class='bg-blue-600 text-white font-bold p-2 rounded-lg'>Rating Now</a><br><br>";

            if (NotificationService.notificationadd(date, type, description, username)) {
                request.getRequestDispatcher("book.jsp").forward(request, response);
            } else {
                request.setAttribute("Error", "Failed to add notification.");
                request.getRequestDispatcher("payment.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("Error", "Add booking failed.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }
}