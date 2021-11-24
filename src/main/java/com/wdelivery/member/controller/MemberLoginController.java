package com.wdelivery.member.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wdelivery.admin.service.AdminService;
import com.wdelivery.admin.vo.AdminBannerVO;
import com.wdelivery.member.service.MailSendService;
import com.wdelivery.member.service.MemberService;
import com.wdelivery.member.vo.KakaoUserVO;
import com.wdelivery.member.vo.NaverUserVO;
import com.wdelivery.member.vo.UserAddressVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.promotion.service.PromotionService;
import com.wdelivery.promotion.vo.PromotionVO;

@Controller
public class MemberLoginController {
	
	
	/* @Autowired private BCryptPasswordEncoder pwdEncoder; */
	 
	@Autowired
	private MemberService memberService; 
	@Autowired
	private MailSendService mss;
	@Autowired
	private AdminService adminService;
  
	@Autowired
	private PromotionService promotionService;

	@ModelAttribute("bannerList")
	public List<AdminBannerVO> getBannerList(){
		return  adminService.selectBannerList();
	}
	@ModelAttribute("selectPromotionIng")
	public List<PromotionVO> selectPromotionIng(){
		return promotionService.selectPromotionIng();
	}
	
	/**
	 회원상태 
	   0 = 탈퇴 / 1 = 정상 / 2 = 회원정지 / 3= 이메일 미인증/ 4= 카카오톡 / 5= 네이버
	   6 = 아이디 없음 / 7 = 비밀번호 오류/
	 */
	
	@PostMapping("memLogin.do")
	public String memberLogin(UserVO userVO,HttpSession session,Model model) {

		if(!userVO.getUser_email().equals("")&&userVO.getUser_email()!=null
				&&userVO.getUser_password()!=null&&!userVO.getUser_password().equals("")) {
			
			UserVO findUserVO = memberService.findUser(userVO);
			
			if(findUserVO==null) {
				model.addAttribute("status", 6);
				return "main";
			}
			if(userVO.getUser_password().equals(findUserVO.getUser_password())) {
				if(findUserVO.getUser_status()==1) {
					session.setAttribute("userInfo", findUserVO);
					model.addAttribute("status" , findUserVO.getUser_status());	
				}else if(findUserVO.getUser_status()==3){
					session.setAttribute("userInfo", findUserVO);
					model.addAttribute("status" , findUserVO.getUser_status());	
				}else if(findUserVO.getUser_status()==2){
					//user_status = 2, 
					model.addAttribute("status", findUserVO.getUser_status());
				}else {
					//user_status = 0
					model.addAttribute("status", findUserVO.getUser_status());
				}
				if(session.getAttribute("cartList") != null)
					session.removeAttribute("cartList");
				if(session.getAttribute("total_price") != null)
					session.removeAttribute("total_price");
				if(session.getAttribute("delivery_price") != null)
					session.removeAttribute("delivery_price");
				return "main";
				}else {
					//incorrect password
					model.addAttribute("status", 7);
					return "main";
				}
			}
		model.addAttribute("status",6);
		
		return "main";
	}
	
	@RequestMapping("kakaoLogin.do")
	@ResponseBody
	public String kakaoLogin(@RequestBody KakaoUserVO kakaoVO,HttpSession session) {
		UserVO kakaoUserVO = memberService.isMemberInService("kakao", "kakao#"+kakaoVO.getEmail());
		if(kakaoUserVO!=null) {
		session.setAttribute("kakaoSession", kakaoUserVO);
		session.setAttribute("status", kakaoUserVO.getUser_status());
		}else {
			UserVO userVO = new UserVO();
			userVO.setUser_email("kakao#"+kakaoVO.getEmail());
			if(kakaoVO.getGender()==null) {
				userVO.setUser_gender("선택안함");
			}else {
			userVO.setUser_gender((kakaoVO.getGender().equals("male")?"man":"woman"));
			}
			userVO.setUser_birth(kakaoVO.getBirthday());
			userVO.setUser_name(kakaoVO.getNickname());
			
			memberService.socialMemJoin("kakao",userVO);
			userVO = memberService.isMemberInService("kakao", "kakao#"+kakaoVO.getEmail());
			session.setAttribute("kakaoSession", userVO);
			session.setAttribute("status", userVO.getUser_status());
		}
		return "true";
	}                                                                                                                                            
	
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("winMemJoin.do")
	public String winMemJoin(UserVO userVO, UserAddressVO addressVO) {
		memberService.winMemJoin(userVO);
		memberService.winAddressJoin(addressVO);
		memberService.insertAuthData(userVO);
		updateAuthKey(userVO.getUser_email(),"join");
		return "emailConfirm";
	}
	
