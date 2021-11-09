package com.wdelivery.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.wdelivery.member.service.MemberService;
import com.wdelivery.member.vo.UserAddressVO;
import com.wdelivery.member.vo.UserVO;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;
	
	
	//������蹂� ����
	@GetMapping("/mypageupdate.do")
	public String mypageupdate(UserVO userVO, Model model, HttpSession session) {
		
		String user_email = (String) session.getAttribute("user_email");
		
		userVO = memberService.userSelect(user_email);
		model.addAttribute("userVO", memberService.userSelect(userVO.getUser_email()));
		
		return "mypageupdate";
	}
	@PostMapping("/mypageUpdate.do")
	public String mypageUpdate(UserVO userVO) {
		//String user_email = (String) session.getAttribute("user_email");
		//System.out.println("mypageupdate����以� : " + user_email );
		System.out.println("mypageupdateController" + userVO.getUser_seq());
		//session.setAttribute("userVO", memberService.mypageUpdate(userVO));
		memberService.mypageUpdate(userVO);
		System.out.println(userVO.toString());
		return "mypageupdate";
	}
	@GetMapping("/mypageDelete.do")
	public String mypageDelete(UserVO userVO, HttpSession session) {
		String user = (String) session.getAttribute("user_eamil");
		System.out.println("mypage delete => " + user);
	
		if(user != null || user != "") { //하는 중
			System.out.println("mypageDelete success");
			memberService.mypageDelete(userVO);
			session.invalidate();
		}else {
			System.out.println("mypageDelete failed");
		}
		return "main";
	}
	 
	

	@GetMapping("/addressBook.do")
	public String addressBook(UserAddressVO addressVO, Model model, HttpSession session) {
		String user_email = (String) session.getAttribute("user_email");

		addressVO = memberService.addressShow(user_email);
		System.out.println("ddd " + addressVO.toString());
		model.addAttribute("addressVO", addressVO);
		
		return "addressBook";
	}

	@GetMapping("/addressupdate.do")
	public String addressUpdate() {
		return "addressupdate";
	}
	
	@GetMapping("/orderHistory.do")
	public String orderHistory() {
		return "orderHistory";
	}

}
