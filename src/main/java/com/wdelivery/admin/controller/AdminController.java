package com.wdelivery.admin.controller;


import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wdelivery.admin.service.AdminService;
import com.wdelivery.admin.service.AdminStoreService;
import com.wdelivery.admin.util.AwsS3;
import com.wdelivery.admin.vo.AdminBannerVO;
import com.wdelivery.admin.vo.AdminCouponVO;
import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.menu.burger.service.BurgerService;
import com.wdelivery.menu.burger.vo.BurgerVO;
import com.wdelivery.menu.burgerLgSet.service.BurgerLgSetService;
import com.wdelivery.menu.burgerLgSet.vo.BurgerLgSetVO;
import com.wdelivery.menu.burgerSet.service.BurgerSetService;
import com.wdelivery.menu.burgerSet.vo.BurgerSetVO;
import com.wdelivery.news.utils.Criteria;
import com.wdelivery.news.utils.PageMaker;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private AdminStoreService adminStoreService;
	
	@Autowired
	private BurgerService burgerService;
	@Autowired
	private BurgerSetService burgerSetService;
	@Autowired
	private BurgerLgSetService burgerLgSetService;
	
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
		for(int i=0; i>vo.size(); i++) {
			if(vo.get(i).getCoupon_canuse()==0) {
				vo.get(i).setCoupon_check("Y");
			} else
				vo.get(i).setCoupon_check("N");
		}
		
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
	public String bannerList(Model model) {
		List<AdminBannerVO> bannerList = adminService.selectBannerList();
		model.addAttribute("bannerList",bannerList);
		return "banner";
	}
	@GetMapping("/bannerRegister.mdo")
	public String bannerRegister(Model model) {
		List<AdminBannerVO> bannerList = adminService.selectBannerList();
		model.addAttribute("bannerList",bannerList);
		return "bannerRegister";
	}

	@PostMapping("/bannerRegister.mdo")
	public String bannerInsert(@RequestParam(name="file")MultipartFile file, AdminBannerVO bannerVO) throws IOException{
		AwsS3 awsS3 = AwsS3.getInstance();
		String uploadFolder = "https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/";
		String key = "img/banner/" + file.getOriginalFilename();
		InputStream is = file.getInputStream();
        String contentType = file.getContentType();
        long contentLength = file.getSize();
        awsS3.upload(is, key, contentType, contentLength);
        
        bannerVO.setBanner_img(uploadFolder + key);
        
		adminService.bannerInsert(bannerVO);
		
		return "redirect:banner.mdo";
	}

	
	@GetMapping("/burger.mdo")
	public String viewBurger(Model model){
		List<BurgerVO> burgerList = adminService.viewBurger();
		model.addAttribute("burgerVO", burgerList);
		return "burger";
	}

	@GetMapping("/burgerRegister.mdo")
	public String burgerRegister(Model model) {
		return "burgerRegister";
	}
	
	@PostMapping("/burgerRegister.mdo")
	public String burgerInsert(@RequestParam(name="file")MultipartFile file,
			@RequestParam(name="burger_code") String burger_code,
			@RequestParam(name="burger_name") String burger_name,
			@RequestParam(name="burger_kcal") String burger_kcal,
			@RequestParam(name="burger_price") String burger_price,
			@RequestParam(name="burger_type") String burger_type,
			@RequestParam(name="burger_regdate") String burger_regdate,
			@RequestParam(name="burger_detail") String burger_detail) throws IOException, ParseException{
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		AwsS3 awsS3 = AwsS3.getInstance();
		String uploadFolder = "https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/";
		String key = "";
		if(burger_type.equals("단품")) {
			key = "img/hamburger/" + file.getOriginalFilename();
			BurgerVO burgerVO = new BurgerVO();
			burgerVO.setB_code(Integer.parseInt(burger_code));
			burgerVO.setB_img_path(uploadFolder + key);
			burgerVO.setB_name(burger_name);
			burgerVO.setB_price(Integer.parseInt(burger_price));
			burgerVO.setB_kcal(Integer.parseInt(burger_kcal));
			burgerVO.setB_regdate(fm.parse(burger_regdate));
			burgerVO.setB_detail_comment(burger_detail);
			burgerVO.setB_img(file.getOriginalFilename());
			burgerVO.setB_status(1);
			System.out.println(burgerVO.toString());
			burgerService.insertBurger(burgerVO);
		}
		else if(burger_type.equals("세트")) {
			key = "img/hamburger_set/" + file.getOriginalFilename();
			BurgerSetVO burgerSetVO = new BurgerSetVO();
			burgerSetVO.setB_set_code(Integer.parseInt(burger_code));
			burgerSetVO.setB_set_img_path(uploadFolder + key);
			burgerSetVO.setB_set_name(burger_name);
			burgerSetVO.setB_set_price(Integer.parseInt(burger_price));
			burgerSetVO.setB_set_kcal(Integer.parseInt(burger_kcal));
			burgerSetVO.setB_set_regdate(fm.parse(burger_regdate));
			burgerSetVO.setB_set_detail_comment(burger_detail);
			burgerSetVO.setB_set_img(file.getOriginalFilename());
			burgerSetVO.setB_set_status(1);
			burgerSetService.insertBurgerSet(burgerSetVO);
			
			BurgerLgSetVO burgerLgSetVO = new BurgerLgSetVO();
			burgerLgSetVO.setB_lgset_code(Integer.parseInt(burger_code));
			burgerLgSetVO.setB_lgset_img_path(uploadFolder + key);
			burgerLgSetVO.setB_lgset_name(burger_name);
			burgerLgSetVO.setB_lgset_price(Integer.parseInt(burger_price));
			burgerLgSetVO.setB_lgset_kcal(Integer.parseInt(burger_kcal));
			burgerLgSetVO.setB_lgset_regdate(fm.parse(burger_regdate));
			burgerLgSetVO.setB_lgset_detail_comment(burger_detail);
			burgerLgSetVO.setB_lgset_img(file.getOriginalFilename());
			burgerLgSetVO.setB_lgset_status(1);
			burgerLgSetService.insertBurgerLgSet(burgerLgSetVO);
		} 
		
		InputStream is = file.getInputStream();
        String contentType = file.getContentType();
        long contentLength = file.getSize();
        awsS3.upload(is, key, contentType, contentLength);
        
		return "redirect:burger.mdo";
	}
	
}
