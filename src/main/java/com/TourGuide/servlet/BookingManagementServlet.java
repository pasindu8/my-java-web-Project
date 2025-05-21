package com.TourGuide.servlet;

import com.TourGuide.service.NotificationService;
import com.TourGuide.service.BookingService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/BookingManagement")
public class BookingManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp?error=Please login first");
			return;
		}

		String username = (String) session.getAttribute("username");
		List<Map<String, String>> bookingList = null;

		try {
			// Fetch the booking details
			bookingList = BookingService.bookingManagement(username);
			if (bookingList == null || bookingList.isEmpty()) {
				request.setAttribute("Error", "No bookings found.");
			} else {
				request.setAttribute("bookings", bookingList);
			}
			request.getRequestDispatcher("BookingManagement.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}