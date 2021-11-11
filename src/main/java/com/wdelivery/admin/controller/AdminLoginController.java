package com.wdelivery.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminLoginController {

	@GetMapping("/login.mdo")
	public String login() {
		return "login";
	}
	@GetMapping("register.mdo")
	public String register() {
		return "register";
	}
}
