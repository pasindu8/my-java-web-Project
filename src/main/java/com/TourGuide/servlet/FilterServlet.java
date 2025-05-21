package com.TourGuide.servlet;
import com.TourGuide.model.Activitie;
import com.TourGuide.service.ActivitieService;
import com.TourGuide.model.Rating;
import com.TourGuide.service.RatingService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/filter")
public class FilterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ActivitieService actiService;
    private RatingService ratingService;

    @Override
    public void init() throws ServletException {
        super.init();
        actiService = new ActivitieService();
        ratingService = new RatingService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Default values to avoid errors if parameters are missing
            int duration = parseOrDefault(request.getParameter("duration"), 0);
            float pricemin = parseOrDefault(request.getParameter("min"), 0.0f);
            float pricemax = parseOrDefault(request.getParameter("max"), 0.0f);
            float price = parseOrDefault(request.getParameter("price"), 0.0f);
            String destination = request.getParameter("destination");
            
            if (destination == null || destination.trim().isEmpty()) {
                destination = "''"; // Default wildcard for all destinations
            }

            // Filter activities
            List<Activitie> activi = actiService.getfilterActiD(duration, price, destination, pricemin, pricemax);
            request.setAttribute("activitie", activi);

            List<Rating> ratings = ratingService.getAllRatings();

            for (Rating rating : ratings) {
                for (Activitie activitie : activi) {
                    if (rating.getActiviNo().equals(activitie.getActiviNo())) {
                        rating.setTitle(activitie.getTitle());
                        break;
                    }
                }
            }

            for (Rating rating : ratings) {
                StringBuilder stars = new StringBuilder();
                for (int i = 1; i <= 5; i++) {
                    stars.append(i <= rating.getRating() ? "⭐" : "☆");
                }
                rating.setStars(stars.toString());
            }

            request.setAttribute("rating", ratings);
            request.getRequestDispatcher("home1.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing request.");
        }
    }

    // Helper method to safely parse numbers with default values
    private int parseOrDefault(String value, int defaultValue) {
        try {
            return (value != null && !value.isEmpty()) ? Integer.parseInt(value) : defaultValue;
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    private float parseOrDefault(String value, float defaultValue) {
        try {
            return (value != null && !value.isEmpty()) ? Float.parseFloat(value) : defaultValue;
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }
}
