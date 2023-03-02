package com.kient.model;

public class Member {

	private Long id;
	private String email;
	private String password;
	private String fullname;
	private String dob;
	private Byte gender;
	private String educationalLevel;
	private String address;
	private String city;
	private String district;
	private String ward;
	private String phone;

	public Member(Long id, String email, String password, String fullname, String dob, Byte gender,
			String educationalLevel, String address, String city, String district, String ward, String phone) {
		this.id = id;
		this.email = email;
		this.password = password;
		this.fullname = fullname;
		this.dob = dob;
		this.gender = gender;
		this.educationalLevel = educationalLevel;
		this.address = address;
		this.city = city;
		this.district = district;
		this.ward = ward;
		this.phone = phone;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public Byte getGender() {
		return gender;
	}

	public void setGender(Byte gender) {
		this.gender = gender;
	}

	public String getEducationalLevel() {
		return educationalLevel;
	}

	public void setEducationalLevel(String educationalLevel) {
		this.educationalLevel = educationalLevel;
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

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getWard() {
		return ward;
	}

	public void setWard(String ward) {
		this.ward = ward;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return id + ",\t" + email + ",\t" + password + ",\t" + fullname + ",\t" + dob + ",\t" + gender + ",\t"
				+ educationalLevel + ",\t" + address + ",\t" + city + ",\t" + district + ",\t" + phone;
	}

}
