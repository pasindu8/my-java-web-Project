package com.TourGuide.service;

import com.TourGuide.model.Activitie;
import com.TourGuide.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ActivitieService {

	public static boolean Activitienoc(String activitieNo) {
		String query = "SELECT * FROM activitie WHERE activiNo = ?";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {

			stmt.setString(1, activitieNo);

			ResultSet rs = stmt.executeQuery();

			if (rs.next() && rs.getInt(1) > 0) {
				return true;
			}
			; // If there is a result, activiNo exists
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Add New Activitie
	public static boolean AddNewActivitie(Activitie acti) {
		String query = "INSERT INTO activitie (activiNo, title, duration, language, image, description, price, destination, time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

			stmt.setString(1, acti.getActiviNo());
			stmt.setString(2, acti.getTitle());
			stmt.setInt(3, acti.getDuration());
			stmt.setString(4, acti.getLanguage());
			stmt.setString(5, acti.getImage());
			stmt.setString(6, acti.getDescription());
			stmt.setFloat(7, acti.getPrice());
			stmt.setString(8, acti.getDestination());
			stmt.setString(9, acti.getTime());

			int affectedRows = stmt.executeUpdate();
			return affectedRows > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// activitie Details update

	public boolean updateDetails(String activiNo, String title, int duration, String language, String image,
			String description, float price, String destination, String time) {

		String query = "UPDATE activitie SET title = ?, duration = ?, language = ?, image = ?, description = ?, price = ?, destination = ?, time = ? WHERE activiNo = ?";

		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, title);
			stmt.setInt(2, duration);
			stmt.setString(3, language);
			stmt.setString(4, image);
			stmt.setString(5, description);
			stmt.setFloat(6, price);
			stmt.setString(7, destination);
			stmt.setString(8, time);
			stmt.setString(9, activiNo);

			int rowsAffected = stmt.executeUpdate();

			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static List<Activitie> getAllActiD() {
		List<Activitie> acti = new ArrayList<>();
		String query = "SELECT * FROM activitie";
		try (Connection connection = DBConnection.getConnection();
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(query)) {

			while (rs.next()) {
				acti.add(mapResultSetToActivitie(rs));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return acti;
	}

	public static List<Activitie> getfilterActiD(int duration, float price, String destination, float pricemin,
			float pricemax) {
		List<Activitie> acti = new ArrayList<>();

		// Corrected SQL Query
		String query = "SELECT * FROM activitie WHERE duration = ? OR (price BETWEEN ? AND ?) OR destination LIKE ?";

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {

			stmt.setInt(1, duration);
			stmt.setFloat(2, pricemin);
			stmt.setFloat(3, pricemax);
			stmt.setString(4, "%" + destination + "%");

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					acti.add(mapResultSetToActivitie(rs));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return acti;
	}

	private static Activitie mapResultSetToActivitie(ResultSet rs) throws SQLException {
		return new Activitie(rs.getString("activiNo"), rs.getString("title"), rs.getInt("duration"),
				rs.getString("language"), rs.getString("image"), rs.getString("description"), rs.getFloat("price"),
				rs.getString("destination"), rs.getString("time")

		);
	}

	public static List<Activitie> getaciD(String activiNo) {
		List<Activitie> acti = new ArrayList<>();
		String query = "SELECT * FROM activitie WHERE activiNo = ?";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {

			stmt.setString(1, activiNo);

			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					acti.add(mapResultSetToActivitieshow(rs));
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return acti;
	}

	private static Activitie mapResultSetToActivitieshow(ResultSet rs) throws SQLException {
		return new Activitie(rs.getString("activiNo"), rs.getString("title"), rs.getInt("duration"),
				rs.getString("language"), rs.getString("image"), rs.getString("description"), rs.getFloat("price"),
				rs.getString("destination"), rs.getString("time"));
	}

	public List<Activitie> getAllActivities() {
		List<Activitie> activitie = new ArrayList<>();
		String query = "SELECT * FROM activitie";
		try (Connection connection = DBConnection.getConnection();
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(query)) {
			while (rs.next()) {
				activitie.add(mapResultSetToActivitie(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return activitie;
	}

	public Map<String, String> bookingacti(String activiNo) {

		String query = "SELECT * FROM activitie WHERE activiNo = ?";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {

			stmt.setString(1, activiNo);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {

				Map<String, String> activiteDetails = new HashMap<>();

				activiteDetails.put("activiNo", rs.getString("activiNo"));
				activiteDetails.put("title", rs.getString("title"));
				activiteDetails.put("duration", rs.getString("duration"));
				activiteDetails.put("language", rs.getString("language"));
				activiteDetails.put("image", rs.getString("image"));
				activiteDetails.put("description", rs.getString("description"));
				activiteDetails.put("price", rs.getString("price"));
				activiteDetails.put("destination", rs.getString("destination"));
				activiteDetails.put("time", rs.getString("time"));
				return activiteDetails;

			}
			; // Returns true if user exists with correct credentials

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean deleteActivitie(String activiNo) {

		String query = "DELETE FROM activitie WHERE activiNo = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, activiNo);
			int rowsAffected = stmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
