package com.wdelivery.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wdelivery.admin.vo.AdminCouponVO;
import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.payment.vo.ToyCountVO;
import com.wdelivery.member.util.MapPointVO;
import com.wdelivery.member.vo.UserAddressVO;
import com.wdelivery.member.vo.UserCouponVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.promotion.vo.PromotionVO;

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
	public int couponSelect(String couponCode); 
	
	public List<UserAddressVO> addressSelect(String user_email);

	public List<PaymentVO> paymentList(HashMap<String, String> paraMap);

	public List<PaymentVO> getUserPaymentInfo(String user_email);
	public void orderCancel(int order_seq);
	public void toyCancel(ToyCountVO toyCountVO);

	public List<CartVO> getCartListByMerchantId(String merchantUid);

	List<AdminVO> getStoreList(AdminVO adminVO);

	public void updatePassword(UserVO userVO);
	
	public List<PromotionVO> selectPromotionIng();
	
	public PromotionVO detailPromotion(Integer p_code);

	public List<AdminCouponVO> selectCouponBook(UserVO userVO);

	public int registerUserCoupon(AdminCouponVO acv);


}
