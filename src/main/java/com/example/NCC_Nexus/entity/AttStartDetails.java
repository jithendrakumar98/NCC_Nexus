package com.example.NCC_Nexus.entity;

import java.util.List;

public class AttStartDetails {
	
	List<String> batches;
	String session;
	public List<String> getBatches() {
		return batches;
	}
	public void setBatches(List<String> batches) {
		this.batches = batches;
	}
	public String getSession() {
		return session;
	}
	public void setSession(String session) {
		this.session = session;
	}
	public AttStartDetails(List<String> batches, String session) {
		this.batches = batches;
		this.session = session;
	}
	
	public AttStartDetails() {}
	
	

}
