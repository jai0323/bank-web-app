package com.banking.beans;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="branch")
@Table(name="branch")
public class Branch {
    @Id
	int branchCode;
	String name,city,state,ifsc;
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
	public String getIfsc() {
		return ifsc;
	}
	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}
	public Branch(int branchCode, String name, String city, String state, String ifsc) {
		super();
		this.branchCode = branchCode;
		this.name = name;
		this.city = city;
		this.state = state;
		this.ifsc = ifsc;
	}
	public Branch(String name, String city, String state) {
		super();
		this.name = name;
		this.city = city;
		this.state = state;
	}
	public Branch() {
		 
	}
	
}
