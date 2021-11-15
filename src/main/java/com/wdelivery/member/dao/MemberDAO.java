package com.wdelivery.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.vo.UserAddressVO;
import com.wdelivery.member.vo.UserCouponVO;
import com.wdelivery.member.vo.UserVO;

public interface MemberDAO {

	public UserVO findUser(UserVO userVO);
	
	public void winMemJoin(UserVO userVO);
	public void winAddressJoin(UserAddressVO addressVO);
	int emailChk(String user_email);
	String sendSMS(String user_phone);

	public UserVO userSelect(String user_email);
	public void mypageUpdate(UserVO userVO);

	public void mypageDelete(UserVO userVO);

	public void insertAuthData(UserVO userVO);
	public void updateAuthKey(Map<String, String> map);
	public void signUpConfirm(String email);
	public int isAuthKeyAvailable(Map<String, String> emailMap);

	public UserVO isThisKakaoMemberInService(String email);
	public UserVO isThisNaverMemberInService(String email);

	public void naverMemJoin(UserVO userVO);

	public void kakaoMemJoin(UserVO userVO);
	
	public List<UserAddressVO> addressShow(String user_email);
	public void addressInsert(UserAddressVO addressVO);
	public void addressUpdate(UserAddressVO addressVO);
	public void addressDelete(int address_seq);

	
	public List<UserCouponVO> userCouponSelect(int user_seq);

	public UserAddressVO addressSelect(String user_email);

	public List<PaymentVO> paymentList(HashMap<String, String> paraMap);

	public List<PaymentVO> getUserPaymentInfo(String user_email);

	public List<CartVO> getCartListByMerchantId(String merchantUid);

	List<AdminVO> getStoreList(AdminVO adminVO);

}
