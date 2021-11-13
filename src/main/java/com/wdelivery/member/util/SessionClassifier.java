package com.wdelivery.member.util;

import javax.servlet.http.HttpSession;

import com.wdelivery.member.vo.UserVO;
/**
  Class that returns UserVO in session
 */
public class SessionClassifier {
	public static UserVO sessionClassifier(HttpSession session) {
		UserVO userInfo = null;
		if(session.getAttribute("userInfo")!=null) {
			userInfo = (UserVO)session.getAttribute("userInfo");
		} else if(session.getAttribute("naverSession")!=null) {
			userInfo = (UserVO)session.getAttribute("naverSession");
		}  else if(session.getAttribute("kakaoSession")!=null) {
			userInfo = (UserVO)session.getAttribute("kakaoSession");
		}
		return userInfo;
	}
}