	@ResponseBody
	@RequestMapping(value = "emailChk.do", method = RequestMethod.GET)
	public int emailChk(String user_email) {
		int emailResult = memberService.emailChk(user_email);
		return emailResult;
		
	}
	
	@GetMapping("check/sendSMS.do")
	@ResponseBody 
	public String sendSMS(@RequestParam(value="phone", required = false)String user_phone) {
		
		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		memberService.certifiedPhoneNumber(user_phone, numStr);
		System.out.println("인증 번호 : " + numStr);
		
		return numStr;
		
	}
	
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}
	
	@RequestMapping("naverLogin.do")
	public String naverLogin(@RequestBody NaverUserVO naverVO,HttpSession session) {
		UserVO naverUserVO = memberService.isMemberInService("naver", "naver#"+naverVO.getEmail());
		if(naverUserVO!=null) {
		session.setAttribute("naverSession", naverUserVO);
		session.setAttribute("status", naverUserVO.getUser_status());
		}else {
			UserVO userVO = new UserVO();
			userVO.setUser_email("naver#"+naverVO.getEmail());
			userVO.setUser_gender((naverVO.getGender().equals("M")?"man":"woman"));
			userVO.setUser_birth(naverVO.getBirthday());
			userVO.setUser_phone(naverVO.getMobile());
			userVO.setUser_name(naverVO.getName());
			
			memberService.socialMemJoin("naver",userVO);
			userVO = memberService.isMemberInService("naver", "naver#"+naverVO.getEmail());
			session.setAttribute("naverSession", userVO);
			session.setAttribute("status", userVO.getUser_status());
		}
		
		session.setAttribute("accessToken", naverVO.getAccessToken());
		return "main";
	}
	
	@RequestMapping("naverCallback.do")
	public String naverCallback() {
		return "naverCallback";
	}
	
	@RequestMapping("signUpConfirm.do")
	public String signUpConfirm(
					@RequestParam("type") String type,
				@RequestParam("email") String email,
			@RequestParam("authKey") String authKey,Model model){
		Map<String,String> emailMap = new HashMap<String,String>();
		emailMap.put("authKey", authKey);
		emailMap.put("email", email);
		if(isAuthKeyAvailable(emailMap)) {
			
			model.addAttribute("emailResult","success");
			
			if(type.equals("join"))
				memberService.signUpConfirm(email);
			else if(type.equals("findPw"))
				model.addAttribute("email",email);
			
			return (type.equals("join")?"main":"confirmPassword");
		}else {
		model.addAttribute("emailResult","fail");
		return "main";
		}
	}
	
	@ResponseBody
	@PostMapping("findPw.do")
	public String findPw(@RequestParam("email") String user_email) {
		updateAuthKey(user_email, "findPw");
		return "1";
	}
	
	public void updateAuthKey(String user_email,String type) {
		String authKey = mss.sendAuthMail(user_email,type);
		Map<String,String> map = new HashMap<String,String>();	
		map.put("user_email", user_email);
		map.put("authKey", authKey);
		memberService.updateAuthKey(map);
	}
	
	@PostMapping("confirmPassword.do")
	public String confirmPassword(Model model,UserVO userVO) {
		memberService.updatePassword(userVO);
		model.addAttribute("passwordChanged","success");
		return "main";
	}
	
	public boolean isAuthKeyAvailable(Map<String,String> emailMap) {
		return memberService.isAuthKeyAvailable(emailMap);
	}
}
