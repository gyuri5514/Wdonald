package com.wdelivery.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.store.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	@GetMapping("/index.sdo")
	public String index() {
		return "index";
	}
	
	//adminUpdate
	@GetMapping("/adminUpdate.sdo")
	public String adminUpdate() {
		return "register";
	}
	
	@GetMapping("/adminUpdatedo.sdo")
	public String adminUpdate(HttpSession session, AdminVO adminVO) {
		AdminVO admin = (AdminVO) session.getAttribute("admin");
		if(admin != null) {
			int admin_seq = admin.getAdmin_seq();
			adminVO.setAdmin_seq(admin_seq);
			storeService.adminUpdate(adminVO);
		}
		return "redirect:index.sdo";
	}
	
	//errorPage
	@GetMapping("/401.sdo")
	public String error401() {
		return "401";
	}
	@GetMapping("/404.sdo")
	public String error404() {
		return "404";
	}
	@GetMapping("/500.sdo")
	public String error500() {
		return "500";
	}

	//?
	@GetMapping("/layout-sidenav-light.sdo")
	public String layout() {
		return "layout-sidenav-light";
	}
	
	//store 1:1 °í°´¹®ÀÇ
	@GetMapping("/layoutStatic.sdo")
	public String layoutStatic() {
		
		
		return "layout-static";
	}
}
