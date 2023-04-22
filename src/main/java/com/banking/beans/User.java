package com.banking.beans;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="user")
@Table(name="user")
public class User {
    @Id
	String acc_no;
	String name,emailid,password,gender,address,city,state,pno,adhaar,pan,verify,customer_id;
	float balance;	
	int branchCode;
	
	
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public int getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(int branchCode) {
		this.branchCode = branchCode;
	}
	public String getVerify() {
		return verify;
	}
	public void setVerify(String verify) {
		this.verify = verify;
	}
	public String getAcc_no() {
		return acc_no;
	}
	public void setAcc_no(String acc_no) {
		this.acc_no = acc_no;
	}
	
	public float getBalance() {
		return balance;
	}
	public void setBalance(float balance) {
		this.balance = balance;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public User(String name, String emailid, String password, String gender, String address, String city,
			String state, String pno, String adhaar, String pan) 
	{
		this.name = name;
		this.emailid = emailid;
		this.password = password;
		this.gender = gender;
		this.address = address;
		this.city = city;
		this.state = state;
		this.pno = pno;
		this.adhaar = adhaar;
		this.pan = pan;
		
		
	}
	public User() {
		
	}
	public User(String acc_no, String name, String emailid, String password, String gender, String address, String city,
			String state, String pno, String adhaar, String pan,int branchCode,String customer_id) {
		
		this.acc_no = acc_no;
		this.name = name;
		this.branchCode = branchCode;
		this.customer_id = customer_id;
		this.emailid = emailid;
		this.password = password;
		this.gender = gender;
		this.address = address;
		this.city = city;
		this.state = state;
		this.pno = pno;
		this.adhaar = adhaar;
		this.pan = pan;
	
	}
	public User(String acc_no, String name, String emailid, String password, String gender, String address, String city,
			String state, String pno, String adhaar, String pan, float balance, String verify) {
		
		this.acc_no = acc_no;
		this.name = name;
		this.emailid = emailid;
		this.password = password;
		this.gender = gender;
		this.address = address;
		this.city = city;
		this.state = state;
		this.pno = pno;
		this.adhaar = adhaar;
		this.pan = pan;
		this.balance = balance;
		this.verify=verify;
		
	}
	
	public User( String name, String emailid, String password, String gender, String address, String city,
			String state, String pno, String adhaar, String pan, float balance,String verify,int branchCode,String acc_no,String customer_id) {
		
		
		this.name = name;
		this.emailid = emailid;
		this.password = password;
		this.gender = gender;
		this.address = address;
		this.city = city;
		this.state = state;
		this.acc_no = acc_no;
		this.pno = pno;
		this.branchCode = branchCode;
		this.customer_id = customer_id;
		this.adhaar = adhaar;
		this.pan = pan;
		this.balance = balance;
		this.verify=verify;
	}
	
	
	
	
}
