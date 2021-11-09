package com.wdelivery.member.payment.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.wdelivery.member.payment.service.PaymentService;

@Controller
@RequestMapping("payment/")
public class PaymentController {
	@Autowired
	private PaymentService paymentService;
	
	private IamportClient api;
	public PaymentController() {
		//RestApi 키와 Rest API Secret  를 아래처럼 ㅁ순서대로 입력한다
		this.api = new IamportClient("0192372667414823", "be8d598a6fb115e08b5880a61a8152049826e2c3661d4948f2d2a2a1f60a39ad51dba535e93e1ecb");
	}
	
	@ResponseBody
	@PostMapping("/verifyIamport.do")
	public IamportResponse<Payment> paymentByImpUid(
			Model model,
			Locale locale,
			HttpSession session,
			@RequestParam(value="imp_uid") String imp_uid)
					throws IamportResponseException,IOException{
		return api.paymentByImpUid(imp_uid);
	}
	
	@PostMapping("paywinCredit.do")
	public String paywinDelivery() {
		System.out.println();
		return "main.do";
	}
}