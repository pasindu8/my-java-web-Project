package com.TourGuide.servlet;

import com.TourGuide.model.Activitie;
import com.TourGuide.service.ActivitieService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AddActivitie")

public class AddActivitieServlet extends HttpServlet {
	private ActivitieService actiService = new ActivitieService();

	// Handle GET requests (optional, to prevent 405 error)
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("addActivities.jsp"); // Redirect to the registration page
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String activiNo = request.getParameter("activitieNo");
		String title = request.getParameter("title");
		int duration = Integer.parseInt(request.getParameter("duration"));
		String language = request.getParameter("languages");
		String image = request.getParameter("image");
		String description = request.getParameter("description");
		float price = Float.parseFloat(request.getParameter("price"));
		String destination = request.getParameter("destination");
		String time = request.getParameter("time");

		Activitie addacti = new Activitie(activiNo, title, duration, language, image, description, price, destination,
				time);

		if (ActivitieService.Activitienoc(activiNo)) {
			
			request.setAttribute("Error", "Activitie No already exists.");
			request.getRequestDispatcher("addActivities.jsp").forward(request, response);
		} else if (ActivitieService.AddNewActivitie(addacti)) {
			
			request.setAttribute("Success", "New Activitie Add Successfull");
			request.getRequestDispatcher("addActivities.jsp").forward(request, response);
		} else {
			
			request.setAttribute("Error", "Add activitie failed.");
			request.getRequestDispatcher("addActivities.jsp").forward(request, response);
		}
	}
}