
package com.TourGuide.servlet;

import com.TourGuide.model.Activitie;
import com.TourGuide.service.ActivitieService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ActivitieManage")
public class ActivitieManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ActivitieService activitieService;

	@Override
	public void init() throws ServletException {
		super.init();
		activitieService = new ActivitieService();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Activitie> acti = activitieService.getAllActiD();
		request.setAttribute("activitie", acti);
		request.getRequestDispatcher("activitManage.jsp").forward(request, response);
	}

}
