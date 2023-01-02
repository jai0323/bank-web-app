package com.banking.beans;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="transaction")
@Table(name="transaction")
public class Transaction {
     @Id
	 int tran_id;
     
	 String receiver,sender,dot;
	 float amount;
	public int getTran_id() {
		return tran_id;
	}
	public void setTran_id(int tran_id) {
		this.tran_id = tran_id;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getDot() {
		return dot;
	}
	public void setDot(String dot) {
		this.dot = dot;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public Transaction(int tran_id, String receiver, String sender, String dot, float amount) {
	
		this.tran_id = tran_id;
		this.receiver = receiver;
		this.sender = sender;
		
		this.dot = dot;
		this.amount = amount;
	}
	
	public Transaction(String receiver, String sender, String dot, float amount) {
		
		this.receiver = receiver;
		this.sender = sender;
		
		this.dot = dot;
		this.amount = amount;
	}
	public Transaction() {
		
	}
	 
	 
}
