package com.TourGuide.service;

import com.TourGuide.model.Notification;
import com.TourGuide.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NotificationService {

	// Add New
	public static boolean notificationadd(String date, int type, String description, String username) {
		String query = "INSERT INTO notification (date, type, description, username) VALUES (?, ?, ?, ?)";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

			stmt.setString(1, date);
			stmt.setInt(2, type);
			stmt.setString(3, description);
			stmt.setString(4, username);

			int affectedRows = stmt.executeUpdate();
			return affectedRows > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static List<Map<String, String>> notific(String username) {
		String query = "SELECT * FROM notification WHERE username = ? OR username = 'all'";
		List<Map<String, String>> notifications = new ArrayList<>();

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {

			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Map<String, String> notifiDetails = new HashMap<>();
				notifiDetails.put("date", rs.getString("date"));
				notifiDetails.put("type", rs.getString("type"));
				notifiDetails.put("description", rs.getString("description"));
				notifiDetails.put("id", rs.getString("id"));
				notifications.add(notifiDetails);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return notifications;
	}

	public boolean notificationdelete(String id) {

		String query = "DELETE FROM notification WHERE id = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, id);
			int rowsAffected = stmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static boolean notificationsend(String date, String description, int type, String username) {
		String query = "INSERT INTO notification (date, type, description, username) VALUES (?, ?, ?, ?)";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

			stmt.setString(1, date);
			stmt.setInt(2, type);
			stmt.setString(3, description);
			stmt.setString(4, username);

			int affectedRows = stmt.executeUpdate();
			return affectedRows > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
