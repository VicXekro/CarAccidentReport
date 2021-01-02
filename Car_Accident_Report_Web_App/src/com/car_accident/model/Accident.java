package com.car_accident.model;

import java.sql.Timestamp;

public class Accident {
	private int id;
	private float latitude;
	private float longitude;
	private Timestamp dateTime;
	
	public Accident(int id, float latitude, float longitude, Timestamp daTimestamp) {
		this.id = id;
		this.latitude = latitude;
		this.longitude = longitude;
		this.dateTime = daTimestamp;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getLatitude() {
		return latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public float getLongitude() {
		return longitude;
	}

	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}

	public Timestamp getDateTime() {
		return dateTime;
	}

	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}
	
	
}
