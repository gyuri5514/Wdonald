package com.wdelivery.member.payment.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.wdelivery.member.vo.UserVO;

@Controller
public class PaymentController {
	@Autowired
	private PaymentService paymentService;

	private IamportClient api;

	public PaymentController() {
		// RestApi 키와 Rest API Secret 를 아래처럼 ㅁ순서대로 입력한다
		this.api = new IamportClient("0192372667414823",
				"be8d598a6fb115e08b5880a61a8152049826e2c3661d4948f2d2a2a1f60a39ad51dba535e93e1ecb");
	}

	@ResponseBody
	@PostMapping("payment/verifyIamport.do")
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session,
			@RequestParam(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
		return api.paymentByImpUid(imp_uid);
	}

	@PostMapping("paywinCredit.do")
	public String paywinDelivery(@RequestBody PaymentVO paymentVO, HttpSession session) {

		Object obj = session.getAttribute("cartList");
		ArrayList<CartVO> cartVO = new ArrayList<CartVO>();
		if (obj instanceof ArrayList<?>) { // Get the List
			ArrayList<?> al = (ArrayList<?>) obj;
			if (al.size() > 0) {
				for (int i = 0; i < al.size(); i++) {
					Object o = al.get(i);
					if (o instanceof CartVO) {
						CartVO v = (CartVO) o;
						v.setMerchantuid(paymentVO.getMerchantuid());
						cartVO.add(v);
						System.out.println(v.toString());
					}
				}
			}
		}

		if (session.getAttribute("userInfo") != null) {
			/* UserVO userVO= */
			paymentVO.setUser_type(((UserVO) session.getAttribute("userInfo")).getUser_status());

		} else if (session.getAttribute("kakaoSession") != null) {
			/* UserVO userVO= */
			paymentVO.setUser_type(((UserVO) session.getAttribute("kakaoSession")).getUser_status());
		} else if (session.getAttribute("naverSession") != null) {
			/* UserVO userVO= */
			paymentVO.setUser_type(((UserVO) session.getAttribute("naverSession")).getUser_status());
		} else {
			// 비회원
			paymentVO.setUser_type(9);
		}
		paymentVO.setOrder_date(new Date());
		System.out.println(paymentVO.toString());
		paymentService.insertPaidOrderList(paymentVO,cartVO);
		return "main";
	}
}
