package com.infinite.jsf.provider.model;
 
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.infinite.jsf.recepient.model.Recipient;

 
public class Prescription implements Serializable{
 
    private String prescriptionId;
 
    // Foreign key object mappings
    private MedicalProcedure procedure;    // mapped from procedure_id
    private Recipient recipient;           // mapped from h_id
    private Providers provider;             // mapped from provider_id
    private Doctors doctor;                 // mapped from doctor_id
    // Other fields
    private Timestamp writtenOn;
    private Timestamp createdAt;
    private Date startDate;
    private Date endDate;
	public String getPrescriptionId() {
		return prescriptionId;
	}
	public void setPrescriptionId(String prescriptionId) {
		this.prescriptionId = prescriptionId;
	}
	public MedicalProcedure getProcedure() {
		return procedure;
	}
	public void setProcedure(MedicalProcedure procedure) {
		this.procedure = procedure;
	}
	public Recipient getRecipient() {
		return recipient;
	}
	public void setRecipient(Recipient recipient) {
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
	public Timestamp getWrittenOn() {
		return writtenOn;
	}
	public void setWrittenOn(Timestamp writtenOn) {
		this.writtenOn = writtenOn;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
		
	public Prescription() {
			
		}

	public Prescription(String prescriptionId, MedicalProcedure procedure, Recipient recipient, Providers provider,
			Doctors doctor, Timestamp writtenOn, Timestamp createdAt, Date startDate, Date endDate) {
		super();
		this.prescriptionId = prescriptionId;
		this.procedure = procedure;
		this.recipient = recipient;
		this.provider = provider;
		this.doctor = doctor;
		this.writtenOn = writtenOn;
		this.createdAt = createdAt;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	
  
 
	
}