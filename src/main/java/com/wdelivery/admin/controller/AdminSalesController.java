package com.wdelivery.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminSalesController {
	
	//chart
	@GetMapping("/charts.mdo")
	public String charts() {
		return "charts";
	}
	
	@GetMapping("tables.mdo")
	public String tables() {
		return "tables";
	}

}
