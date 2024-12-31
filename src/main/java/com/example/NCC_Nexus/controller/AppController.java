package com.example.NCC_Nexus.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.NCC_Nexus.entity.AttStartDetails;
import com.example.NCC_Nexus.entity.AttendanceRegister;
import com.example.NCC_Nexus.entity.Batch;
import com.example.NCC_Nexus.entity.Camp;
import com.example.NCC_Nexus.entity.Campid;
import com.example.NCC_Nexus.entity.College;
import com.example.NCC_Nexus.entity.User;
import com.example.NCC_Nexus.service.AttendanceRegisterService;
import com.example.NCC_Nexus.service.BatchService;
import com.example.NCC_Nexus.service.CampService;
import com.example.NCC_Nexus.service.CollegeService;
import com.example.NCC_Nexus.service.UserService;

@Controller
public class AppController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CollegeService collegeService;
	
	@Autowired
	private BatchService batchService;
	
	@Autowired
	private AttendanceRegisterService ars;
	
	@Autowired
	private CampService campService;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/home")
	public String home(Principal principal,Model model) {
		User user=userService.findByUsername(principal.getName());
		if(user.getRole().equals("CADET")) {
			model.addAttribute("user", user);
			return "cadetHome";
		}
		else if(user.getRole().equals("ANO")) {
			String st,stt;
			if(ars.getRunningAtt()==null) { st="no";stt="yes";}
			else { st="yes";stt="no";}
			model.addAttribute("st", st);
			model.addAttribute("stt", stt);
			model.addAttribute("user", user);
			model.addAttribute("batches", batchService.getActiveBatches());
			return "anoHome";
		}
		model.addAttribute("user", user);
		return "coHome";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/college/colleges")
	public String colleges(Model model) {
		List<College> clgs=collegeService.getAllColleges();
		List<List<String>> clgex=new ArrayList<List<String>>();
		for(College clg:clgs) {
			clgex.add(userService.clg_ext_list(clg.getName()));
		}
		model.addAttribute("clg", clgs);
		model.addAttribute("clgex", clgex);
		return "colleges";
	}
	
	@PostMapping("/college/addClg")
	public String addClg(@ModelAttribute("clg") College clg) {
		collegeService.addClg(clg);
		return "redirect:/college/colleges";
	}
	
	@GetMapping("/college/view/{name}")
	public String viewCollege(@PathVariable("name") String college,Model model) {
		List<User> cadets=userService.getClgCadets(college)!=null?
				userService.getClgCadets(college):
					new ArrayList<User>();
		model.addAttribute("cadets", cadets);
		model.addAttribute("ano", userService.getClgAno(college));
		return "viewCollege";
	}
	
	@GetMapping("/ano/anos")
	public String anos(Model model) {
		List<User> anos=userService.getByRole("ANO");
		model.addAttribute("anos", anos);
		List<College> clgs=collegeService.getAllColleges();
		model.addAttribute("clgs", clgs);
		return "anos";
	}
	
	@PostMapping("/ano/addAno")
	public String addAno(@ModelAttribute("ano") User ano) {
		userService.addUser(ano);
		return "redirect:/ano/anos";
	}
	
	@GetMapping("/ano/viewCadets/{id}")
	public String anoCadets(@PathVariable("id") int id,Model model) {
		User u=userService.findById(id);
		String ano=u.getUsername();
		List<User> cadets=userService.getAnoCadets(ano)!=null?
				userService.getAnoCadets(ano):
					new ArrayList<User>();
		model.addAttribute("cadets", cadets);
		return "anoCadets";
	}
	
	@GetMapping("/batch/batches")
	public String batches(Model model) {
		List<Batch> batches=batchService.getAllBatches();
		List<List<Integer>> bext=new ArrayList<List<Integer>>();
		for(Batch b:batches) {
			bext.add(userService.bt_ext_list(b.getName()));
		}
		model.addAttribute("bext", bext);
		model.addAttribute("batches", batches);
		return "batches";
	}
	
	@PostMapping("/batch/addBatch")
	public String addBatch(@ModelAttribute("batch") Batch batch) {
		batch.setName("Y"+batch.getName());
		batchService.addBatch(batch);
		return "redirect:/batch/batches";
	}
	
	@GetMapping("/batch/alter/{name}")
	public String alterBatchStatus(@PathVariable("name") String name) {
		batchService.alterBatchStatus(name);
		return "redirect:/batch/batches";
	}
	
	@GetMapping("/batch/view/{name}")
	public String viewBatch(@PathVariable String name,Model model) {
		List<User> cadets=userService.findByBatch(name);
		model.addAttribute("cadets", cadets);
		model.addAttribute("batch",name);
		List<String> att=new ArrayList<String>();
		for(User cadet:cadets) {
		List<AttendanceRegister> p = ars.getPresentListOfCadet(cadet.getUsername()) != null 
				 ? new ArrayList<>(ars.getPresentListOfCadet(cadet.getUsername())) 
						 : new ArrayList<>();
		    List<AttendanceRegister> a = ars.getAbsentListOfCadet(cadet.getUsername()) != null 
		    		? new ArrayList<>(ars.getAbsentListOfCadet(cadet.getUsername())) 
		    				: new ArrayList<>();
		    float pl=p.size(),al=a.size();
		    float per=pl+al==0 ?0:(pl*100)/(pl+al);
		    att.add(Float.toString(per)+"%");
		}
		model.addAttribute("att", att); 
		return "viewBatch";
	}
	
	@GetMapping("/cadet/cadets")
	public String cadets(Model model) {
		List<User> cadets=userService.getByRole("CADET");
		List<Batch> abs=batchService.getActiveBatches();
		model.addAttribute("cadets", cadets);
		model.addAttribute("abs", abs);
		List<String> att=new ArrayList<String>();
		for(User cadet:cadets) {
		List<AttendanceRegister> p = ars.getPresentListOfCadet(cadet.getUsername()) != null 
				 ? new ArrayList<>(ars.getPresentListOfCadet(cadet.getUsername())) 
						 : new ArrayList<>();
		    List<AttendanceRegister> a = ars.getAbsentListOfCadet(cadet.getUsername()) != null 
		    		? new ArrayList<>(ars.getAbsentListOfCadet(cadet.getUsername())) 
		    				: new ArrayList<>();
		    float pl=p.size(),al=a.size();
		    float per=pl+al==0 ?0:(pl*100)/(pl+al);
		    att.add(Float.toString(per)+"%");
		}
		model.addAttribute("att", att);
		return "cadets";
	}
	
	@PostMapping("/cadet/addCadet")
	public String addCadet(@ModelAttribute("cadet") User cadet,Principal principal) {
		User ano=userService.findByUsername(principal.getName());
		cadet.setSuperior(ano.getUsername());
		cadet.setCollege(ano.getCollege());
		cadet.setBranch(ano.getBranch());
		cadet.setUsername(cadet.getUsername().substring(7));
		String prefix="AP";
		prefix+=cadet.getBatch().substring(1);
		if(cadet.getGender().equals("Male")) {
			prefix+="SDA";
		}
		else {
			prefix+="SWA";
		}
		cadet.setUsername(prefix+cadet.getUsername());
		userService.addUser(cadet);
		return "redirect:/cadet/cadets";
	}
	
	@GetMapping("/cadet/view/{name}")
	public String cadetInfoByANO(@PathVariable String name,Model model,Principal principal) {
		User cadet=userService.findByUsername(name);
		model.addAttribute("cadet", cadet);
		List<AttendanceRegister> ar = ars.getCadetSessions(name) != null 
				 ? new ArrayList<>(ars.getCadetSessions(name)) 
						 : new ArrayList<>();
		model.addAttribute("ar", ar);
		model.addAttribute("total", ar.size());
		float p=0,ab=0;
		List<List<String>> pa=new ArrayList<List<String>>();
		for(AttendanceRegister a:ar) {
			List<String> d=new ArrayList<String>();
			List<String> pr = a.getPresent() != null 
					 ? new ArrayList<>(a.getPresent()) 
							 : new ArrayList<>();
			if(pr.contains(cadet.getUsername())) {
				d.add("PRESENT");
				p++;
			}
			else {
				d.add("ABSENT");
				ab++;
			}
			Date date = a.getDate();
	        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
	        String dateString = formatter.format(date);
	        d.add(dateString);
	        pa.add(d);
		}
		model.addAttribute("p",(int)p);
		model.addAttribute("ab",(int)ab);
		float per=p+ab==0 ?0 :(p*100)/(p+ab);
		model.addAttribute("per",Float.toString(per)+"%");
		model.addAttribute("pa", pa);
		List<Camp> camps=campService.getAcceptedCamps(cadet.getUsername())!=null?
				campService.getAcceptedCamps(cadet.getUsername()):
					new ArrayList<Camp>();
		model.addAttribute("camps", camps);
		List<List<String>> campext=new ArrayList<List<String>>();
		for(Camp camp:camps) {
			List<String> c=new ArrayList<String>();
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			Date startdate = camp.getStartDate();
	        String start = formatter.format(startdate);
	        c.add(start);
	        Date enddate = camp.getEndDate();
	        String end = formatter.format(enddate);
	        c.add(end);
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(enddate);
	        calendar.add(Calendar.DATE, 1);
	        Date cur=new Date();
	        if(cur.before(startdate)) c.add("Scheduled");
	        else if(cur.before(enddate)) c.add("Running");
	        else c.add("Ended");
	        campext.add(c);
		}
		model.addAttribute("campext", campext);
		return "cadetInfoByANO";
	}
	
	@PostMapping("/attendance/startAttendance")
	public String attendanceStartDetails(
			@ModelAttribute("attStartDetails") AttStartDetails asd,
			Principal principal) {
		if(ars.getRunningAtt()!=null) return"redirect:/home";
		List<String> l=asd.getBatches();
		List<User> cadets=new ArrayList<User>();
		for(String s:l) {
			cadets.addAll(userService.get_ano_cadets_by_batch(principal.getName(), s));
		}
		AttendanceRegister ar=new AttendanceRegister();
		List<String> cdtRegs=new ArrayList<String>();
		for(User c:cadets) {
			cdtRegs.add(c.getUsername());
		}
		ar.setSession(asd.getSession());
		ar.setAbsent(cdtRegs);  
        LocalDateTime now = LocalDateTime.now();   
        Date date = Date.from(now.atZone(ZoneId.systemDefault()).toInstant());
        ar.setDate(date);
        ar.setStatus(0);
        ar.setAno(principal.getName());
        ars.addAttSession(ar);
		return "redirect:/attendance/currentAbsents";
	}
	
	@GetMapping("/attendance/currentAbsents")
	public String curAbsent(Model model) {
		AttendanceRegister ar=ars.getRunningAtt();
		if(ar==null) return"redirect:/home";
		List<String> p = ar.getPresent() != null 
				 ? new ArrayList<>(ar.getPresent()) 
						 : new ArrayList<>();
		    List<String> a = ar.getAbsent() != null 
		    		? new ArrayList<>(ar.getAbsent()) 
		    				: new ArrayList<>();
		List<List<String>> cdtDetails=new ArrayList<List<String>>();
		for(String s:a) {
			User cdt=userService.findByUsername(s);
			List<String> c=new ArrayList<String>();
			c.add(s);
			c.add(cdt.getName());
			c.add(cdt.getNumber());
			cdtDetails.add(c);
		}
		model.addAttribute("absents", cdtDetails);
		model.addAttribute("session", ar);
        Date date = ar.getDate();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        String dateString = formatter.format(date);
		model.addAttribute("date",dateString);
		model.addAttribute("p", p.size());
		model.addAttribute("a", a.size());
		model.addAttribute("t", p.size()+a.size());
		return "currentAbsents";
	}
	
	@GetMapping("/attendance/currentPresents")
	public String curPre(Model model) {
		AttendanceRegister ar=ars.getRunningAtt();
		if(ar==null) return"redirect:/home";
		List<String> p = ar.getPresent() != null 
				 ? new ArrayList<>(ar.getPresent()) 
						 : new ArrayList<>();
		    List<String> a = ar.getAbsent() != null 
		    		? new ArrayList<>(ar.getAbsent()) 
		    				: new ArrayList<>();
		List<List<String>> cdtDetails=new ArrayList<List<String>>();
		for(String s:p) {
			User cdt=userService.findByUsername(s);
			List<String> c=new ArrayList<String>();
			c.add(s);
			c.add(cdt.getName());
			c.add(cdt.getNumber());
			cdtDetails.add(c);
		}
		model.addAttribute("presents", cdtDetails);
		model.addAttribute("session", ar);
		Date date = ar.getDate();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        String dateString = formatter.format(date);
		model.addAttribute("date",dateString);
		model.addAttribute("p", p.size());
		model.addAttribute("a", a.size());
		model.addAttribute("t", p.size()+a.size());
		return "currentPresents";
	}
	
	@GetMapping("/attendance/present/{name}")
	public String makePresent(@PathVariable String name) {
		ars.update(ars.getRunningAtt().getId(),"p", name);
		return "redirect:/attendance/currentAbsents";
	}
	
	@GetMapping("/attendance/absent/{name}")
	public String makeAbsent(@PathVariable String name) {
		ars.update(ars.getRunningAtt().getId(),"a", name);
		return "redirect:/attendance/currentPresents";
	}
	
	@GetMapping("/attendance/abort")
	public String abort() {
		ars.abort();
		return"redirect:/home";
	}
	
	@GetMapping("/attendance/conclude")
	public String conclude() {
		ars.conclude();
		return "redirect:/home";
	}
	
	@GetMapping("/attendance/attendanceRegister")
	public String attendanceRegister(Principal principal,Model model) {
		List<AttendanceRegister> ar=ars.findByAno(principal.getName());
		model.addAttribute("ar", ar);
		List<List<String>> arext=new ArrayList<List<String>>();
		for(AttendanceRegister a:ar) {
			List<String> aext=new ArrayList<String>();
			Date date = a.getDate();
	        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
	        String dateString = formatter.format(date);
	        aext.add(dateString);
	        List<String> p = a.getPresent() != null 
					 ? new ArrayList<>(a.getPresent()) 
							 : new ArrayList<>();
			    List<String> ab = a.getAbsent() != null 
			    		? new ArrayList<>(a.getAbsent()) 
			    				: new ArrayList<>();
			    aext.add(Integer.toString(p.size()+ab.size()));
			    aext.add(Integer.toString(p.size()));
			    aext.add(Integer.toString(ab.size()));
			    arext.add(aext);
		}
		model.addAttribute("arext", arext);
		
		return "attendanceRegister";
	}
	
	@GetMapping("/attendance/presents/{id}")
	public String attendancePresents(@PathVariable int id,Model model) {
		AttendanceRegister ar=ars.getById(id);
		List<String> p = ar.getPresent() != null 
				 ? new ArrayList<>(ar.getPresent()) 
						 : new ArrayList<>();
		List<User> cadets=new ArrayList<User>();
		for(String s:p) {
			cadets.add(userService.findByUsername(s));
		}
		model.addAttribute("cadets", cadets);
		model.addAttribute("ar",ar);
		Date date = ar.getDate();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        String dateString = formatter.format(date);
        model.addAttribute("date", dateString);
		return "presentsOfSession";
		
	}
	
	@GetMapping("/attendance/absents/{id}")
	public String attendanceAbsents(@PathVariable int id,Model model) {
		AttendanceRegister ar=ars.getById(id);
		List<String> p = ar.getAbsent() != null 
				 ? new ArrayList<>(ar.getAbsent()) 
						 : new ArrayList<>();
		List<User> cadets=new ArrayList<User>();
		for(String s:p) {
			cadets.add(userService.findByUsername(s));
		}
		model.addAttribute("cadets", cadets);
		model.addAttribute("ar",ar);
		Date date = ar.getDate();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        String dateString = formatter.format(date);
        model.addAttribute("date", dateString);
		return "absentsOfSession";
		
	}
	
	@GetMapping("/camp/camps")
	public String camps(Model model,Principal principal) {
		List<Camp> camps=campService.getallCamps()!=null?
				campService.getallCamps():new ArrayList<Camp>();
		model.addAttribute("camps", camps);
		List<List<String>> campext=new ArrayList<List<String>>();
		for(Camp camp:camps) {
			List<String> c=new ArrayList<String>();
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			Date startdate = camp.getStartDate();
	        String start = formatter.format(startdate);
	        c.add(start);
	        Date enddate = camp.getEndDate();
	        String end = formatter.format(enddate);
	        c.add(end);
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(enddate);
	        calendar.add(Calendar.DATE, 1);
	        Date cur=new Date();
	        if(cur.before(startdate)) c.add("Scheduled");
	        else if(cur.before(enddate)) c.add("Running");
	        else c.add("Ended");
	        campext.add(c);
		}
		model.addAttribute("campext", campext);
		model.addAttribute("colleges",collegeService.getAllColleges());
		model.addAttribute("batches",batchService.getActiveBatches());
		
		
		User user=userService.findByUsername(principal.getName());
		return "camps"+user.getRole();
	}
	
	@PostMapping("/camp/addCamp")
	public String addCamp(@ModelAttribute("camp") Camp camp) {
		campService.addCamp(camp);
		return "redirect:/camp/camps";
	}
	
	@GetMapping("/camps/myCamps")
	public String cadetCamps(Model model,Principal principal) {
		List<Camp> camps=campService.getAcceptedCamps(principal.getName())!=null?
				campService.getAcceptedCamps(principal.getName()):new ArrayList<Camp>();
		List<Camp> acamps=campService.getApplicableCamps(principal.getName())!=null?
				campService.getApplicableCamps(principal.getName()):new ArrayList<Camp>();
		model.addAttribute("camps", camps);
		model.addAttribute("acamps", acamps);
		List<List<String>> campext=new ArrayList<List<String>>();
		for(Camp camp:camps) {
			List<String> c=new ArrayList<String>();
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			Date startdate = camp.getStartDate();
	        String start = formatter.format(startdate);
	        c.add(start);
	        Date enddate = camp.getEndDate();
	        String end = formatter.format(enddate);
	        c.add(end);
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(enddate);
	        calendar.add(Calendar.DATE, 1);
	        Date cur=new Date();
	        if(cur.before(startdate)) c.add("Scheduled");
	        else if(cur.before(enddate)) c.add("Running");
	        else c.add("Ended");
	        campext.add(c);
		}
		model.addAttribute("campext", campext);
		return "cadetCamps";
	}
	
	@PostMapping("/camps/applyCamp")
	public String applyCamp(@ModelAttribute("campid") Campid id,Principal principal) {
		campService.addCampRequest(id.getId(),principal.getName());
		return "redirect:/camps/myCamps";
	}
	
	@GetMapping("/myAttendance")
	public String attendance(Principal principal,Model model) {
		User cadet=userService.findByUsername(principal.getName());
		List<AttendanceRegister> ar=ars.getCadetSessions(cadet.getUsername())!=null?
				ars.getCadetSessions(cadet.getUsername()):new ArrayList<AttendanceRegister>();
		int total=ar.size();
		int pr=0;
		List<List<String>> arext=new ArrayList<List<String>>();
		for(AttendanceRegister a:ar) {
			List<String> pa=new ArrayList<String>();
			List<String> p=a.getPresent()!=null?a.getPresent():new ArrayList<String>();
			if(p.contains(cadet.getUsername())) { 
				pa.add("PRESENT");
				pr++;
			}
			else pa.add("ABSENT");
			
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			Date date = a.getDate();
	        String dt = formatter.format(date);
	        pa.add(dt);
	        arext.add(pa);
		}
		model.addAttribute("total", total);
		model.addAttribute("pr", pr);
		model.addAttribute("ab",total-pr);
		float per=(pr*100)/total;
		model.addAttribute("per",per+"%");
		model.addAttribute("ar", ar);
		model.addAttribute("arext", arext);
		return "cadetAttendance";
	}
	
	@GetMapping("/camp/cadets/{id}")
	public String campCadets(Principal principal,@PathVariable int id,Model model) {
		User user=userService.findByUsername(principal.getName());
		List<String> cdts=campService.getCampCadets(id)!=null?campService.getCampCadets(id)
				:new ArrayList<String>();
		List<User> cadets=new ArrayList<User>();
		if(user.getRole().equals("ANO")) {
		for(String c:cdts) {
			User cadet=userService.findByUsername(c);
			if(cadet.getSuperior().equals(user.getUsername())) cadets.add(cadet);
		}
		model.addAttribute("cadets", cadets);
		return "campCadetsANO";
		}
		for(String c:cdts) {
			User cadet=userService.findByUsername(c);
			cadets.add(cadet);
		}
		model.addAttribute("cadets", cadets);
		return "campCadetsCO";
		
	}
	
	@GetMapping("/camp/requests/{id}")
	public String campRequests(Principal principal,@PathVariable int id,Model model) {
		User user=userService.findByUsername(principal.getName());
		List<String> cdts=campService.getRequestsOfCamp(id)!=null?campService.getRequestsOfCamp(id)
				:new ArrayList<String>();
		List<User> cadets=new ArrayList<User>();
		for(String c:cdts) {
			User cadet=userService.findByUsername(c);
			if(cadet.getSuperior().equals(user.getUsername())) cadets.add(cadet);
		}
		model.addAttribute("vacancy",campService.getCollegeVacanciesOfCamp(id,user.getCollege()));
		model.addAttribute("campid",id);
		model.addAttribute("cadets", cadets);
		model.addAttribute("camp",campService.findById(id));
		String visibility="Visible",invisibility="Invisible";
		if(campService.findById(id).getType().equals("Limited") && campService.getCollegeVacanciesOfCamp(id,user.getCollege())==0) {
			visibility="Invisible";
			invisibility="Visible";
		}
		model.addAttribute("invisibility", invisibility);
		model.addAttribute("visibility",visibility);
		return "campRequests";
	}
	
	@GetMapping("/camp/requests/accept/{id}/{name}")
	public String acceptCampReq(@PathVariable("id") int id,@PathVariable("name") String name,Principal principal) {
		Camp camp=campService.findById(id);
		if(camp.getType().equals("Open") || (camp.getType().equals("Limited") && campService.getCollegeVacanciesOfCamp(id,userService.findByUsername(principal.getName()).getCollege())!=0));
		campService.acceptRequest(id, name,userService.findByUsername(principal.getName()).getCollege());
		return "redirect:/camp/requests/"+id;
	}
	
	@GetMapping("/camp/requests/reject/{id}/{name}")
	public String rejectCampReq(@PathVariable("id") int id,@PathVariable("name") String name) {
		campService.rejectRequest(id, name);
		return "redirect:/camp/requests/"+id;
	}
	
}
