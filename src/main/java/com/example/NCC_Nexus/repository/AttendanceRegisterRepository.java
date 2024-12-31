package com.example.NCC_Nexus.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.NCC_Nexus.entity.AttendanceRegister;

@Repository
public interface AttendanceRegisterRepository extends JpaRepository<AttendanceRegister, Long>{
	public AttendanceRegister findById(long id);
	
	public List<AttendanceRegister> findByStatus(int status);
	
	public List<AttendanceRegister> findByAno(String ano);
	
	@Query("SELECT a from AttendanceRegister a where :cadet MEMBER OF a.present")
	public List<AttendanceRegister> findPresentSessinsofCadet(String cadet);
	
	@Query("SELECT a from AttendanceRegister a where :cadet MEMBER OF a.absent")
	public List<AttendanceRegister> findabsentSessinsofCadet(String cadet);
	
	@Query("SELECT a from AttendanceRegister a where :cadet MEMBER OF a.absent or :cadet MEMBER OF a.present")
	public List<AttendanceRegister> findCadetSessions(String cadet);
}
