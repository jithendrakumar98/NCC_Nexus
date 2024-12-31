package com.example.NCC_Nexus.entity;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="attendanceregister")
public class AttendanceRegister {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	long id;
	
	String session;
	@ElementCollection
	List<String> present;
	@ElementCollection
	List<String> absent;
	int status;
	Date date;
	String ano;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getSession() {
		return session;
	}

	public void setSession(String session) {
		this.session = session;
	}

	public List<String> getPresent() {
		return present;
	}

	public void setPresent(List<String> present) {
		this.present = present;
	}

	public List<String> getAbsent() {
		return absent;
	}

	public void setAbsent(List<String> absent) {
		this.absent = absent;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getAno() {
		return ano;
	}

	public void setAno(String ano) {
		this.ano = ano;
	}

	public AttendanceRegister(long id, String session, List<String> present, List<String> absent, int status, Date date,
			String ano) {
		this.id = id;
		this.session = session;
		this.present = present;
		this.absent = absent;
		this.status = status;
		this.date = date;
		this.ano = ano;
	}

	public AttendanceRegister() {}
	
}
