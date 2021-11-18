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
import com.wdelivery.admin.vo.AdminBannerVO;
import com.wdelivery.admin.vo.AdminCouponVO;
import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.menu.burger.vo.BurgerVO;
import com.wdelivery.news.utils.Criteria;
import com.wdelivery.news.utils.PageMaker;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private AdminStoreService adminStoreService;
	
	@GetMapping("/index.mdo")
	public String indexView(Model model,HttpSession session, Criteria cri) {
		List<AdminVO> adminList =  adminService.indexView(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(100);
		//List<PaymentVO> paymentVO = new ArrayList<PaymentVO>();
		model.addAttribute("adminList",adminList);
		model.addAttribute("pageMaker", pageMaker);
		//System.out.println("index: " + ((PaymentVO) paymentVO).getOrder_seq());

		return "index";
	}
	
	@PostMapping("/adminCheck.mdo")
	@ResponseBody
	public int adminCheck(@RequestParam(name="admin_id", required=false) String admin_id, 
			@RequestParam(name="store_name", required=false) String store_name,
			@RequestParam(name="store_code", required=false) String store_code) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("admin_id", admin_id);
		map.put("store_name", store_name);
		map.put("store_code", store_code);
		
		int id_check = adminStoreService.selectStore(map);
		if(id_check == 1)
			return 1;
		
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
	
	//쿠폰함
	@GetMapping("/layout-sidenav-light.mdo")
	public String layout(Model model) {
		List<AdminCouponVO> vo = adminService.selectCoupon();
		model.addAttribute("vo", vo);
		return "layout-sidenav-light";
	}
	
	//회원정보 게시판
	@GetMapping("/layoutStatic.mdo")
	public String layoutStatic(Model model, Criteria cri) {
		List<UserVO> userInfo = adminService.userSelect(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(100);
		
		model.addAttribute("userInfo" , userInfo);
		model.addAttribute("pageMaker", pageMaker);
		return "layout-static";
	}
	
	@GetMapping("/addcoupon.mdo")
	public String addcoupon() {
		return "addcoupon";
	}
	
	@PostMapping("/couponCheck.mdo")
	@ResponseBody
	public int couponCheck(@RequestParam(name="coupon_code", required=false) String coupon_code,AdminCouponVO addcoupon){
		if(coupon_code != null) {
			int code_check = adminService.couponCheck(coupon_code);
			if(code_check == 1) 
				return 1;
		} 
		return 0;
	}
	
	
	@PostMapping("/addcouponInsert.mdo")
	public String addcoupon(AdminCouponVO addcoupon) {
		adminService.addCoupon(addcoupon);
		System.out.println(addcoupon.toString());
		return "redirect:layout-sidenav-light.mdo";
	}

	
	@GetMapping("/banner.mdo")
	public List<AdminBannerVO> bannerList(Model model) {
		List<AdminBannerVO> bannerList = adminService.selectBannerList();
		model.addAttribute("bannerList",bannerList);
		return bannerList;
	}
	@GetMapping("/bannerRegister.mdo")
	public String bannerRegister(Model model) {
		return "bannerRegister";
	}
	
	@GetMapping("/burger.mdo")
	public String viewBurger(Model model){
		List<BurgerVO> burgerList = adminService.viewBurger();
		model.addAttribute("burgerVO", burgerList);
		return "burger";
	}

}
