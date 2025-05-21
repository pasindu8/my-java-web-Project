package com.TourGuide.servlet;

import com.TourGuide.service.ActivitieService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;

@WebServlet("/bookinga")
public class Booking1Servlet extends HttpServlet {
	private ActivitieService activitieS = new ActivitieService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String activiNo = request.getParameter("booking");

		if (activiNo != null) {
			Map<String, String> activiteDetails = activitieS.bookingacti(activiNo);

			if (activiteDetails != null) {
				HttpSession session = request.getSession();

				request.setAttribute("activiNo", activiNo);
				request.setAttribute("title", activiteDetails.get("title"));
				request.setAttribute("duration", activiteDetails.get("duration"));
				request.setAttribute("language", activiteDetails.get("language"));
				request.setAttribute("image", activiteDetails.get("image"));
				request.setAttribute("description", activiteDetails.get("description"));
				request.setAttribute("price", activiteDetails.get("price"));
				request.setAttribute("destination", activiteDetails.get("destination"));
				request.setAttribute("time", activiteDetails.get("time"));

				session.setMaxInactiveInterval(30 * 60);

				// Forward to JSP instead of redirecting
				request.getRequestDispatcher("booking.jsp").forward(request, response);
				return;
			}
		}
		request.setAttribute("Error", "Invalid booking ID.");
		request.getRequestDispatcher("booking.jsp").forward(request, response);
	}
}
