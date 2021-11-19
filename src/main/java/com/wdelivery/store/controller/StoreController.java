package com.wdelivery.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.qna.vo.QaaVO;
import com.wdelivery.qna.vo.QnaVO;
import com.wdelivery.store.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	
	/*
	 * @GetMapping("/index.sdo") public String index() {
	 * 
	 * return "index"; }
	 */
	 
	@GetMapping("/index.sdo")
	public String index(AdminVO adminVO, Model model, HttpSession session) {
		adminVO = (AdminVO) session.getAttribute("admin");
		//System.out.println("bn" + adminVO.toString());
		if(adminVO==null)
			return "redirect:login.mdo";
		model.addAttribute("status", adminVO.getStore_status());
		
		return "index";
	}
	@GetMapping("/storeStatus.sdo")
	public String storeStatus(@RequestParam(name="store_status", defaultValue = "0") int store_status, AdminVO adminVO, HttpSession session) {
		adminVO = (AdminVO) session.getAttribute("admin");
		System.out.println("���� : " + adminVO.toString() + "?" + store_status);
		adminVO.setStore_status(store_status);
		storeService.storeStatus(adminVO);
		return "index";
	}
	
	//adminUpdate
	@GetMapping("/adminUpdate.sdo")
	public String adminUpdate() {
		return "register";
	}
	
	@GetMapping("/adminUpdatedo.sdo")
	public String adminUpdate(HttpSession session, AdminVO adminVO) {
		AdminVO admin = (AdminVO) session.getAttribute("admin");
		if(admin != null) {
			int admin_seq = admin.getAdmin_seq();
			adminVO.setAdmin_seq(admin_seq);
			storeService.adminUpdate(adminVO);
		}
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

	//?
	@GetMapping("/layout-sidenav-light.sdo")
	public String layout() {
		return "layout-sidenav-light";
	}
	
	//store 1:1 ������
	@GetMapping("/layoutStatic.sdo")
	public String layoutStatic(QnaVO qnaVO, Model model, HttpSession session) {
		AdminVO adminVO = (AdminVO) session.getAttribute("admin");
		//System.out.println("z" + adminVO);
		if(adminVO != null) {
			List<QnaVO> qnaList = storeService.storeQnaSelect(adminVO);
			model.addAttribute("qnaList", qnaList);
			
			//System.out.println("?" + qnaList.toString());
		}
		
		return "layout-static";
	}
	@GetMapping("/qnaDetail.sdo")
	public String qnaDetail(Model model, QnaVO qnaVO) {
		qnaVO = storeService.qnaDetail(qnaVO);
		model.addAttribute("qnaDetail", qnaVO);
		//System.out.println(qnaVO.toString());
		
		return "qnaDetail";
	}
	@GetMapping("/qnaQaInsert.sdo")
	public String qnaQaInsert(QaaVO qaaVO, QnaVO qnaVO) {
		storeService.qnaQaInsert(qaaVO);
		
		if(qaaVO.getQaa_content() != null && qaaVO.getQaa_content() != "") {
			//System.out.println("qaaVO : " + qaaVO.toString());
			storeService.qaaCompletion(qnaVO);
		}
		return "redirect:layoutStatic.sdo";
	}
}
