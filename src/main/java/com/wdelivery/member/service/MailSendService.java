package com.wdelivery.member.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.wdelivery.member.util.MailUtils;

@Service("mss")
public class MailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int size;
	//인증키 생성
	
	private String getKey(int size) {
		this.size = size;
		return getAuthCode();
	}
	
	//인증코드 난수 발생
	private String getAuthCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;
		
		while(buffer.length()<size) {
			num = random.nextInt();
			buffer.append(num);
		}
		return buffer.toString();
	}
	
	//인증 메일 보내기
	
	 public String sendAuthMail(String email) {
		 //6자리 난수 인증번호 생성
		 String authKey = getKey(6);
		 
		 //인증 메일 보내기
		 try {
			 MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("회원가입 이메일 인증");
			sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
					.append("<a href='http://localhost:8080/controller/signUpConfirm.do?email=")
					.append(email)
					.append("&authKey=")
					.append(authKey)
					.append("' target='_blenk'>이메일 인증 확인</a>").toString());
			sendMail.setFrom("guyri5514@naver.com","관리자");
			sendMail.setTo(email);
			sendMail.send();
			
		 }catch(MessagingException e) {
			 e.printStackTrace();
		 }catch (UnsupportedEncodingException e) {
			 e.printStackTrace();
		}
		 return authKey;
	 }
}
