package com.wdelivery.admin.controller;


import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wdelivery.admin.service.AdminService;
import com.wdelivery.admin.service.AdminStoreService;
import com.wdelivery.admin.util.AwsS3;
import com.wdelivery.admin.vo.AdminBannerVO;
import com.wdelivery.admin.vo.AdminBoardVO;
import com.wdelivery.admin.vo.AdminCouponVO;
import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.store.chart.vo.ChartVO;
import com.wdelivery.store.service.ChartService;

import net.sf.json.JSONArray;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private AdminStoreService adminStoreService;
	@Autowired
	private ChartService chartService;
	@ModelAttribute("adminList")
	public List<AdminVO> getAdminList(){
		return adminService.indexView();
	}
	@ModelAttribute("storeSalesRank")
	public JSONArray getSalesRank(){
		ChartVO c = new ChartVO();
		SimpleDateFormat date = new SimpleDateFormat("yy-MM-dd");
	    Calendar week = Calendar.getInstance();
	    week.add(Calendar.DATE , -30);
	    String startDate= date.format(week.getTime());
	    c.setEnd_date(date.format(new Date()));
	    c.setStart_date(startDate);
		return JSONArray.fromObject(chartService.getSalesRank(c));
	}
	
	@ModelAttribute("chartList")
	public  List<ChartVO> getChart(ChartVO chart,Model model){
		SimpleDateFormat date = new SimpleDateFormat("yy-MM-dd");
	    Calendar week = Calendar.getInstance();
	    week.add(Calendar.DATE , -7);
	    String startDate= date.format(week.getTime());
	    chart.setEnd_date(date.format(new Date()));
	    chart.setStart_date(startDate);
	    
		List<ChartVO> chartList = chartService.getinitialChart(chart);
		model.addAttribute("chartList",JSONArray.fromObject(chartList));
	    model.addAttribute("start_date",chart.getStart_date());
	    model.addAttribute("end_date",chart.getEnd_date());
	    model.addAttribute("today_total",chartList.get(chartList.size()-1).getSales_amount());
	    model.addAttribute("pieList",JSONArray.fromObject(chartService.getPieChart(chart)));
	    return chartList;
	}
	
	@GetMapping("/index.mdo")
	public String indexView(Model model,HttpSession session) {
		List<AdminVO> adminList =  adminService.indexView();
		ChartVO c = new ChartVO();
	    getChart(c,model);
		model.addAttribute("adminList",adminList);
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
	public String layoutStatic(Model model) {
		List<UserVO> userInfo = adminService.userSelect();
		/*
		 * PageMaker pageMaker = new PageMaker(); pageMaker.setCri(cri);
		 * pageMaker.setTotalCount(100);
		 */
		
		model.addAttribute("userInfo" , userInfo);
		//model.addAttribute("pageMaker", pageMaker);
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
		addcoupon.setCoupon_status(1);
		System.out.println(addcoupon.toString());
		return "redirect:layout-sidenav-light.mdo";
	}

	@PostMapping("/deleteCoupon.mdo")
	@ResponseBody
	public int deleteCoupon(AdminCouponVO deleteCoupon) {
		adminService.deleteUserCoupon(deleteCoupon);
		adminService.deleteCoupon(deleteCoupon);
		return 1;
	}
	
	@PostMapping("/statusCoupon.mdo")
	public String statusCoupon(@RequestParam(name="coupon_code") String coupon_code, @RequestParam(name="status") int status) {
//		Map<String,String> map = new HashMap<String,String>();
//		map.put("coupon_code", coupon_code);
//		map.put("status", status);
		AdminCouponVO vo = new AdminCouponVO();
		vo.setCoupon_code(coupon_code);
		vo.setCoupon_status(status);
		adminService.statusCoupon(vo);
		return "redirect:layout-sidenav-light.mdo";
	}
	
	@GetMapping("/board.mdo")
	public String Board(Model model) {
		List<AdminBoardVO> Board = adminService.selectBoard();
		model.addAttribute("Board", Board);
		return "board";
	}
	@GetMapping("/addboard.mdo")
	public String addboard() {
		return "addboard";
	}
	@PostMapping("/addboardInsert.mdo")
	public String addboard(AdminBoardVO addboard) {
		adminService.addBoard(addboard);
		System.out.println(addboard.toString());
		return "redirect:board.mdo";
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

}
