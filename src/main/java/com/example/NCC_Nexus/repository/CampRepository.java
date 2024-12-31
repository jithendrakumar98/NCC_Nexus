package com.example.NCC_Nexus.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.NCC_Nexus.entity.Camp;

@Repository
public interface CampRepository extends JpaRepository<Camp, Integer>{
	
	@Query("SELECT c from Camp c where :cadet MEMBER OF c.cadets")
	public List<Camp> getCampsofCadet(String cadet);
	
	public Camp findById(int id);
	
	@Query("SELECT c from Camp c where :cadet NOT MEMBER OF c.cadets")
	public List<Camp> getapplicableCamps(String cadet);
}
