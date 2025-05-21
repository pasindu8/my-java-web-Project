package com.TourGuide.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.TourGuide.service.ActivitieService;
import com.TourGuide.service.UserService;
import java.io.IOException;

@WebServlet("/DeleteActivit")
public class DeleteActivitServlet extends HttpServlet {
	private ActivitieService activitieService = new ActivitieService();
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        String activiNo = request.getParameter("no");
      
        boolean success = activitieService.deleteActivitie(activiNo);
        
        if (success) {
        	request.setAttribute("Success", "delete Successfull.");
	        request.getRequestDispatcher("activitManage.jsp").forward(request, response);
        } else {
        	request.setAttribute("Error", "delete  failed. Try again.");
	        request.getRequestDispatcher("activitManage.jsp").forward(request, response);
        }
    }
   
}

