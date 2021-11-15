
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.service.MemberService;
import com.wdelivery.member.util.SessionClassifier;
import com.wdelivery.member.vo.UserAddressVO;
import com.wdelivery.member.vo.UserCouponVO;
import com.wdelivery.member.vo.UserVO;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;

	@GetMapping("/mypageupdate.do")
	public String mypageupdate(Model model, HttpSession session, UserVO userVO) {
		
		if(SessionClassifier.sessionClassifier(session)==null)
			 return "redirect:main.do";
			
		session.setAttribute("session", userVO);
		return "mypageupdate";
	}

	@PostMapping("/mypageUpdate.do")
	public String mypageUpdate(UserVO userVO, HttpSession session) {
		memberService.mypageUpdate(userVO);
		return "redirect:mypageupdate.do";
	}

	@GetMapping("/mypageDelete.do")
	public String mypageDelete(UserVO userVO, HttpSession session) {
		String user = (String) session.getAttribute("user_eamil");
		if (user != null || user != "") { // 하는 중
			//System.out.println("mypageDelete success");
			memberService.mypageDelete(userVO);
			session.invalidate();
		}
		return "main";
	}

	/*-----------address------------*/
	@GetMapping("/addressBook.do")
	public String addressBook(@RequestParam(value = "addressVO", required = false) List<UserAddressVO> addressVO,
			Model model, HttpSession session) {
		UserVO userInfo = SessionClassifier.sessionClassifier(session);
		if(userInfo==null)
			return "redirect:main.do";
		String user_email = userInfo.getUser_email();
		addressVO = new ArrayList<UserAddressVO>();
		addressVO = memberService.addressShow(user_email);

		// System.out.println("ddd " + addressVO.toString());
		model.addAttribute("addressVO", addressVO);

		return "addressBook";
	}

	@GetMapping("/addressupdate.do")
	public String addressUpdate(HttpSession session) {
		UserVO userInfo = SessionClassifier.sessionClassifier(session);
		if(userInfo==null)
			return "redirect:main.do";
		return "addressupdate";
	}

	@PostMapping("/addressupdate.do")
	public String addressInsert(UserAddressVO addressVO, Model model, HttpSession session) {
		UserVO userInfo = SessionClassifier.sessionClassifier(session);
		if(userInfo==null)
			return "redirect:main.do";
		String user_email = userInfo.getUser_email();
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
	@ResponseBody
	@GetMapping("/search.do")
	public List<PaymentVO> orderHistory( 
			@RequestParam(value = "start_history",required = false) String start_history, @RequestParam(value = "end_history", required = false) String end_history, 
			 HttpSession session, HttpServletRequest request) {
		
		if(start_history=="" && end_history=="") {
			start_history =null;
			end_history=null;
		}
		
		System.out.println("start_history = "+start_history+" end_history = "+end_history );
		UserVO userInfo = SessionClassifier.sessionClassifier(session);
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("start_history", start_history);
		paraMap.put("end_history", end_history);
		paraMap.put("user_email", userInfo.getUser_email());
		List<PaymentVO> paymentVO = memberService.paymentList(paraMap);
		if(paymentVO.size()==0) {
			System.out.println("paymentVO is null");
		}
		for(PaymentVO p : paymentVO) {
			System.out.println(p.toString());
		}
		return paymentVO;
	}
	
	@GetMapping("/orderHistory.do")
	public String orderHistory( Model model, HttpSession session) {
		UserVO userInfo = SessionClassifier.sessionClassifier(session);
		if(userInfo==null)
			return "redirect:main.do";
		/*
		 * System.out.println(userInfo.toString()); HashMap<String, String> paraMap =
		 * new HashMap<String, String>(); paraMap.put("user_email",
		 * userInfo.getUser_email());
		 * 
		 * List<PaymentVO> paymentVO = memberService.paymentList(paraMap);
		 * 
		 * model.addAttribute("paymentVO", paymentVO);
		 */
		return "orderHistory";
	}
	
	//coupon
	@GetMapping("/coupon.do")
	public String coupon(Model model, HttpSession session) {
		UserVO userInfo = SessionClassifier.sessionClassifier(session);
		
		int user_seq = userInfo.getUser_seq();
		//System.out.println("con => " +  user_seq);
		List<UserCouponVO> UserCouponVO = new ArrayList<UserCouponVO>();
		UserCouponVO = memberService.userCouponSelect(user_seq);

		//System.out.println("userCouponController : " + UserCouponVO.toString());
		model.addAttribute("UserCouponVO", UserCouponVO);
		
		return "coupon";
	}
	@GetMapping("/trackOrder.do")
	public String trackOrder(HttpSession session,Model model) {
		UserVO userInfo = SessionClassifier.sessionClassifier(session);
		if(userInfo==null)
			return "redirect:main.do";
		List<PaymentVO> paymentList = memberService.getUserPaymentInfo(userInfo.getUser_email());
		for(PaymentVO pv : paymentList ) {
			System.out.println(pv.toString());
		}
		model.addAttribute("paymentList",paymentList);
		return "trackOrder";
	}
	
	@ResponseBody
	@PostMapping("getCartListByMerchantId.do")
	public List<CartVO> getCartListByMerchantId(@RequestParam("merchantuid") String merchantUid){
		System.out.println(merchantUid);
		List<CartVO> cartVO =memberService.getCartListByMerchantId(merchantUid);
		for(CartVO c : cartVO) {
			System.out.println(c.toString());
		}
		return cartVO;
	}
}
