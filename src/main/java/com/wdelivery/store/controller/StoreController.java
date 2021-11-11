package com.wdelivery.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreController {

	@GetMapping("/index.sdo")
	public String index() {
		return "index";
	}
	
	//Login
	@GetMapping("/login.sdo")
	public String login() {
		return "login";
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
	@GetMapping("/layoutStatic.sdo")
	public String layoutStatic() {
		return "layout-static";
	}
}
