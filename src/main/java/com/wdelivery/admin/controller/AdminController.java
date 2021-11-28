package com.wdelivery.admin.controller;


import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
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
import org.springframework.web.bind.annotation.RequestBody;
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
import com.wdelivery.faq.service.FaqService;
import com.wdelivery.faq.vo.FaqVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.news.service.NewsService;
import com.wdelivery.news.vo.NewsVO;
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
	
	@Autowired
	private FaqService faqService;
	
	@Autowired
	private NewsService newsService;
	
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
	public String indexView(AdminVO adminVO, Model model,HttpSession session) {
		adminVO = (AdminVO) session.getAttribute("admin");
		if(adminVO == null) {
			return "redirect:login.mdo";
		}
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
//	@GetMapping("/401.mdo")
//	public String error401() {
//		return "401";
//	}
//	@GetMapping("/404.mdo")
//	public String error404() {
//		return "404";
//	}
//	@GetMapping("/500.mdo")
//	public String error500() {
//		return "500";
//	}
	
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
		model.addAttribute("userInfo" , adminService.userSelect());
		return "layout-static";
	}
	//쿠폰 추가창
	@GetMapping("/addcoupon.mdo")
	public String addcoupon() {
		return "addcoupon";
	}
	//쿠폰 중복 체크 
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
	
	//쿠폰 추가
	@PostMapping("/addcouponInsert.mdo")
	public String addCoupon(AdminCouponVO addCoupon) {
		adminService.addCoupon(addCoupon);
		addCoupon.setCoupon_status(1);
		return "redirect:layout-sidenav-light.mdo";
	}
	//쿠폰 삭제
	@PostMapping("/deleteCoupon.mdo")
	@ResponseBody
	public int deleteCoupon(AdminCouponVO deleteCoupon) {
		adminService.deleteUserCoupon(deleteCoupon);
		adminService.deleteCoupon(deleteCoupon);
		return 1;
	}
	//쿠폰 사용가능여부 
	@PostMapping("/statusCoupon.mdo")
	public String statusCoupon(@RequestParam(name="coupon_code") String coupon_code, @RequestParam(name="status") int status) {
		AdminCouponVO vo = new AdminCouponVO();
		vo.setCoupon_code(coupon_code);
		vo.setCoupon_status(status);
		adminService.statusCoupon(vo);
		return "redirect:layout-sidenav-light.mdo";
	}
	//공지사항 관리함
	@GetMapping("/board.mdo")
	public String Board(Model model) {
		List<AdminBoardVO> Board = adminService.selectBoard();
		model.addAttribute("Board", JSONArray.fromObject(Board));
		model.addAttribute("BoardList", Board);
		return "board";
	}
	//공지사항 추가창
	@GetMapping("/addboard.mdo")
	public String addboard() {
		return "addboard";
	}
	//공지사항 추가
	@PostMapping("/addboardInsert.mdo")
	public String addboard(AdminBoardVO addboard) {
		adminService.addBoard(addboard);
		return "redirect:board.mdo";
	}
	//공지사항 삭제
	@GetMapping("/deleteBoard.mdo")
	public String deleteBoard(@RequestParam("notice_seq")int notice_seq) {
		adminService.deleteBoard(notice_seq);
		return "redirect:board.mdo";
	}
	//공지사항 수정
	@PostMapping("/boardUpdate.mdo")
	public String boardUpdate(AdminBoardVO boardUpdate) {
		adminService.boardUpdate(boardUpdate);
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
	
	@ResponseBody
	@PostMapping("deleteUser.mdo")
	public int deleteUser(@RequestBody UserVO userVO) {
		return adminService.deleteUser(userVO);
	} 
	
	@ResponseBody
	@PostMapping("suspendUser.mdo")
	public int suspendUser(@RequestBody UserVO userVO) {
		return adminService.supsendUser(userVO);
	} 
	
	//admin faq
	@GetMapping("/faqBoard.mdo")
	public String faqBoard(FaqVO faqVO, Model model, HttpSession session) {
		List<FaqVO> faqList = faqService.faqBoard(faqVO);
		model.addAttribute("faqList", faqList);
		
		return "faqBoard";
	}
	
	@GetMapping("/faqDetail.mdo")
	public String faqDetail(Model model, FaqVO faqVO) {
		faqVO = faqService.faqDetail(faqVO);
		model.addAttribute("faqDetail", faqVO);
		return "faqDetail";
	}
	
	@GetMapping("/updateFaq.mdo")
	public String updateFaq(FaqVO faqVO) {
		faqService.updateFaq(faqVO);
		return "redirect:faqBoard.mdo";
	}
	
	@GetMapping("/deleteFaq.mdo")
	public String deleteFaq(@RequestParam(name = "faq_seq")int faq_seq) {
		faqService.deleteFaq(faq_seq);
		return "redirect:faqBoard.mdo";
	}
	
	@GetMapping("/addFaq.mdo")
	public String addFaq(){
		
		return "addFaq";
	}
	@PostMapping("/addFaq.mdo")
	public String insertFaq(FaqVO faqVO){
		faqService.insertFaq(faqVO);
		return "redirect:faqBoard.mdo";
	}
	
	// admin news
	@GetMapping("/news.mdo")
	public String news(Model model, NewsVO newsVO, HttpSession session) {
		List<NewsVO> newsList = newsService.news(newsVO);
		model.addAttribute("newsList", newsList);
		
		return "news";
	}
	
	@GetMapping("/newsDetail.mdo")
	public String newsDetail(Model model, NewsVO newsVO) {
		newsVO = newsService.newsDetail(newsVO);
		model.addAttribute("newsDetail", newsVO);
		
		return "newsDetail";
	}
	
	@GetMapping("/updateNews.mdo")
	public String updateNews(NewsVO newsVO) {
		newsService.updateNews(newsVO);
		
		return "redirect:news.mdo";
	}
	
	@GetMapping("/deleteNews.mdo")
	public String deleteNews(@RequestParam(name = "news_code") int news_code) {
		newsService.deleteNews(news_code);
		
		return "redirect:news.mdo";
	}
	
	@GetMapping("/addNews.mdo")
	public String addNews() {
		return "addNews";
	}
	
//	@PostMapping("/addNews.mdo")
//	public String insertNews(NewsVO newsVO) {
//		newsVO.setNews_regdate(new Date());
//		newsService.insertNews(newsVO);
//		return "redirect:news.mdo";
//	}
	
	@PostMapping("/addNews.mdo")
	public String insertNews(@RequestParam(name = "file1") MultipartFile file1, 
			@RequestParam(name = "news_title") String news_title,
			@RequestParam(name = "news_content") String news_content) throws IOException, ParseException {
		
		AwsS3 awsS3 = AwsS3.getInstance();
		String uploadFolder = "https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/";
		String key1 = "";
		
		key1 = "img/news/" + file1.getOriginalFilename();
		NewsVO newsVO = new NewsVO();
		newsVO.setNews_title(news_title);
		newsVO.setNews_img_path(uploadFolder + key1);
		newsVO.setNews_content(news_content);
		
		newsService.insertNews(newsVO);
		
		InputStream is = file1.getInputStream();
		String contentType = file1.getContentType();
		long contentLength = file1.getSize();
		awsS3.upload(is,  key1, contentType, contentLength);
		
		return "redirect:news.mdo";
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "newscodeChk.mdo", method = RequestMethod.GET) public
	 * int newscodeChe(int news_code) { int news_codeResult = 0;
	 * 
	 * if (news_code >=) }
	 */
	
}
