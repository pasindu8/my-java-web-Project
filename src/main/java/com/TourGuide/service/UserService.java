package com.TourGuide.service;

import com.TourGuide.model.User;
import com.TourGuide.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserService {
	// Register a new user
	public boolean registerUser(User user) {
		String query = "INSERT INTO users (firstname, lastname, email, username, password, action) VALUES (?, ?, ?, ?, ?, ?)";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

			stmt.setString(1, user.getfName());
			stmt.setString(2, user.getlName());
			stmt.setString(3, user.getEmail());
			stmt.setString(4, user.getUsername());
			stmt.setString(5, user.getPassword()); // You should hash this before storing
			stmt.setString(6, user.getAction());

			int affectedRows = stmt.executeUpdate();
			return affectedRows > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Check if a username exists (for validation)
	public boolean isUsernameTaken(String username) {
		String query = "SELECT * FROM users WHERE username = ?";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {

			stmt.setString(1, username);

			ResultSet rs = stmt.executeQuery();

			return rs.next(); // If there is a result, username exists
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Authenticate a user (Login)
	public Map<String, String> authenticateUser(String username, String password) {

		String query = "SELECT * FROM users WHERE username = ? AND password = ?";
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {

			stmt.setString(1, username);
			stmt.setString(2, password);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {

				Map<String, String> userDetails = new HashMap<>();

				userDetails.put("firstname", rs.getString("firstname"));
				userDetails.put("lastname", rs.getString("lastname"));
				userDetails.put("email", rs.getString("email"));
				userDetails.put("action", rs.getString("action"));
				userDetails.put("phone", rs.getString("phone"));
				userDetails.put("birthDate", rs.getString("birthDate"));
				return userDetails;

			}
			; // Returns true if user exists with correct credentials

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean updatePassword(String username, String password) {
		String query = "UPDATE users SET password = ? WHERE username = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setString(1, password);
			stmt.setString(2, username);
			int rowsAffected = stmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateProfile(String fName, String lName, String email, String phone, String birthDate,
			String username) {
		String query = "UPDATE users SET firstname = ?, lastname = ?, email = ?, phone = ?, birthDate = ? WHERE username = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setString(1, fName);
			stmt.setString(2, lName);
			stmt.setString(3, email);
			stmt.setString(4, phone);
			stmt.setString(5, birthDate);
			stmt.setString(6, username);
			int rowsAffected = stmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteProfile(String username) {

		String query = "DELETE FROM users WHERE username = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setString(1, username);
			int rowsAffected = stmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
