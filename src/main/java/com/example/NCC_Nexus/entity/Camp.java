package com.example.NCC_Nexus.entity;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.MapKeyColumn;
import jakarta.persistence.Table;

@Entity
@Table(name="camp")
public class Camp {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	String name;
	String place;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date endDate;
	@ElementCollection
	List<String> cadets;
	@ElementCollection
	List<String> status;
	@ElementCollection
	List<String> batches;
	@ElementCollection
	List<String> colleges;
	@ElementCollection
	List<Integer> vacancies;
	String type;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public List<String> getCadets() {
		return cadets;
	}

	public void setCadets(List<String> cadets) {
		this.cadets = cadets;
	}

	public List<String> getStatus() {
		return status;
	}

	public void setStatus(List<String> status) {
		this.status = status;
	}

	public List<String> getBatches() {
		return batches;
	}

	public void setBatches(List<String> batches) {
		this.batches = batches;
	}

	public List<String> getColleges() {
		return colleges;
	}

	public void setColleges(List<String> colleges) {
		this.colleges = colleges;
	}

	public List<Integer> getVacancies() {
		return vacancies;
	}

	public void setVacancies(List<Integer> vacancies) {
		this.vacancies = vacancies;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Camp(int id, String name, String place, Date startDate, Date endDate, List<String> cadets,
			List<String> status, List<String> batches, List<String> colleges, List<Integer> vacancies,String type) {
		this.id = id;
		this.name = name;
		this.place = place;
		this.startDate = startDate;
		this.endDate = endDate;
		this.cadets = cadets;
		this.status = status;
		this.batches = batches;
		this.colleges = colleges;
		this.vacancies = vacancies;
		this.type=type;
	}

	public Camp() {}

}
