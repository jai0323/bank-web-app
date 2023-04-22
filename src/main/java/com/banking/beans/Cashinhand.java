package com.banking.beans;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="cashinhand")
@Table(name="cashinhand")
public class Cashinhand {
    @Id
    int branchCode;
	float balance;
	int status;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public float getBalance() {
		return balance;
	}
	public void setBalance(float balance) {
		this.balance = balance;
	}
	public int getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(int branchCode) {
		this.branchCode = branchCode;
	}
	public Cashinhand( float balance, int branchCode) {
		super();
		
		this.balance = balance;
		this.branchCode = branchCode;
	}
	
	public Cashinhand(int branchCode, float balance, int status) {
		super();
		this.branchCode = branchCode;
		this.balance = balance;
		this.status = status;
	}
	public Cashinhand(int branchCode, int status) {
		super();
		this.branchCode = branchCode;
		this.status = status;
	}
	public Cashinhand() {
		
	}
	
}
