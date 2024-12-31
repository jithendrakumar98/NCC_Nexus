 package com.example.NCC_Nexus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.NCC_Nexus.entity.Batch;
import com.example.NCC_Nexus.repository.BatchRepository;

@Service
public class BatchService {
	
	@Autowired
	private BatchRepository batchRepository;
	
	public List<Batch> getAllBatches(){
		return batchRepository.findAll();
	}
	
	public List<Batch> getActiveBatches(){
		return batchRepository.getActiveBatches();
	}
	
	public void alterBatchStatus(String name) {
		Batch batch=batchRepository.findByName(name);
		if(batch.getStatus().equals("ACTIVE")) batch.setStatus("INACTIVE");
		else batch.setStatus("ACTIVE");
		batchRepository.save(batch);
	}
	
	public void addBatch(Batch b) {
		batchRepository.save(b);
	}
	
	public Batch findByName(String name) {
		return batchRepository.findByName(name);
	}
	

}
