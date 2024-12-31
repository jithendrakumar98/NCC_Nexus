package com.example.NCC_Nexus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.NCC_Nexus.entity.College;
import com.example.NCC_Nexus.repository.CollegeRepository;

@Service
public class CollegeService {
	
	@Autowired
	private CollegeRepository collegeRepository;
	
	public void addClg(College clg) {
		collegeRepository.save(clg);
	}
	
	public List<College> getAllColleges(){
		return collegeRepository.findAll();
	}

}
