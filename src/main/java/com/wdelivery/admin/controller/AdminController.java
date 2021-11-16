package com.wdelivery.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wdelivery.admin.service.AdminService;
import com.wdelivery.admin.service.AdminStoreService;


import com.wdelivery.admin.vo.AdminCouponVO;

import com.wdelivery.member.payment.vo.PaymentVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private AdminStoreService adminStoreService;
//	@GetMapping("/index.mdo")
//	public String index() {
//		return "index";
//	}
	
	@GetMapping("/index.mdo")
	public String indexView(Model model,HttpSession session) {
		List<PaymentVO> paymentList =  adminService.indexView();
		//List<PaymentVO> paymentVO = new ArrayList<PaymentVO>();
		model.addAttribute("paymentList",paymentList);
		System.out.println("인덱스");
		//System.out.println("index: " + ((PaymentVO) paymentVO).getOrder_seq());
		return "index";
	}
	
	@PostMapping("/adminCheck.mdo")
	@ResponseBody
	public int adminCheck(@RequestParam(name="admin_id", required=false) String admin_id, 
			@RequestParam(name="store_name", required=false) String store_name,
			@RequestParam(name="store_code", required=false) String store_code) {
		if(admin_id != null) {
			int id_check = adminStoreService.selectStore(admin_id);
			if(id_check == 1) 
				return 1;
		} else if(store_name != null) {
			int id_check = adminStoreService.selectStore(store_name);
			if(id_check == 1) 
				return 1;
		} else if(store_code != null) {
			int id_check = adminStoreService.selectStore(store_code);
			if(id_check == 1) 
				return 1;
		}
		
		return 0;
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
	
	@GetMapping("/addcoupon.mdo")
	public String addcoupon() {
		return "addcoupon";
	}
	@PostMapping("/addcouponInsert.mdo")
	public String addcoupon(AdminCouponVO addcoupon) {
		adminService.addCoupon(addcoupon);
		System.out.println(addcoupon.toString());
		return "layout-sidenav-light";
	}
}
