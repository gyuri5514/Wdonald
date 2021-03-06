package com.wdelivery.member.service;

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

	public List<UserAddressVO> addressSelect(String user_email);

	public List<PaymentVO> paymentList(HashMap<String, String> paraMap);

	List<PaymentVO> getUserPaymentInfo(String user_email);
	public void orderCancel(PaymentVO paymentVO);
	public List<CartVO> cartCancel(PaymentVO paymentVO);
	public void toyCancel(ToyCountVO toyCountVO);

	List<CartVO> getCartListByMerchantId(String merchantUid);
	
	List<AdminVO> getStoreList(AdminVO adminVO);

	List<AdminVO> findProximateStore(MapPointVO mpv);

	void updatePassword(UserVO userVO);
	
	public List<PromotionVO> selectPromotionIng();
	
	public PromotionVO detailPromotion(Integer p_code);

	AdminVO newWhichOneIsNearest(MapPointVO mapPointVO);

	List<AdminCouponVO> selectCouponBook(UserVO userVO);

	int registerUserCoupon(AdminCouponVO acv);

	List<AdminCouponVO> getUserCoupons(UserVO userVO);

	void restoreSocialMemStatus(UserVO userVO);

	void insertLastLogin(UserVO userVO);

}
