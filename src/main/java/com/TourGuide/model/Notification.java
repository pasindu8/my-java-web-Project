package com.TourGuide.model;

public class Notification {
	private String description;
	private int type;
	private String date;
	private String username;
	private String id;
	
	
	public Notification(String description, int type, String date, String username, String id) {
		this.description = description;
		this.type = type;
		this.date = date;
		this.username = username;
		this.id = id;
	}
	public Notification(String username) {
		this.username = username;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
