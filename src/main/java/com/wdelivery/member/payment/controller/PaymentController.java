package com.wdelivery.member.payment.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.member.payment.service.PaymentService;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.payment.vo.ToyCountVO;
import com.wdelivery.member.util.SessionClassifier;
import com.wdelivery.member.util.TypeSafety;
import com.wdelivery.member.vo.UserVO;

@Controller
public class PaymentController {
	@Autowired
	private PaymentService paymentService;

	private IamportClient api;

	public PaymentController() {
		this.api = new IamportClient("0192372667414823",
				"be8d598a6fb115e08b5880a61a8152049826e2c3661d4948f2d2a2a1f60a39ad51dba535e93e1ecb");
	}

	@ResponseBody
	@PostMapping("payment/verifyIamport.do")
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session,
			@RequestParam(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
		return api.paymentByImpUid(imp_uid);
	}

	@Transactional(rollbackFor = Exception.class)
	@PostMapping("paywinCredit.do")
	public String paywinDelivery(@RequestBody PaymentVO paymentVO, HttpSession session) throws Exception{
		UserVO userInfo = SessionClassifier.sessionClassifier(session);
		ArrayList<CartVO> cartVO = TypeSafety.sessionCartCaster(session.getAttribute("cartList"), paymentVO);
		if (userInfo != null) {
			paymentVO.setUser_type(userInfo.getUser_status());
		}else {
			paymentVO.setUser_type(9);
		}
		System.out.println(paymentVO.toString());
	    paymentVO.setOrder_date(new Date());
		paymentService.insertPaidOrderList(paymentVO, cartVO);
     
		//if(userInfo!=null) throw new Exception("아제발 들어와라");
		
		for(int i=0; i<cartVO.size(); i++) { //toy
			if(900 <= cartVO.get(i).getCart_product_code() && cartVO.get(i).getCart_product_code() < 1000) {
				System.out.println("toy" + cartVO.get(i).getCart_h_code());
				ToyCountVO tcv = new ToyCountVO();
				tcv.setStore_code(paymentVO.getStore_code());
				paymentService.toyCount(tcv);
			}
		}
		
		session.setAttribute("cartList", new ArrayList<CartVO>());
		
		return "main";
	}
}