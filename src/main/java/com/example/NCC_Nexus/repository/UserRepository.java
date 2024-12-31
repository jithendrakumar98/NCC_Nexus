package com.example.NCC_Nexus.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.NCC_Nexus.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
	public User findByUsername(String username);
	
	@Query("SELECT COUNT(u) FROM User u WHERE u.college = :clg and u.gender='Male'")
	public int clg_sd_count(String clg);
	
	@Query("SELECT COUNT(u) FROM User u WHERE u.college = :clg and u.gender='Female'")
	public int clg_sw_count(String clg);
	
	@Query("SELECT u FROM User u where u.college=:clg AND u.role='ANO'")
	public List<User> clg_ano(String clg);
	
	@Query("SELECT COUNT(u) FROM User u where u.batch=:name AND u.gender='Male'")
	public int bt_sd_count(String name);
	
	@Query("SELECT COUNT(u) FROM User u where u.batch=:name AND u.gender='Female'")
	public int bt_sw_count(String name);
	
	@Query("Select u from User u where u.role=:role")
	public List<User> getByRole(String role);
	
	@Query("SELECT u FROM User u where u.superior=:ano and u.batch=:batch")
	public List<User> get_ano_cadets_by_batch(String ano,String batch);
	
	public List<User> findByBatch(String batch);
	
	@Query("SELECT u from User u where u.role='CADET' and u.college=:college")
	public List<User> getClgCadets(String college);
	
	@Query("SELECT u from User u where u.role='CADET' and u.superior=:ano")
	public List<User> getAnoCadets(String ano);
	
	public User findById(int id);
}
