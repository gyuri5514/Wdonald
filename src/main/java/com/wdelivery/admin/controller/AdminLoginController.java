package com.wdelivery.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wdelivery.admin.service.AdminLoginService;
import com.wdelivery.admin.service.AdminService;
import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.store.chart.vo.ChartVO;
import com.wdelivery.store.service.ChartService;

import net.sf.json.JSONArray;

@Controller
public class AdminLoginController {
	
	@Autowired
	private AdminLoginService adminLoginService;
	@Autowired
	private ChartService chartService;
	@Autowired
	private AdminService adminService;

	@ModelAttribute("adminList")
	public List<AdminVO> getAdminList(){
		return adminService.indexView();
	}
	@ModelAttribute("storeSalesRank")
	public JSONArray getSalesRank(){
		ChartVO c = new ChartVO();
		SimpleDateFormat date = new SimpleDateFormat("yy-MM-dd");
	    Calendar week = Calendar.getInstance();
	    week.add(Calendar.DATE , -30);
	    String startDate= date.format(week.getTime());
	    c.setEnd_date(date.format(new Date()));
	    c.setStart_date(startDate);
		return JSONArray.fromObject(chartService.getSalesRank(c));
	}
	@ModelAttribute("chartList")
	public  List<ChartVO> getChart(ChartVO chart,Model model){
		SimpleDateFormat date = new SimpleDateFormat("yy-MM-dd");
	    Calendar week = Calendar.getInstance();
	    week.add(Calendar.DATE , -7);
	    String startDate= date.format(week.getTime());
	    chart.setEnd_date(date.format(new Date()));
	    chart.setStart_date(startDate);
	    
		List<ChartVO> chartList = chartService.getinitialChart(chart);
		model.addAttribute("chartList",JSONArray.fromObject(chartList));
	    model.addAttribute("start_date",chart.getStart_date());
	    model.addAttribute("end_date",chart.getEnd_date());
	   
	    if(chartList.size()!=0) {
	    	date = new SimpleDateFormat("MM-dd");
	    	if(chartList.get(chartList.size()-1).getDaily_chart().equals(date.format(new Date()))) {
	    		model.addAttribute("today_total",chartList.get(chartList.size()-1).getSales_amount());
    		}else{
    			model.addAttribute("today_total",0);
    		}
    	}else{
    		model.addAttribute("today_total",0);
    	}
	    model.addAttribute("pieList",JSONArray.fromObject(chartService.getPieChart(chart)));
	    return chartList;
	}
	
	@GetMapping("/login.mdo")
	public String login( HttpSession session) {
		if(session.getAttribute("store_admin") != null | session.getAttribute("admin") != null) {
//			session.removeAttribute("store_admin");
//			session.removeAttribute("admin");
			session.invalidate();
		}
		return "login";
	}
	
	@PostMapping("/login.mdo")
	public String login(AdminVO adminVO, HttpSession session, Model model) {
		//System.out.println(adminVO.toString());

		if(!adminVO.getAdmin_id().equals("") && adminVO.getAdmin_id() != null 
				&& !adminVO.getAdmin_password().equals("") && adminVO.getAdmin_password() != null) {

			AdminVO findAdminVO = adminLoginService.findAdmin(adminVO);
			
			if(adminVO.getAdmin_password().equals(findAdminVO.getAdmin_password())) { //success
				
				//System.out.println("1" + findAdminVO.toString());
				if(findAdminVO.getAdmin_seq() != 1) {
					//System.out.println("store admins" + findAdminVO.toString());
					session.setAttribute("store_admin", findAdminVO);
					return "redirect:index.sdo";
				}
				session.setAttribute("admin", findAdminVO);
				model.addAttribute("status", 2);
			} else {
				//System.out.println("password failed");
				model.addAttribute("status", 3);
				return "login";
			}
		}else {
			//System.out.println("login failed");
			model.addAttribute("status", 1);
			return "login";
		}
		
		return "index";
	}

	
	@GetMapping("register.mdo")
	public String register() {
		return "register";
	}
	
	@PostMapping("/registerInsert.mdo")
	public String register(AdminVO registerAdmin) throws Exception {
		adminLoginService.register(registerAdmin);
		
		return "redirect:index.mdo";
	}
	
	@RequestMapping("logout.mdo")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:login.mdo";
	}
	
	//storeUpdate
	@GetMapping("storeUpdate.mdo")
	public String storeUpdate(AdminVO adminVO, Model model) {
		adminVO = adminLoginService.storeUpdate(adminVO);
		model.addAttribute("storeDetail", adminVO);
		return "storeUpdate";
	}
	@PostMapping("storeUpdatedo.mdo") //하는 중
	public String storeUpdatedo(AdminVO adminVO) {
		System.out.println("?" + adminVO.toString());
		adminLoginService.storeUpdate(adminVO);
		
		return "storeUpdate";
	}
	
}
