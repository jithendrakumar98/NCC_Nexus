package com.example.NCC_Nexus.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.NCC_Nexus.entity.Batch;

@Repository
public interface BatchRepository extends JpaRepository<Batch, Integer>{
	
	@Query("SELECT b FROM Batch b where b.status='ACTIVE'")
	public List<Batch> getActiveBatches();
	
	public Batch findByName(String name);

}
