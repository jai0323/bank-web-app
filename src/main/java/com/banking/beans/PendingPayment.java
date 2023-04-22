package com.banking.beans;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="pendingPayment")
@Table(name="pendingPayment")
public class PendingPayment {
	@Id
	String acc_no;
	float amount;
	String name;
	int status,branchCode;
	
	public int getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(int branchCode) {
		this.branchCode = branchCode;
	}
	public String getAcc_no() {
		return acc_no;
	}
	public void setAcc_no(String acc_no) {
		this.acc_no = acc_no;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public PendingPayment(String acc_no, float amount, String name, int status, int branchCode) {
		super();
		this.acc_no = acc_no;
		this.amount = amount;
		this.name = name;
		this.status = status;
		this.branchCode = branchCode;
	}
	public PendingPayment() {
		
	}
	
}
