
package com.wdelivery.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wdelivery.admin.service.AdminService;
import com.wdelivery.admin.vo.AdminBannerVO;
import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.payment.vo.ToyCountVO;
import com.wdelivery.member.service.MemberService;
import com.wdelivery.member.util.OrderTimer;
import com.wdelivery.member.util.SessionClassifier;
import com.wdelivery.member.util.TypeSafety;
import com.wdelivery.member.vo.UserAddressVO;
import com.wdelivery.member.vo.UserCouponVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.promotion.service.PromotionService;
import com.wdelivery.promotion.vo.PromotionVO;

@Controller
public class MypageController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminService adminService;

	@Autowired 
	private BCryptPasswordEncoder pwdEncoder;


	@Autowired
	private PromotionService promotionService;

	@ModelAttribute("bannerList")
	public List<AdminBannerVO> getBannerList() {
		return adminService.selectBannerList();
	}

	@ModelAttribute("selectPromotionIng")
	public List<PromotionVO> selectPromotionIng() {
		return promotionService.selectPromotionIng();
	}
	
	@GetMapping("/mypageupdate.do")
	public String mypageUpdate(Model model, HttpSession session, UserVO userVO) {
		
		if(SessionClassifier.sessionClassifier(session)==null)
			 return "redirect:main.do";
			
		session.setAttribute("session", userVO);
		return "mypageupdate";
	}
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/mypageUpdate.do")
	public String mypageUpdateConfirm(UserVO userVO, HttpSession session) {
		
		String rawPw = ""; //주석 MemberLoginController 참고
		String encodePw = "";
		
		rawPw = userVO.getUser_password();
		encodePw = pwdEncoder.encode(rawPw);
		userVO.setUser_password(encodePw);
		
		memberService.mypageUpdate(userVO);
		return "redirect:mypageupdate.do";
	}

	@GetMapping("/mypageDelete.do")
	public String mypageDelete(HttpSession session) {
		
		UserVO userV = SessionClassifier.sessionClassifier(session);
		if (userV.getUser_email() != null || userV.getUser_email() != "") {
			memberService.mypageDelete(userV);
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
		
		UserVO userInfo = SessionClassifier.sessionClassifier(session);
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("start_history", start_history);
		paraMap.put("end_history", end_history);
		paraMap.put("user_email", userInfo.getUser_email());
		List<PaymentVO> paymentVO = memberService.paymentList(paraMap);
		return paymentVO;
	}
	
	@GetMapping("/orderHistory.do")
	public String orderHistory( Model model, HttpSession session) {
		UserVO userInfo = SessionClassifier.sessionClassifier(session);
		if(userInfo==null)
			return "redirect:main.do";
		return "orderHistory";
	}
	
	//coupon
	@GetMapping("/coupon.do")
	public String coupon(Model model, HttpSession session) {
		UserVO userInfo = SessionClassifier.sessionClassifier(session);
		if(userInfo==null) 
			return "redirect:main.do";
		int user_seq = userInfo.getUser_seq();
		List<UserCouponVO> UserCouponVO = new ArrayList<UserCouponVO>();
		UserCouponVO = memberService.userCouponSelect(user_seq);

		model.addAttribute("UserCouponVO", UserCouponVO);
		
		return "coupon";
	}
	@GetMapping("/trackOrder.do")
	public String trackOrder(HttpSession session,Model model) {
		UserVO userInfo = SessionClassifier.sessionClassifier(session);
		if(userInfo==null)
			return "redirect:main.do";
		model.addAttribute("paymentList",memberService.getUserPaymentInfo(userInfo.getUser_email()));
		return "trackOrder";
	}
	@Transactional(rollbackFor = Exception.class)
	@GetMapping("/orderCancel.do")
	public String orderCancel(PaymentVO paymentVO, HttpSession session) {
		memberService.orderCancel(paymentVO);
		
		List<CartVO> cartVO = memberService.cartCancel(paymentVO);
		
		for(int i=0; i<cartVO.size(); i++) { //toy
			if(900 <= cartVO.get(i).getCart_product_code() && cartVO.get(i).getCart_product_code() < 1000) {
				
				ToyCountVO tcv = new ToyCountVO();
				tcv.setProduct_quantity( cartVO.get(i).getCart_product_quantity());
				tcv.setOrder_seq(cartVO.get(i).getOrder_seq());
				tcv.setHt_code(cartVO.get(i).getC_ht_code());
				tcv.setStore_code(paymentVO.getStore_code());
				System.out.println(tcv.toString());
				memberService.toyCancel(tcv);
				
			}
			}
		return "redirect:trackOrder.do";
	}
	
	@ResponseBody
	@PostMapping("getCartListByMerchantId.do")
	public List<CartVO> getCartListByMerchantId(@RequestParam("merchantuid") String merchantUid){
		return memberService.getCartListByMerchantId(merchantUid);
	}
}
