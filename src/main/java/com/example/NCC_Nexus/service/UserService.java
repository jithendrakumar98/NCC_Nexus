package com.example.NCC_Nexus.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.NCC_Nexus.entity.Batch;
import com.example.NCC_Nexus.entity.User;
import com.example.NCC_Nexus.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository ur;

	public UserService(UserRepository ur) {
		super();
		this.ur = ur;
	}
	
	public User findByUsername(String username) {
		return ur.findByUsername(username);
	}
	
	public List<String> clg_ext_list(String clg){
		List<String> l=new ArrayList<String>();
		l.add(Integer.toString(ur.clg_sd_count(clg)));
		l.add(Integer.toString(ur.clg_sw_count(clg)));
		List<User> anos=ur.clg_ano(clg);
		String ano="";
		for(User s:anos) ano+=s.getName()+"("+s.getUsername()+"),\n";
		l.add(ano);
		return l;
	}
	
	public List<Integer> bt_ext_list(String name){
		return List.of(ur.bt_sd_count(name),ur.bt_sw_count(name),ur.bt_sd_count(name)+ur.bt_sw_count(name));
	}
	
	public List<User> getByRole(String role){
		return ur.getByRole(role);
	}
	
	public void addUser(User user) {
		ur.save(user);
	}
	
	public List<String> get_Att_reg(String ano,List<Batch> batches){
		List<String> reg=new ArrayList<String>();
		for(Batch b:batches) {
			List<User> l=ur.get_ano_cadets_by_batch(ano, b.getName());
			for(User cadet:l) {
				reg.add(cadet.getUsername());
			}
		}
		return reg;	
	}
	
	public List<User> get_ano_cadets_by_batch(String ano,String batch){
		return ur.get_ano_cadets_by_batch(ano, batch);
	}
	
	public List<User> findByBatch(String batch){
		return ur.findByBatch(batch);
	}
	
	public List<User> getClgCadets(String college){
		return ur.getClgCadets(college);
	}
	
	public String getClgAno(String ano) {
		List<User> a=ur.clg_ano(ano);
		if(a==null) return "No ANO";
		return a.get(0).getName()+"("+a.get(0).getUsername()+")";
	}
	
	public List<User> getAnoCadets(String ano){
		return ur.getAnoCadets(ano);
	}
	
	public User findById(int id) {
		return ur.findById(id);
	}

}
