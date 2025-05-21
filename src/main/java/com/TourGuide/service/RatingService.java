package com.TourGuide.service;

import com.TourGuide.model.Activitie;
import com.TourGuide.model.Rating;
import com.TourGuide.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RatingService {
	// Add New
	public static boolean ratingadd(String activiNo, int rating, String describeRating, String fullname, String username) {
		String query = "INSERT INTO rating (activiNo, rating, describeRating, fullname, username) VALUES (?, ?, ?, ?, ?)";

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

			stmt.setString(1, activiNo);
			stmt.setInt(2, rating);
			stmt.setString(3, describeRating);
			stmt.setString(4, fullname);
			stmt.setString(5, username);

			int affectedRows = stmt.executeUpdate();
			return affectedRows > 0;

		} catch (SQLException e) {
			System.out.println("Error inserting rating: " + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public List<Rating> getAllRatings() {
		List<Rating> ratings = new ArrayList<>();
		String query = "SELECT * FROM rating";

		try (Connection connection = DBConnection.getConnection();
				Statement stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(query)) {

			while (rs.next()) {
				ratings.add(mapResultSetToRating(rs)); // Correct method call
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ratings;
	}

	private static Rating mapResultSetToRating(ResultSet rs) throws SQLException {
		return new Rating( 
				rs.getInt("rating"), 
				rs.getString("activiNo"), 
				rs.getString("describeRating"), 
				rs.getString("date"), 
				rs.getString("fullname"));
	}
	
	
	public static boolean deleteRating(int id) {

		String query = "DELETE FROM rating WHERE id = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setInt(1, id);
			int rowsAffected = stmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	
	public static List<Map<String, String>> getAllRatings(String username) {
		String query = "SELECT * FROM rating WHERE username = ?";
		List<Map<String, String>> ratings = new ArrayList<>();
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {

			stmt.setString(1, username);
			
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Map<String, String> ratingsDetails = new HashMap<>();
				ratingsDetails.put("rating", rs.getString("rating"));
				ratingsDetails.put("activiNo", rs.getString("activiNo"));
				ratingsDetails.put("describeRating", rs.getString("describeRating"));
				ratingsDetails.put("id", rs.getString("id"));
				ratingsDetails.put("date", rs.getString("date"));
				ratingsDetails.put("fullname", rs.getString("fullname"));
				ratings.add( ratingsDetails);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ratings;
	}
	
	public static List<Map<String, String>> getuserRatings(String id) {
		String query = "SELECT * FROM rating WHERE id = ?";
		List<Map<String, String>> ratings = new ArrayList<>();
		try (Connection connection = DBConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {

			stmt.setString(1, id);
			
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Map<String, String> ratingsDetails = new HashMap<>();
				ratingsDetails.put("rating", rs.getString("rating"));
				ratingsDetails.put("activiNo", rs.getString("activiNo"));
				ratingsDetails.put("describeRating", rs.getString("describeRating"));
				ratingsDetails.put("id", rs.getString("id"));
				ratingsDetails.put("date", rs.getString("date"));
				ratingsDetails.put("fullname", rs.getString("fullname"));
				ratings.add( ratingsDetails);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ratings;
	}
	
	
	
	public boolean updateRating(String fullname, String activiNo, int rating, String describeRating, int id){
		String query = "UPDATE rating SET fullname = ?, activiNo = ?, rating = ?, describeRating = ? WHERE id = ?";
		try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
			
			stmt.setString(1, fullname);
			stmt.setString(2, activiNo);
			stmt.setInt(3, rating);
			stmt.setString(4, describeRating);
			stmt.setInt(5, id);
			int rowsAffected = stmt.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}