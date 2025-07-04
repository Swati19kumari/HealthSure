package com.infinite.jsf.provider.model;

import java.sql.Timestamp;

import com.infinite.jsf.recepient.model.Recipient;

public class Appointment {
 
	private String appointment_id;
	private Doctors doctor; // Many-to-One
	private Recipient recipient; // Many-to-One
	private DoctorAvailability availability; // One-to-One or Many-to-One
	private Providers provider; // Many-to-One
	private Timestamp requested_at;
	private Timestamp booked_at;
	private AppointmentStatus status;
	private String notes;
	private int slot_no; // New Field: NOT NULL in DB
 
	// Getters and Setters
 
	public String getAppointment_id() {
		return appointment_id;
	}
 
	public void setAppointment_id(String appointment_id) {
		this.appointment_id = appointment_id;
	}
 
	public Doctors getDoctor() {
		return doctor;
	}
 
	public void setDoctor(Doctors doctor) {
		this.doctor = doctor;
	}
 
	public Recipient getRecipient() {
		return recipient;
	}
 
	public void setRecipient(Recipient recipient) {
		this.recipient = recipient;
	}
 
	public DoctorAvailability getAvailability() {
		return availability;
	}
 
	public void setAvailability(DoctorAvailability availability) {
		this.availability = availability;
	}
 
	public Providers getProvider() {
		return provider;
	}
 
	public void setProvider(Providers provider) {
		this.provider = provider;
	}
 
	public Timestamp getRequested_at() {
		return requested_at;
	}
 
	public void setRequested_at(Timestamp requested_at) {
		this.requested_at = requested_at;
	}
 
	public Timestamp getBooked_at() {
		return booked_at;
	}
 
	public void setBooked_at(Timestamp booked_at) {
		this.booked_at = booked_at;
	}
 
	public AppointmentStatus getStatus() {
		return status;
	}
 
	public void setStatus(AppointmentStatus status) {
		this.status = status;
	}
 
	public String getNotes() {
		return notes;
	}
 
	public void setNotes(String notes) {
		this.notes = notes;
	}
 
	public int getSlot_no() {
		return slot_no;
	}
 
	public void setSlot_no(int slot_no) {
		this.slot_no = slot_no;
	}

	public Appointment(String appointment_id, Doctors doctor, Recipient recipient, DoctorAvailability availability,
			Providers provider, Timestamp requested_at, Timestamp booked_at, AppointmentStatus status, String notes,
			int slot_no) {
		super();
		this.appointment_id = appointment_id;
		this.doctor = doctor;
		this.recipient = recipient;
		this.availability = availability;
		this.provider = provider;
		this.requested_at = requested_at;
		this.booked_at = booked_at;
		this.status = status;
		this.notes = notes;
		this.slot_no = slot_no;
	}

	public Appointment() {
		
	}

//	@Override
//	public String toString() {
//		return "Appointment [appointment_id=" + appointment_id + ", doctor=" + doctor + ", recipient=" + recipient
//				+ ", availability=" + availability + ", provider=" + provider + ", requested_at=" + requested_at
//				+ ", booked_at=" + booked_at + ", status=" + status + ", notes=" + notes + ", slot_no=" + slot_no + "]";
//	}
//	
	
	
	
}