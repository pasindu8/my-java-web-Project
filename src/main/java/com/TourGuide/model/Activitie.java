package com.TourGuide.model;

public class Activitie {
	private String activiNo;
	private String title;
	private int duration;
	private String language;
	private String image;
	private String description;
	private float price;
	private String destination;
	private int participantsCount;
	private String date;
	private String time;

	public Activitie(String activiNo, String title, int duration, String language, String image, String description, float price, String destination, String time) {
		this.activiNo = activiNo;
		this.title = title;
		this.duration = duration;
		this.language = language;
		this.image = image;
		this.description = description;
		this.price = price;
		this.destination = destination;
		this.time = time;
	}
	
	public String getActiviNo() {
		return activiNo;
	}
	public void setActiviNo(String activiNo) {
		this.activiNo = activiNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public int getParticipantsCount() {
		return participantsCount;
	}

	public void setParticipantsCount(int participantsCount2) {
		this.participantsCount = participantsCount2;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
}
