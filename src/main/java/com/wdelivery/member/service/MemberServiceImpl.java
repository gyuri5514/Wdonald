package com.wdelivery.member.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.member.dao.MemberDAO;
import com.wdelivery.member.vo.UserAddressVO;
import com.wdelivery.member.vo.UserVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public UserVO findUser(UserVO userVO) {
		return memberDAO.findUser(userVO);
	}

	@Override
	public void winMemJoin(UserVO userVO) {
		memberDAO.winMemJoin(userVO);
	}

	@Override
	public void winAddressJoin(UserAddressVO addressVO) {
		memberDAO.winAddressJoin(addressVO);
	}

	@Override
	public void mypageUpdate(UserVO userVO) {
		memberDAO.mypageUpdate(userVO);
	}

	@Override
	public int emailChk(String user_email) throws Exception {
		int result = memberDAO.emailChk(user_email);
		System.out.println("serviceImpl : " + result);
		return result;
	}

	public UserVO userSelect(String user_email) {

		return memberDAO.userSelect(user_email);
	}

	@Override
	public void certifiedPhoneNumber(String user_phone, String numStr) {
		String api_key = "NCSLKKH1668CXHYF"; // �ϼ�Key
		String api_secret = "XTKDJVGBZYYGT1CVBVHOXVXYP05L7DND";
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", user_phone);
		params.put("from", "01042820579");
		params.put("type", "SMS");
		params.put("text", "[Wdonald] ���� ��ȣ�� [" + numStr + "] �Դϴ�.");
		params.put("app_version", "test app 1.2");

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println("���� ���� : " + obj.toString());
		} catch (CoolsmsException e) {
			e.printStackTrace();
		}
	}

	public void insertAuthData(UserVO userVO) {
		memberDAO.insertAuthData(userVO);
	}

	@Override
	public void updateAuthKey(Map<String, String> map) {
		memberDAO.updateAuthKey(map);
	}

	@Override
	public void signUpConfirm(String email) {
		memberDAO.signUpConfirm(email);
	}

	@Override
	public boolean isAuthKeyAvailable(Map<String, String> emailMap) {
		int result = memberDAO.isAuthKeyAvailable(emailMap);
		System.out.println("MemberServiceImpl result =>" + result);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public UserVO isMemberInService(String loginType, String email) {
		System.out.println("MemberServiceImpl isMemberInService => loginType = " + loginType + ", email : " + email);
		if (loginType.equals("kakao")) {
			return memberDAO.isThisKakaoMemberInService(email);
		} else if (loginType.equals("naver")) {
			return memberDAO.isThisNaverMemberInService(email);
		} else {
			return null;
		}
	}

	@Override
	public void socialMemJoin(String joinType, UserVO userVO) {
		System.out.println(
				"MemberServiceImpl socialMemJoin => joinType = " + joinType + ", email : " + userVO.getUser_email());
		if (joinType.equals("naver")) {
			memberDAO.naverMemJoin(userVO);
		} else if (joinType.equals("kakao")) {
			memberDAO.kakaoMemJoin(userVO);
		}
	}

	@Override
	public UserAddressVO addressShow(String user_email) {
		
		return memberDAO.addressShow(user_email);
	}

	@Override
	public void addressInsert(UserAddressVO addressVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addressUpdate(UserAddressVO addressVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addressDelete(int address_seq) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void mypageDelete(UserVO userVO) { //don �ϴ� ��
		memberDAO.mypageDelete(userVO);
	}

}
