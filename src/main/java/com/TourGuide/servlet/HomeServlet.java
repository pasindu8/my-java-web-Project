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

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Activitie> activi = actiService.getAllActivities();
        request.setAttribute("activitie", activi);
        List<Rating> ratings = ratingService.getAllRatings();
        
        for (Rating rating : ratings) {
            for (Activitie activitie : activi) {
                if (rating.getActiviNo().equals(activitie.getActiviNo())) {
                    rating.setTitle(activitie.getTitle()); // Assuming Rating model has setTitle()
                    break;
                }
            }
        }
        
        for (Rating rating : ratings) {
            StringBuilder stars = new StringBuilder();
            for (int i = 1; i <= 5; i++) {
                if (i <= rating.getRating()) {
                    stars.append("⭐"); 
                } else {
                    stars.append("☆"); 
                }
            }
            rating.setStars(stars.toString()); // Assuming `setStars()` exists in `Rating` model
        }

        
        request.setAttribute("rating", ratings);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
    
}
