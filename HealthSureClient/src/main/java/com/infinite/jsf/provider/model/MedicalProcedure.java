package com.infinite.jsf.provider.model;
 
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import com.infinite.jsf.recepient.model.Recipient;
import com.infinite.jsf.insurance.model.Subscribe;

public class MedicalProcedure implements Serializable{
 
    private String procedureId;
    private Appointment appointment; // Added as object
    private com.infinite.jsf.recepient.model.Recipient recipient;
    private Providers provider;
    private Doctors doctor;
    private Date procedureDate;
    private String diagnosis;
    private String recommendations;
    private Date fromDate;
    private Date toDate;
    private Date createdAt;
    private Set<Claims> claims;
    private Set<Prescription> prescriptions;
    
    
    
	public String getProcedureId() {
		return procedureId;
	}
	public void setProcedureId(String procedureId) {
		this.procedureId = procedureId;
	}
	public Appointment getAppointment() {
		return appointment;
	}
	public void setAppointment(Appointment appointment) {
		this.appointment = appointment;
	}
	public com.infinite.jsf.recepient.model.Recipient getRecipient() {
		return recipient;
	}
	public void setRecipient(com.infinite.jsf.recepient.model.Recipient recipient) {
		this.recipient = recipient;
	}
	public Providers getProvider() {
		return provider;
	}
	public void setProvider(Providers provider) {
		this.provider = provider;
	}
	public Doctors getDoctor() {
		return doctor;
	}
	public void setDoctor(Doctors doctor) {
		this.doctor = doctor;
	}
	public Date getProcedureDate() {
		return procedureDate;
	}
	public void setProcedureDate(Date procedureDate) {
		this.procedureDate = procedureDate;
	}
	public String getDiagnosis() {
		return diagnosis;
	}
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}
	public String getRecommendations() {
		return recommendations;
	}
	public void setRecommendations(String recommendations) {
		this.recommendations = recommendations;
	}
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Set<Claims> getClaims() {
		return claims;
	}
	public void setClaims(Set<Claims> claims) {
		this.claims = claims;
	}
	public Set<Prescription> getPrescriptions() {
		return prescriptions;
	}
	public void setPrescriptions(Set<Prescription> prescriptions) {
		this.prescriptions = prescriptions;
	}
	
	
	public MedicalProcedure() {
			
		}
	   
	
	public MedicalProcedure(String procedureId, Appointment appointment, Recipient recipient, Providers provider,
			Doctors doctor, Date procedureDate, String diagnosis, String recommendations, Date fromDate, Date toDate,
			Date createdAt, Set<Claims> claims, Set<Prescription> prescriptions) {
		super();
		this.procedureId = procedureId;
		this.appointment = appointment;
		this.recipient = recipient;
		this.provider = provider;
		this.doctor = doctor;
		this.procedureDate = procedureDate;
		this.diagnosis = diagnosis;
		this.recommendations = recommendations;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.createdAt = createdAt;
		this.claims = claims;
		this.prescriptions = prescriptions;
	}
	
	
	
    
    
	
}