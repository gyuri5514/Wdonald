package com.wdelivery.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreSalesController {

	@GetMapping("/charts.sdo")
	public String charts() {
		return "charts";
	}
	
	@GetMapping("tables.sdo")
	public String tables() {
		return "tables";
	}
}
