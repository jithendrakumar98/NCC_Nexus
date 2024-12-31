package com.example.NCC_Nexus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.NCC_Nexus.entity.Camp;
import com.example.NCC_Nexus.entity.User;
import com.example.NCC_Nexus.repository.CampRepository;

@Service
public class CampService {
	
	@Autowired
	private CampRepository cr;
	
	@Autowired
	private UserService userService;
	
	public Camp findById(int id) {
		return cr.findById(id);
	}
	
	public void addCamp(Camp camp) {
		camp.setName(camp.getName()+"-"+camp.getId());
		cr.save(camp);
	}
	
	public List<Camp> getallCamps(){
		return cr.findAll();
	}
	
	public void addCampRequest(int id,String cadet) {
		Camp camp=cr.findById(id);
		List<String> cadets=camp.getCadets()!=null?camp.getCadets():new ArrayList<String>();
		List<String> status=camp.getStatus()!=null?camp.getStatus():new ArrayList<String>();
		cadets.add(cadet);
		status.add("Requested");
		camp.setStatus(status);
		camp.setCadets(cadets);
		cr.save(camp);
	}
	
	public List<Camp> getApplicableCamps(String cadet){
		List<Camp> camps=cr.getapplicableCamps(cadet)!=null?cr.getapplicableCamps(cadet):
			new ArrayList<Camp>();
		User cdt=userService.findByUsername(cadet);
		List<Camp> camp=new ArrayList<Camp>();
		for(Camp c:camps) {
			List<String> batches=c.getBatches()!=null?c.getBatches():new ArrayList<String>();
			if(batches.contains(cdt.getBatch())) camp.add(c);
		}
		return camp;
	}
	
	public List<Camp> getRequestedCamps(String cadet){
		List<Camp> camps=cr.getCampsofCadet(cadet);
		List<Camp> res=new ArrayList<Camp>();
		for(Camp camp:camps) {
			List<String> cadets=camp.getCadets()!=null?camp.getCadets():new ArrayList<String>();
			List<String> status=camp.getStatus()!=null?camp.getStatus():new ArrayList<String>();
			int i=cadets.indexOf(cadet);
			if(status.get(i).equals("Requested")) res.add(camp);
		}
		return res;
	}
	
	public List<Camp> getAcceptedCamps(String cadet){
		List<Camp> camps=cr.getCampsofCadet(cadet);
		List<Camp> res=new ArrayList<Camp>();
		for(Camp camp:camps) {
			List<String> cadets=camp.getCadets()!=null?camp.getCadets():new ArrayList<String>();
			List<String> status=camp.getStatus()!=null?camp.getStatus():new ArrayList<String>();
			int i=cadets.indexOf(cadet);
			if(status.get(i).equals("Accepted")) res.add(camp);
		}
		return res;
	}
	
	public void acceptRequest(int id,String cadet,String college) {
		Camp camp=cr.findById(id);
		List<String> cadets=camp.getCadets()!=null?camp.getCadets():new ArrayList<String>();
		List<String> status=camp.getStatus()!=null?camp.getStatus():new ArrayList<String>();
		int i=cadets.indexOf(cadet);
		List<String> colleges=camp.getColleges()!=null?camp.getColleges():new ArrayList<String>();
		List<Integer> vacancy=camp.getVacancies()!=null?camp.getVacancies():new ArrayList<Integer>();
		int in=colleges.indexOf(college);
		status.set(i, "Accepted");
		camp.setStatus(status);
		if(camp.getType().equals("Limited")) {
			vacancy.set(in,vacancy.get(in)-1);
		}
		camp.setVacancies(vacancy);
		cr.save(camp);
	}
	
	public void rejectRequest(int id,String cadet) {
		Camp camp=cr.findById(id);
		List<String> cadets=camp.getCadets()!=null?camp.getCadets():new ArrayList<String>();
		List<String> status=camp.getStatus()!=null?camp.getStatus():new ArrayList<String>();
		int i=cadets.indexOf(cadet);
		cadets.remove(i);
		status.remove(i);
		camp.setStatus(status);
		camp.setCadets(cadets);
		cr.save(camp);
	}
	
	public List<String> getRequestsOfCamp(int id) {
		List<String> cdts=new ArrayList<String>();
		Camp camp=cr.findById(id);
		List<String> cadets=camp.getCadets()!=null?camp.getCadets():new ArrayList<String>();
		List<String> status=camp.getStatus()!=null?camp.getStatus():new ArrayList<String>();
		for(int i=0;i<cadets.size();i++) {
			if(status.get(i).equals("Requested")) cdts.add(cadets.get(i));
		}
		return cdts;
	}
	
	public List<String> getCampCadets(int id){
		List<String> cdts=new ArrayList<String>();
		Camp camp=cr.findById(id);
		List<String> cadets=camp.getCadets()!=null?camp.getCadets():new ArrayList<String>();
		List<String> status=camp.getStatus()!=null?camp.getStatus():new ArrayList<String>();
		for(int i=0;i<cadets.size();i++) {
			if(status.get(i).equals("Accepted")) cdts.add(cadets.get(i));
		}
		return cdts;
	}
	
	public int getCollegeVacanciesOfCamp(int id,String college) {
		Camp camp=cr.findById(id);
		List<String> colleges=camp.getColleges()!=null?camp.getColleges():new ArrayList<String>();
		List<Integer> vacancy=camp.getVacancies()!=null?camp.getVacancies():new ArrayList<Integer>();
		int i=colleges.indexOf(college);
		return vacancy.get(i);
		
	}
}
