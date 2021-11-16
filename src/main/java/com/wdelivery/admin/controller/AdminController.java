package com.wdelivery.admin.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wdelivery.admin.service.AdminService;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.paging.Criteria;
import com.wdelivery.paging.PageMaker;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/index.mdo")
	public String indexView(Model model,HttpSession session) {
		List<PaymentVO> paymentList =  adminService.indexView();
		//List<PaymentVO> paymentVO = new ArrayList<PaymentVO>();
		model.addAttribute("paymentList",paymentList);
		System.out.println("인덱스");
		//System.out.println("index: " + ((PaymentVO) paymentVO).getOrder_seq());
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
	public String layoutStatic(Model model, @RequestParam(value = "pageNum", required = false) Integer pageNum) {
		
		Criteria cri = new Criteria();
		cri.setPage(pageNum);
		cri.setPageStart();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.getUserContent());
		
		List<UserVO> userInfo = adminService.userSelect(cri);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("userInfo" , userInfo);
		
		/*
		 * for (UserVO vo : userInfo) { vo.getUser_seq(); vo.getUser_email();
		 * vo.getUser_name(); }
		 */
		
		model.addAttribute("pageMaker", pageMaker);
		//System.out.println("???" + userInfo.toString());
		return "layout-static";
	}
	

}
