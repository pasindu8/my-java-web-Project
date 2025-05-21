package com.TourGuide.model;

public class Rating {
	private int rating;
	private String activiNo;
	private String describeRating;
	private String date;
	private String fullname;
	private String title;
	private String string;
	private String id;
	private String username;

	
	public Rating(int rating, String activiNo, String describeRating, String date, String fullname) {
		this.rating = rating;
		this.activiNo = activiNo;
		this.describeRating = describeRating;
		this.date = date;
		this.fullname = fullname;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getActiviNo() {
		return activiNo;
	}

	public void setActiviNo(String activiNo) {
		this.activiNo = activiNo;
	}

	public String getDescribeRating() {
		return describeRating;
	}

	public void setDescribeRating(String describeRating) {
		this.describeRating = describeRating;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setStars(String string) {
		this.string = string;
	}

	public String getString() {
		return string;
	}

	public void setString(String string) {
		this.string = string;
	}

	public String getTitle() {
		return title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	
	
}
