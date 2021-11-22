package com.wdelivery.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.store.service.StoreSalesService;

@Controller
public class StoreSalesController {
	
	@Autowired 
	StoreSalesService storeSalesService;
	
	
	@GetMapping("tables.sdo")
	public String tables(@RequestParam(name="order_seq", defaultValue = "0") int order_seq, @RequestParam(name="order_status", defaultValue = "0") String order_status,
			Model model, HttpSession session, PaymentVO paymentVO) {
		AdminVO adminVO = (AdminVO) session.getAttribute("admin");
		if(adminVO == null) {
			model.addAttribute("error",1);
			return "index";
		}
		List<PaymentVO> orderList = storeSalesService.orderList(adminVO);
		model.addAttribute("orderList", orderList);
		if(order_seq > 0) {
			storeSalesService.orderStatus(paymentVO);
		}
		
		
		return "tables";
	}
	@GetMapping("orderCancel.sdo")
	public String orderCancel(PaymentVO paymentVO, Model model, HttpSession session) {
		AdminVO adminVO = (AdminVO) session.getAttribute("admin");
		if(adminVO != null) {
			System.out.println(adminVO.getStore_code());
			List<PaymentVO> orderCancel = storeSalesService.orderCancel(adminVO.getStore_code());
			System.out.println("cancelView : " + orderCancel.toString());
			model.addAttribute("orderCancel", orderCancel);
		}else {
			return "redirect:login.mdo";
		}
		return "orderCancel";
	}
	
	
}
