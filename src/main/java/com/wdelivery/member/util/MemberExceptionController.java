package com.wdelivery.member.util;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice("com.wdelivery")
public class MemberExceptionController {
	@ExceptionHandler(Exception.class)
	public String handler(Exception e,Model model) {
		model.addAttribute("exception",e);
		return "noResult";
	}
}
