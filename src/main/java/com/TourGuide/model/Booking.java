package com.TourGuide.model;

public class Booking {
	private String email;
	private String activiNo;
	private String fullname;
	private float totalAmount;
	private int rating;
	private String username;
	
	public Booking(String email, String activiNo, String fullname, float totalAmount, int rating, String username) {
		this.email = email;
		this.activiNo = activiNo;
		this.fullname = fullname;
		this.totalAmount = totalAmount;
		this.rating = rating;
		this.username = username;
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getActiviNo() {
		return activiNo;
	}
	public void setActiviNo(String activiNo) {
		this.activiNo = activiNo;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public float getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}
	
	
	
}
