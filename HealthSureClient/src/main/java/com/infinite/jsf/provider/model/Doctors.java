package com.infinite.jsf.provider.model;


import java.io.Serializable;

public class Doctors implements Serializable {
    private String doctorId;               // Primary key
    private Providers provider;            // ✅ Fix: association to Provider entity
    private String doctorName;
    private String qualification;
    private String specialization;
    private String licenseNo;
    private String email;
    private String address;
    
    private DoctorType type;              // Enum
    private DoctorStatus status;          // Enum
    private DoctorsGender gender;         // Enum
    
    
	public String getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}
	public Providers getProvider() {
		return provider;
	}
	public void setProvider(Providers provider) {
		this.provider = provider;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public String getLicenseNo() {
		return licenseNo;
	}
	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public DoctorType getType() {
		return type;
	}
	public void setType(DoctorType type) {
		this.type = type;
	}
	public DoctorStatus getStatus() {
		return status;
	}
	public void setStatus(DoctorStatus status) {
		this.status = status;
	}
	public DoctorsGender getGender() {
		return gender;
	}
	public void setGender(DoctorsGender gender) {
		this.gender = gender;
	}
	public Doctors(String doctorId, Providers provider, String doctorName, String qualification, String specialization,
			String licenseNo, String email, String address, DoctorType type, DoctorStatus status,
			DoctorsGender gender) {
		super();
		this.doctorId = doctorId;
		this.provider = provider;
		this.doctorName = doctorName;
		this.qualification = qualification;
		this.specialization = specialization;
		this.licenseNo = licenseNo;
		this.email = email;
		this.address = address;
		this.type = type;
		this.status = status;
		this.gender = gender;
	}
	public Doctors() {
		
	}
//	@Override
//	public String toString() {
//		return "Doctors [doctorId=" + doctorId + ", provider=" + provider + ", doctorName=" + doctorName
//				+ ", qualification=" + qualification + ", specialization=" + specialization + ", licenseNo=" + licenseNo
//				+ ", email=" + email + ", address=" + address + ", type=" + type + ", status=" + status + ", gender="
//				+ gender + "]";
//	}

} 
    