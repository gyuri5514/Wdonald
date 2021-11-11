package com.wdelivery.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	@GetMapping("/index.mdo")
	public String index() {
		return "index";
	}
	
	//errorPage
	@GetMapping("/401.mdo")
	public String error401() {
		return "401";
	}
	@GetMapping("/404.mdo")
	public String error404() {
		return "404";
	}
	@GetMapping("/500.mdo")
	public String error500() {
		return "500";
	}
	
	//?
	@GetMapping("/layout-sidenav-light.mdo")
	public String layout() {
		return "layout-sidenav-light";
	}
	@GetMapping("/layoutStatic.mdo")
	public String layoutStatic() {
		return "layout-static";
	}
	

}
