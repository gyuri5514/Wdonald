package com.wdelivery.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.store.service.StoreSalesService;

@Controller
public class StoreSalesController {
	
	@Autowired StoreSalesService storeSalesService;

	@GetMapping("/charts.sdo")
	public String charts() {
		return "charts";
	}
	
	@GetMapping("tables.sdo")
	public String tables(Model model, HttpSession session) {
		AdminVO adminVO = (AdminVO) session.getAttribute("admin");
		if(adminVO != null) {
			List<PaymentVO> orderList = storeSalesService.orderList(adminVO);
			model.addAttribute("orderList", orderList);
		}
		
		return "tables";
	}
}
