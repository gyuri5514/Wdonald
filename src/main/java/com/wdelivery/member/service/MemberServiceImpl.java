package com.wdelivery.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.member.dao.MemberDAO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.vo.UserAddressVO;
import com.wdelivery.member.vo.UserCouponVO;
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
		String api_key = "NCSLKKH1668CXHYF"; // smsKey
		String api_secret = "XTKDJVGBZYYGT1CVBVHOXVXYP05L7DND";
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", user_phone);
		params.put("from", "01042820579");
		params.put("type", "SMS");
		params.put("text", "[Wdonald] certification code is [" + numStr + "]");
		params.put("app_version", "test app 1.2");

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println("certification : " + obj.toString());
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
	public List<UserAddressVO> addressShow(String user_email) {
		
		return memberDAO.addressShow(user_email);
	}
	@Override
	public void addressUpdate(UserAddressVO addressVO) {
		// TODO Auto-generated method stub	
	}
	@Override
	public void addressDelete(int address_seq) {
		memberDAO.addressDelete(address_seq);
	}
	@Override
	public void mypageDelete(UserVO userVO) {
		memberDAO.mypageDelete(userVO);
	}
	@Override
	public void addressInsert(UserAddressVO addressVO) {
		 memberDAO.addressInsert(addressVO);
	}

	@Override
	public List<UserCouponVO> userCouponSelect(int user_seq) {
		return memberDAO.userCouponSelect(user_seq);
	}
	

  @Override
	public UserAddressVO addressSelect(String user_email) {
		return memberDAO.addressSelect(user_email);
	}


	@Override
	public List<PaymentVO> paymentList(HashMap<String, String> paraMap) {
		return memberDAO.paymentList(paraMap);
	}

	@Override
	public List<CartVO> trackList(int order_seq) {
		return memberDAO.trackList(order_seq);
	}

	@Override
	public List<PaymentVO> paymentList_e(String user_email) {
		return memberDAO.paymentList_e(user_email);
	}


}
