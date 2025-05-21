package com.TourGuide.servlet;

import com.TourGuide.model.Activitie;
import com.TourGuide.service.ActivitieService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ActivitieDShow")
public class EditActiShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ActivitieService activitieService;

    @Override
    public void init() throws ServletException {
        super.init();
        activitieService = new ActivitieService(); // Instantiate the service
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String activiNo = request.getParameter("activiNo");  // Get the activity number

        if (activiNo != null && !activiNo.isEmpty()) {
            // Fetch activity from the database using the service
            List<Activitie> acti = activitieService.getaciD(activiNo);

            if (acti != null && !acti.isEmpty()) {
                // Send the first item of the list to the JSP page
                request.setAttribute("activitie", acti.get(0)); // Use only the first result
                request.getRequestDispatcher("editActivitie.jsp").forward(request, response);
            } else {
                // If no activity is found, send an error message
                request.setAttribute("Error", "Activity not found.");
                request.getRequestDispatcher("activitManage.jsp").forward(request, response);
            }
        } else {
            // Redirect to an error page if activiNo is not provided
            response.sendRedirect("activitManage.jsp");
        }
    }
}
