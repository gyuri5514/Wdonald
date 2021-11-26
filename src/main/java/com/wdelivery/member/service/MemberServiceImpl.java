package com.wdelivery.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.admin.vo.AdminCouponVO;
import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.member.dao.MemberDAO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.payment.vo.ToyCountVO;
import com.wdelivery.member.util.MapPointVO;
import com.wdelivery.member.vo.UserAddressVO;
import com.wdelivery.member.vo.UserCouponVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.promotion.vo.PromotionVO;
import com.wdelivery.store.dao.StoreDAO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private StoreDAO storeDAO;
	
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
	public int emailChk(String user_email)  {
		int result = memberDAO.emailChk(user_email);
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
		params.put("from", "01042820579");//input phone number = il sung na 01042**-***9
		params.put("type", "SMS");
		params.put("text", "[Wdonald] 인증번호는 [" + numStr + "]입니다.");
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
	public int couponSelect(String couponCode) {
		return memberDAO.couponSelect(couponCode);
	}

	@Override
	public List<UserAddressVO> addressSelect(String user_email) {
		return memberDAO.addressSelect(user_email);
	}

	@Override
	public List<PaymentVO> paymentList(HashMap<String, String> paraMap) {
		return memberDAO.paymentList(paraMap);
	}

	@Override
	public List<PaymentVO> getUserPaymentInfo(String user_email) {
		return memberDAO.getUserPaymentInfo(user_email);
	}
	@Override
	public void orderCancel(PaymentVO paymentVO) { //!!!!!!!!!!!!!!!!!!
		if(paymentVO.getCoupon_code()!=null&&!paymentVO.getCoupon_code().equals(""))
			memberDAO.restoreCouponStatus(paymentVO);
			memberDAO.orderCancel(paymentVO.getOrder_seq());
	}
	

	@Override
	public List<CartVO> getCartListByMerchantId(String merchantUid) {
		return memberDAO.getCartListByMerchantId(merchantUid);
	}

	@Override
	public List<AdminVO> getStoreList(AdminVO adminVO) { // dododo

		return memberDAO.getStoreList(adminVO);
	}

	@Override
	public List<AdminVO> findProximateStore(MapPointVO mpv) {
		return storeDAO.findProximateStore(mpv);
	}

	@Override
	public void updatePassword(UserVO userVO) {
		memberDAO.updatePassword(userVO);
	}

	@Override
	public List<PromotionVO> selectPromotionIng() {
		return memberDAO.selectPromotionIng();
	}

	@Override
	public PromotionVO detailPromotion(Integer p_code) {
		return memberDAO.detailPromotion(p_code);
	}

	@Override
	public AdminVO newWhichOneIsNearest(MapPointVO mapPointVO) {
		return storeDAO.newWhichOneIsNearest(mapPointVO);
	}

	@Override
	public List<AdminCouponVO> selectCouponBook(UserVO userVO) {
		return memberDAO.selectCouponBook(userVO);
	}

	@Override
	public int registerUserCoupon(AdminCouponVO acv) {
		return memberDAO.registerUserCoupon(acv);
	}

	@Override
	public void toyCancel(ToyCountVO toyCountVO) {
		memberDAO.toyCancel(toyCountVO);
  }
  
  @Override
	public List<AdminCouponVO> getUserCoupons(UserVO userVO) {
		return memberDAO.getUserCoupons(userVO);
	}

}
