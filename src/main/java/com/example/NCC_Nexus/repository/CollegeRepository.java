package com.example.NCC_Nexus.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.NCC_Nexus.entity.College;

@Repository
public interface CollegeRepository extends JpaRepository<College, Integer>{
	
}
