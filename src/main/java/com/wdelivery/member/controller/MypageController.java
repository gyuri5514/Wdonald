
package com.wdelivery.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.service.MemberService;
import com.wdelivery.member.vo.UserAddressVO;
import com.wdelivery.member.vo.UserCouponVO;
import com.wdelivery.member.vo.UserVO;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;

	@GetMapping("/mypageupdate.do")
	public String mypageupdate(Model model, HttpSession session, UserVO userVO) {
		/*
		 * if(session.getAttribute("userInfo")!=null) { UserVO userVO = (UserVO)
		 * session.getAttribute("userInfo");
		 * 
		 * } userVO = memberService.userSelect(user_email);
		 * //System.out.println("mypage !!!!!!!!=>" + userVO.toString());
		 * 
		 * model.addAttribute("userVO",
		 * memberService.userSelect(userVO.getUser_email()));
		 */
		session.setAttribute("session", userVO);
		System.out.println("?" + session);
		return "mypageupdate";
	}

	@PostMapping("/mypageUpdate.do")
	public String mypageUpdate(UserVO userVO, HttpSession session) {
		
		// String user_email = (String) session.getAttribute("user_email");

		// System.out.println("mypageupdate����以� : " + user_email );

		System.out.println("mypageupdateController" + userVO.getUser_seq());
		
		//session.setAttribute("userVO", memberService.mypageUpdate(userVO));
		memberService.mypageUpdate(userVO);
		System.out.println(userVO.toString());
		return "redirect:mypageupdate.do";
	}

	@GetMapping("/mypageDelete.do")
	public String mypageDelete(UserVO userVO, HttpSession session) {
		String user = (String) session.getAttribute("user_eamil");
		System.out.println("mypage delete => " + user);

		if (user != null || user != "") { // 하는 중
			System.out.println("mypageDelete success");
			memberService.mypageDelete(userVO);
			session.invalidate();
		}
		return "main";
	}

	/*-----------address------------*/
	@GetMapping("/addressBook.do")
	public String addressBook(@RequestParam(value = "addressVO", required = false) List<UserAddressVO> addressVO,
			Model model, HttpSession session) {
		UserVO userVO = null;
		if (session.getAttribute("userInfo") != null) {
			userVO = (UserVO) session.getAttribute("userInfo");
		} else if (session.getAttribute("kakaoSession") != null) {
			userVO = (UserVO) session.getAttribute("kakaoSession");
		} else if (session.getAttribute("naverSession") != null) {
			userVO = (UserVO) session.getAttribute("naverSession");
		}
		String user_email = userVO.getUser_email();
		addressVO = new ArrayList<UserAddressVO>();
		addressVO = memberService.addressShow(user_email);

		// System.out.println("ddd " + addressVO.toString());
		model.addAttribute("addressVO", addressVO);

		return "addressBook";
	}

	@GetMapping("/addressupdate.do")
	public String addressUpdate() {

		return "addressupdate";
	}

	@PostMapping("/addressupdate.do")
	public String addressInsert(UserAddressVO addressVO, Model model, HttpSession session) {
		UserVO userVO = null;
			if (session.getAttribute("userInfo") != null) {
				userVO = (UserVO) session.getAttribute("userInfo");
			} else if (session.getAttribute("kakaoSession") != null) {
				userVO = (UserVO) session.getAttribute("kakaoSession");
			} else if (session.getAttribute("naverSession") != null) {
				userVO = (UserVO) session.getAttribute("naverSession");
			}
		String user_email = userVO.getUser_email();
		addressVO.setUser_email(user_email);
		memberService.addressInsert(addressVO);
		// System.out.println("addressInsert : "+ addressVO.getAddress1());

		// model.addAttribute("user_email", user_email);
		// System.out.println("addressupdate : " + user_email);
		model.addAttribute("addressVO", addressVO);

		return "redirect:addressBook.do";
	}

	@GetMapping("delete.do")
	public String addressDelete(@RequestParam(value = "address_seq", required = false) int address_seq) {

		memberService.addressDelete(address_seq);
		return "redirect:addressBook.do";
	}
	
	//데이터 피커 하고싶은데 안됌 ㅠ
	@GetMapping("/search.do")
	public String orderHistory(@RequestParam(value = "paymentVO", required = false) List<PaymentVO> paymentVO, 
			@RequestParam(value = "start_history",required = false) String start_history, @RequestParam(value = "end_history", required = false) String end_history, 
			Model model, HttpSession session, HttpServletRequest request) {
		
		UserVO userVO = null;
		if (session.getAttribute("userInfo") != null) {
			userVO = (UserVO) session.getAttribute("userInfo");
		} else if (session.getAttribute("kakaoSession") != null) {
			userVO = (UserVO) session.getAttribute("kakaoSession");
		} else if (session.getAttribute("naverSession") != null) {
			userVO = (UserVO) session.getAttribute("naverSession");
		}
		String user_email = userVO.getUser_email();
		//paymentVO = memberService.paymentList(null, user_email);
//		String start_history = request.getParameter("start_history");
//		String end_history = request.getParameter("end_history");
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("start_history", start_history);
		paraMap.put("end_history", end_history);
		paraMap.put("user_email", user_email);
		paymentVO = new ArrayList<PaymentVO>();
		paymentVO = memberService.paymentList(paraMap);
		
		model.addAttribute("paymentVO", paymentVO);
		
		System.out.println("start date check : " + start_history);
		System.out.println("end date check : " + end_history);
		
		return "orderHistory";
	}
	
	@GetMapping("/orderHistory.do")
	public String orderHistory(@RequestParam(value = "paymentVO", required = false) List<PaymentVO> paymentVO, Model model, HttpSession session) {
		
		UserVO userVO = null;
		if (session.getAttribute("userInfo") != null) {
			userVO = (UserVO) session.getAttribute("userInfo");
		} else if (session.getAttribute("kakaoSession") != null) {
			userVO = (UserVO) session.getAttribute("kakaoSession");
		} else if (session.getAttribute("naverSession") != null) {
			userVO = (UserVO) session.getAttribute("naverSession");
		}
		String user_email = userVO.getUser_email();
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("user_email", user_email);
		paymentVO = new ArrayList<PaymentVO>();
		paymentVO = memberService.paymentList(paraMap);
		
		model.addAttribute("paymentVO", paymentVO);
		return "orderHistory";
	}
	
	//coupon
	@GetMapping("/coupon.do")
	public String coupon(Model model, HttpSession session) {
		UserVO userVO = null;
		if (session.getAttribute("userInfo") != null) {
			userVO = (UserVO) session.getAttribute("userInfo");
		} else if (session.getAttribute("kakaoSession") != null) {
			userVO = (UserVO) session.getAttribute("kakaoSession");
		} else if (session.getAttribute("naverSession") != null) {
			userVO = (UserVO) session.getAttribute("naverSession");
		}
		
		int user_seq = userVO.getUser_seq();System.out.println("con => " +  user_seq);
		List<UserCouponVO> UserCouponVO = new ArrayList<UserCouponVO>();
		UserCouponVO = memberService.userCouponSelect(user_seq);

		System.out.println("userCouponController : " + UserCouponVO.toString());
		model.addAttribute("UserCouponVO", UserCouponVO);
		
		return "coupon";
	}
	@GetMapping("/trackOrder.do")
	public String trackOrder(HttpSession session,Model model) {
		UserVO userInfo =(UserVO)session.getAttribute("userInfo");
		List<PaymentVO> paymentList = memberService.getUserPaymentInfo(userInfo.getUser_email());
		for(PaymentVO pv : paymentList ) {
			System.out.println(pv.toString());
		}
		model.addAttribute("paymentList",paymentList);
		return "trackOrder";
	}
	
	@PostMapping("getCartListByMerchantId.do")
	public List<CartVO> getCartListByMerchantId(@RequestParam("merchantuid") String merchantUid){
		System.out.println(merchantUid);
		return memberService.getCartListByMerchantId(merchantUid);
	}
}
