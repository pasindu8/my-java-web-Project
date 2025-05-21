package com.TourGuide.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.TourGuide.service.ActivitieService;
import com.TourGuide.service.UserService;
import com.TourGuide.service.NotificationService;
import com.TourGuide.service.BookingService;
import java.io.IOException;

@WebServlet("/BookingCancel")
public class BookingCancelServlet extends HttpServlet {
	private BookingService bookingService = new BookingService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("username") == null) {
			response.sendRedirect("login.jsp?error=Please login first");
			return;
		}

		String username = (String) session.getAttribute("username");
		String activiNo = request.getParameter("no");
		String id = request.getParameter("id");

		boolean success = bookingService.bookingCancel(activiNo, username, id);

		if (success) {
			request.setAttribute("Success", "Booking Cancel successfully.");
			request.getRequestDispatcher("BookingManagement").forward(request, response);
		} else {
			request.setAttribute("Error", "Booking Cancel failed. Try again.");
			request.getRequestDispatcher("BookingManagement").forward(request, response);
		}
	}

}
