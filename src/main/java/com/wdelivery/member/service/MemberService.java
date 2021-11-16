package com.wdelivery.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.vo.UserAddressVO;
import com.wdelivery.member.vo.UserCouponVO;
import com.wdelivery.member.vo.UserVO;

public interface MemberService {

	UserVO findUser(UserVO userVO);
	
	public void winMemJoin(UserVO userVO);
	public void winAddressJoin(UserAddressVO addressVO);
	int emailChk(String user_email);
	public void certifiedPhoneNumber(String user_phone, String numStr);
	public UserVO userSelect(String user_email);
	public void mypageUpdate(UserVO userVO);
	public void mypageDelete(UserVO userVO);
	void insertAuthData(UserVO userVO);
	void updateAuthKey(Map<String, String> map);
	void signUpConfirm(String email);
	boolean isAuthKeyAvailable(Map<String, String> emailMap);
	UserVO isMemberInService(String loginType, String email);
	void socialMemJoin(String joinType, UserVO userVO);
	
	public List<UserAddressVO> addressShow(String user_email);
	public void addressInsert(UserAddressVO addressVO);
	public void addressUpdate(UserAddressVO addressVO);
	public void addressDelete(int address_seq);

	
	public List<UserCouponVO> userCouponSelect(int user_seq);
	public int couponSelect(String couponCode); 

	public UserAddressVO addressSelect(String user_email);

	public List<PaymentVO> paymentList(HashMap<String, String> paraMap);

	List<PaymentVO> getUserPaymentInfo(String user_email);

	List<CartVO> getCartListByMerchantId(String merchantUid);
	
	List<AdminVO> getStoreList(AdminVO adminVO);

}
