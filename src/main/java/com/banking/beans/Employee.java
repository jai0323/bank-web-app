package com.banking.beans;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="employee")
@Table(name="employee")
public class Employee {
    @Id
	String emp_id;
  int branchCode;
  String name,post,gender,email,address,city,state,pno,adhaar,pan,password;
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getEmp_id() {
	return emp_id;
}
public void setEmp_id(String emp_id) {
	this.emp_id = emp_id;
}
public int getBranchCode() {
	return branchCode;
}
public void setBranchCode(int branchCode) {
	this.branchCode = branchCode;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPost() {
	return post;
}
public void setPost(String post) {
	this.post = post;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
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
public String getPno() {
	return pno;
}
public void setPno(String pno) {
	this.pno = pno;
}
public String getAdhaar() {
	return adhaar;
}
public void setAdhaar(String adhaar) {
	this.adhaar = adhaar;
}
public String getPan() {
	return pan;
}
public void setPan(String pan) {
	this.pan = pan;
}
public Employee(String emp_id, int branchCode, String name, String post, String gender, String email, String address,
		String city, String state, String pno, String adhaar, String pan, String password) {
	super();
	this.emp_id = emp_id;
	this.branchCode = branchCode;
	this.name = name;
	this.post = post;
	this.gender = gender;
	this.email = email;
	this.address = address;
	this.city = city;
	this.state = state;
	this.pno = pno;
	this.adhaar = adhaar;
	this.pan = pan;
	this.password = password;
}
public Employee(int branchCode, String name, String post, String gender, String email, String address, String city,
		String state, String pno, String adhaar, String pan) {
	super();
	this.branchCode = branchCode;
	this.name = name;
	this.post = post;
	this.gender = gender;
	this.email = email;
	this.address = address;
	this.city = city;
	this.state = state;
	this.pno = pno;
	this.adhaar = adhaar;
	this.pan = pan;
}
public Employee() {
	
}
  

  
}
