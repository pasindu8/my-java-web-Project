
package com.TourGuide.servlet;
import com.TourGuide.service.ActivitieService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {
    private ActivitieService activitieS = new ActivitieService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false); // Get existing session (do not create a new one)
    	
    	if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp?error=Please login first"); // Redirect to login page if not logged in
        } else {
        	request.setAttribute("username", session.getAttribute("username"));
            request.setAttribute("firstname", session.getAttribute("firstname"));
            request.setAttribute("lastname", session.getAttribute("lastname"));
            request.setAttribute("email", session.getAttribute("email"));
        
    	
	        String activiNo = request.getParameter("no");
	        float price = Float.parseFloat(request.getParameter("to"));
	        String title = request.getParameter("ti");
	        String date = request.getParameter("da");
	        int adults = Integer.parseInt(request.getParameter("ad"));
	      
	        
	        request.setAttribute("activiNo", activiNo);
	        request.setAttribute("title", title);
	        request.setAttribute("date", date);
	        request.setAttribute("adults", adults);
	        float total = price*adults;
	        request.setAttribute("total", total);
	        
	        request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }
}
