package com.example.NCC_Nexus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.NCC_Nexus.entity.AttendanceRegister;
import com.example.NCC_Nexus.entity.User;
import com.example.NCC_Nexus.repository.AttendanceRegisterRepository;

@Service
public class AttendanceRegisterService {
	
	@Autowired
	private AttendanceRegisterRepository arr;
	
	public void update(long id,String action,String reg) {
		AttendanceRegister ar=arr.findById(id);
		 List<String> p = ar.getPresent() != null 
				 ? new ArrayList<>(ar.getPresent()) 
						 : new ArrayList<>();
		    List<String> a = ar.getAbsent() != null 
		    		? new ArrayList<>(ar.getAbsent()) 
		    				: new ArrayList<>();
		if(action.equals("p")) {
			a.remove(reg);
			p.add(reg);
		}
		else {
			p.remove(reg);
			a.add(reg);
		}
		
		ar.setAbsent(a);
		ar.setPresent(p);
		arr.save(ar);
	}
	
	public List<AttendanceRegister> getAllAtt(){
		return arr.findAll();
	}
	
	public AttendanceRegister getById(long id) {
		return arr.findById(id);
	}
	
	public void addAttSession(AttendanceRegister ar) {
		arr.save(ar);
	}
	
	public AttendanceRegister getRunningAtt() {
		if(arr.findByStatus(0).size()==0) return null;
		AttendanceRegister ar=arr.findByStatus(0).get(0);
		return ar;
	}
	
	public void abort() {
		arr.delete(getRunningAtt());
	}
	
	public void conclude() {
		AttendanceRegister ar=getRunningAtt();
		ar.setStatus(1);
		arr.save(ar);
	}
	
	public List<AttendanceRegister> findByAno(String ano){
		List<AttendanceRegister> ar = arr.findByAno(ano) != null 
				 ? new ArrayList<>(arr.findByAno(ano)) 
						 : new ArrayList<>();
		
		return ar;
	}
	
	public List<AttendanceRegister> getPresentListOfCadet(String cadet){
		List<AttendanceRegister> ar=arr.findPresentSessinsofCadet(cadet) != null 
				 ? new ArrayList<>(arr.findPresentSessinsofCadet(cadet)) 
						 : new ArrayList<>();
		
		return ar;
	}
	
	public List<AttendanceRegister> getAbsentListOfCadet(String cadet){
		List<AttendanceRegister> ar=arr.findabsentSessinsofCadet(cadet) != null 
				 ? new ArrayList<>(arr.findabsentSessinsofCadet(cadet)) 
						 : new ArrayList<>();
		
		return ar;
	}
	
	public List<AttendanceRegister> getCadetSessions(String cadet){
		List<AttendanceRegister> ar=arr.findCadetSessions(cadet) != null 
				 ? new ArrayList<>(arr.findCadetSessions(cadet)) 
						 : new ArrayList<>();
		return ar;
	}

}
