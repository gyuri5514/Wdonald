package com.wdelivery.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wdelivery.admin.service.AdminLoginService;
import com.wdelivery.admin.vo.AdminVO;

@Controller
public class AdminLoginController {
	
	@Autowired
	private AdminLoginService adminLoginService;
	
	@GetMapping("/login.mdo")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login.mdo")
	public String login(AdminVO adminVO, HttpSession session, Model model) {

		System.out.println(adminVO.toString());

		if(!adminVO.getAdmin_id().equals("") && adminVO.getAdmin_id() != null &&
				!adminVO.getAdmin_password().equals("") && adminVO.getAdmin_password() != null) {

			AdminVO findAdminVO = adminLoginService.findAdmin(adminVO); 
			if(findAdminVO == null) { //not id 
				System.out.println("not id");
				model.addAttribute("status", 1);
				return "login";
			}
			if(adminVO.getAdmin_password().equals(findAdminVO.getAdmin_password())) {
				model.addAttribute("status", 2);
			}else {
				System.out.println("password x");
				model.addAttribute("status", 3);
				return "login";
			}

		}


		return "index";
	}
	@GetMapping("register.mdo")
	public String register() {
		return "register";
	}
}
