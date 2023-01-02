package com.banking.beans;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="query")
@Table(name="query")
public class Query {
    @Id
	int q_id;
	
	String name,category,query,reply;

	public int getQ_id() {
		return q_id;
	}

	public void setQ_id(int q_id) {
		this.q_id = q_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public Query(int q_id, String name, String category, String query, String reply) {
	
		this.q_id = q_id;
		this.name = name;
		this.category = category;
		this.query = query;
		this.reply = reply;
	}

	public Query(String name, String category, String query) {
		
		this.name = name;
		this.category = category;
		this.query = query;
	}

	public Query() {
		
	}
	
}
