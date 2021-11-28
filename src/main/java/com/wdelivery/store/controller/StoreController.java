package com.wdelivery.store.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wdelivery.admin.service.AdminLoginService;
import com.wdelivery.admin.vo.AdminNoticeVO;
import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.payment.vo.ToyCountVO;
import com.wdelivery.qna.vo.QaaVO;
import com.wdelivery.qna.vo.QnaVO;
import com.wdelivery.store.chart.vo.ChartVO;
import com.wdelivery.store.service.ChartService;
import com.wdelivery.store.service.StoreService;

import net.sf.json.JSONArray;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	@Autowired
	private ChartService chartService;
	@Autowired
	private AdminLoginService adminLoginService;
	
	public void getChart(ChartVO chart,Model model){
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
	    if(chartList.size()!=0) {
	    	date = new SimpleDateFormat("MM-dd");
	    	if(chartList.get(chartList.size()-1).getDaily_chart().equals(date.format(new Date()))) {
	    		model.addAttribute("today_total",chartList.get(chartList.size()-1).getSales_amount());
    		}else{
    			model.addAttribute("today_total",0);
    		}
    	}else{
    		model.addAttribute("today_total",0);
    	}
	    model.addAttribute("pieList",JSONArray.fromObject(chartService.getPieChart(chart)));
	}
	 
	@GetMapping("/index.sdo")
	public String index(AdminVO adminVO, ToyCountVO toyCountVO, Model model, HttpSession session) {
		adminVO = (AdminVO) session.getAttribute("store_admin");
		//System.out.println("bn" + adminVO.toString());
		
		if(adminVO==null)
			return "redirect:login.mdo";

		
		ChartVO c = new ChartVO();
	   c.setStore_code(adminVO.getStore_code());
	   getChart(c,model);

		model.addAttribute("status", adminVO.getStore_status());
		List<ToyCountVO> toyCountList = storeService.toyCountSelect(adminVO.getAdmin_seq());
		//System.out.println("index : " +	toyCountList.toString());
		model.addAttribute("toy", toyCountList);

		return "index";
	}
	@GetMapping("/storeStatus.sdo")
	@ResponseBody
	public AdminVO storeStatus(@RequestParam(name="store_status", defaultValue = "0") int store_status, AdminVO adminVO, HttpSession session, Model model) {		
		adminVO = (AdminVO) session.getAttribute("store_admin");
		if(adminVO == null) {
			model.addAttribute("error",1);
			return adminVO;
		}
		System.out.println("storeStatus : " + adminVO.toString() + "?" + store_status);
		adminVO.setStore_status(store_status);
		storeService.storeStatus(adminVO);
		return adminVO;
	}
	
	//adminUpdate
	@GetMapping("/adminUpdate.sdo")
	public String updateAdmin(HttpSession session,Model model) {
		AdminVO admin = (AdminVO) session.getAttribute("store_admin");
		if(admin == null) {
			model.addAttribute("error",1);
			return "index";
		}
		
		return "register";
	}
	@GetMapping("/adminUpdatedo.sdo")
	public String updateAdmin(HttpSession session, AdminVO adminVO) {
		AdminVO admin = (AdminVO) session.getAttribute("store_admin");
		
			int admin_seq = admin.getAdmin_seq();
			adminVO.setAdmin_seq(admin_seq);
			storeService.adminUpdate(adminVO);

			adminVO = adminLoginService.findAdmin(adminVO);
			session.setAttribute("store_admin",adminVO);
			
		
		return "redirect:index.sdo";
	}
	
	//errorPage
	@GetMapping("/401.sdo")
	public String error401() {
		return "401";
	}
	@GetMapping("/404.sdo")
	public String error404() {
		return "404";
	}
	@GetMapping("/500.sdo")
	public String error500() {
		return "500";
	}

	//adminNotice
	@GetMapping("/layout-sidenav-light.sdo")
	public String layout(AdminNoticeVO adminNoticeVO, Model model, HttpSession session) {
		AdminVO adminVO = (AdminVO) session.getAttribute("store_admin");
		if(adminVO == null) {
			model.addAttribute("error",1);
			return "index";
		}
		//if(adminVO != null){
			List<AdminNoticeVO> noticeList = storeService.noticeSelect();
			model.addAttribute("noticeList", noticeList);
		//}
		model.addAttribute("status", adminVO.getStore_status());
		return "layout-sidenav-light";
	}
	@GetMapping("/noticeDetail.sdo")
	public String noticeDetail(Model model, AdminNoticeVO adminNoticeVO,  HttpSession session) {
		AdminVO adminVO = (AdminVO) session.getAttribute("store_admin");
		adminNoticeVO = storeService.noticeDetail(adminNoticeVO);
		model.addAttribute("noticeDetail", adminNoticeVO);
		model.addAttribute("status", adminVO.getStore_status());
		return "noticeDetail";
	}
	
	

	//store 1:1
	@GetMapping("/layoutStatic.sdo")
	public String layoutStatic(QnaVO qnaVO, Model model, HttpSession session) {
		AdminVO adminVO = (AdminVO) session.getAttribute("store_admin");
		//System.out.println("z" + adminVO);
		if(adminVO != null) {
			List<QnaVO> qnaList = storeService.storeQnaSelect(adminVO);
			model.addAttribute("qnaList", qnaList);
			//System.out.println("?" + qnaList.toString());
		}
		model.addAttribute("status", adminVO.getStore_status());
		return "layout-static";
	}
	@GetMapping("/qnaDetail.sdo")
	public String qnaDetail(Model model, QnaVO qnaVO, HttpSession session) {
		AdminVO adminVO = (AdminVO) session.getAttribute("store_admin");
		if(adminVO != null) {
			List<QnaVO> qnaList = storeService.storeQnaSelect(adminVO);
			model.addAttribute("qnaList", qnaList);
		}
		qnaVO = storeService.qnaDetail(qnaVO);
		model.addAttribute("qnaDetail", qnaVO);
		model.addAttribute("status", adminVO.getStore_status());
		
		return "qnaDetail";
	}
	@GetMapping("/qnaQaInsert.sdo")
	public String insertQnaQa(QaaVO qaaVO, QnaVO qnaVO) {
		storeService.qnaQaInsert(qaaVO);
		
		if(qaaVO.getQaa_content() != null && qaaVO.getQaa_content() != "") {
			//System.out.println("qaaVO : " + qaaVO.toString());
			storeService.qaaCompletion(qnaVO);
		}
		return "redirect:layoutStatic.sdo";
	}
}
