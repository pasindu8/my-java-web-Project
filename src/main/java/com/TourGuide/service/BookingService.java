package com.TourGuide.service;

import com.TourGuide.model.Activitie;
import com.TourGuide.model.Booking;
import com.TourGuide.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookingService {

	// Add New Activitie
	public static boolean bookadd(String email, String activiNo, String fullname, float totalAmount, int rating,
			String username) {
		String query = "INSERT INTO booking (email, activiNo, fullname, total, rating, username) VALUES (?, ?, ?, ?, ?, ?)";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

			stmt.setString(1, email);
			stmt.setString(2, activiNo);
			stmt.setString(3, fullname);
			stmt.setFloat(4, totalAmount);
			stmt.setInt(5, rating);
			stmt.setString(6, username);

			int affectedRows = stmt.executeUpdate();
			return affectedRows > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static List<Map<String, String>> bookingManagement(String username) {
		String query = "SELECT * FROM booking WHERE username = ?";
		List<Map<String, String>> bookings = new ArrayList<>();

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {

			stmt.setString(1, username); // Set the username parameter in the query
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Map<String, String> bookingDetails = new HashMap<>();
				bookingDetails.put("id", rs.getString("id")); // Booking ID
				bookingDetails.put("activiNo", rs.getString("activiNo")); // Activity Number
				bookingDetails.put("fullname", rs.getString("fullname")); // Full name
				bookingDetails.put("total", rs.getString("total")); // Total price
				bookingDetails.put("rating", rs.getString("rating")); // Rating value
				bookings.add(bookingDetails); // Add the booking details to the list
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookings; // Return the list of bookings
	}

	public boolean bookingCancel(String activiNo, String username, String id) {

		String query = "DELETE FROM booking WHERE activiNo = ? AND username = ? AND id = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, activiNo);
			stmt.setString(2, username);
			stmt.setString(3, id);

			int rowsAffected = stmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
