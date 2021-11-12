package com.wdelivery.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
		
		if(!adminVO.getAdmin_id().equals("") && adminVO.getAdmin_id() != null 
				&& !adminVO.getAdmin_password().equals("") && adminVO.getAdmin_password() != null) {

			AdminVO findAdminVO = adminLoginService.findAdmin(adminVO);
			
			if(adminVO.getAdmin_password().equals(findAdminVO.getAdmin_password())) { //success
				session.setAttribute("admin", findAdminVO);
				System.out.println("1" + findAdminVO.toString());
				if(findAdminVO.getAdmin_seq() != 1) {
					System.out.println("store admins" + findAdminVO.toString());
					return "redirect:index.sdo";
				}
				model.addAttribute("status", 2);
			} else {
				System.out.println("password failed");
				model.addAttribute("status", 3);
				return "login";
			}
		}else {
			System.out.println("login failed");
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
		System.out.println(registerAdmin.toString());
		return "register";
	}
}
