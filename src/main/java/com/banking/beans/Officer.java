package com.banking.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "officer")
@Table(name = "officer")
public class Officer {
	@Id
	String emailid;
	
	
	String name,password;
	
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Officer( String emailid, String name, String password) {
		
		
		this.emailid = emailid;
		this.name = name;
		this.password = password;
	}
	public Officer() {
		
	}
	@Override
	public String toString() {
		return "Officer [ emailid=" + emailid + ", name=" + name + ", password=" + password + "]";
	}
	
	
}
