package com.infinite.jsf.provider.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;

public class Providers implements Serializable {

	private String provider_id;
	private String provider_name;
	private String hospital_name;
	private String email;
	private String address;
	private String city;
	private String state;
	private String zip_code;
	private ProviderStatus status;
	private Date created_at;

	private Set<Doctors> doctors;// One-to-Many Relationship
	

	// Getters and Setters

	public String getProvider_id() {
		return provider_id;
	}

	public void setProvider_id(String provider_id) {
		this.provider_id = provider_id;
	}

	public String getProvider_name() {
		return provider_name;
	}

	public void setProvider_name(String provider_name) {
		this.provider_name = provider_name;
	}

	public String getHospital_name() {
		return hospital_name;
	}

	public void setHospital_name(String hospital_name) {
		this.hospital_name = hospital_name;
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

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public ProviderStatus getStatus() {
		return status;
	}

	public void setStatus(ProviderStatus status) {
		this.status = status;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Set<Doctors> getDoctors() {
		return doctors;
	}

	public void setDoctors(Set<Doctors> doctors) {
		this.doctors = doctors;
	}

	public Providers() {

	}

	public Providers(String provider_id, String provider_name, String hospital_name, String email, String address,
			String city, String state, String zip_code, ProviderStatus status, Date created_at, Set<Doctors> doctors) {
		super();
		this.provider_id = provider_id;
		this.provider_name = provider_name;
		this.hospital_name = hospital_name;
		this.email = email;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip_code = zip_code;
		this.status = status;
		this.created_at = created_at;
		this.doctors = doctors;
	}

//	@Override
//	public String toString() {
//		return "Providers [provider_id=" + provider_id + ", provider_name=" + provider_name + ", hospital_name="
//				+ hospital_name + ", email=" + email + ", address=" + address + ", city=" + city + ", state=" + state
//				+ ", zip_code=" + zip_code + ", status=" + status + ", created_at=" + created_at + ", doctors="
//				+ doctors + "]";
//	}

}
