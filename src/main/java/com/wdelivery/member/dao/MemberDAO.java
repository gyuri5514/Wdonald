package com.wdelivery.member.dao;

import java.util.Map;

import com.wdelivery.member.vo.UserAddressVO;
import com.wdelivery.member.vo.UserVO;

public interface MemberDAO {

	public UserVO findUser(UserVO userVO);
	
	public void winMemJoin(UserVO userVO);
	public void winAddressJoin(UserAddressVO addressVO);
	int emailChk(String user_email) throws Exception;
	String sendSMS(String user_phone);

	public UserVO userSelect(String user_email);
	public void mypageUpdate(UserVO userVO);
	public void mypageDelete(UserVO userVO); //don ÇÏ´Â Áß
	public void insertAuthData(UserVO userVO);
	public void updateAuthKey(Map<String, String> map);
	public void signUpConfirm(String email);
	public int isAuthKeyAvailable(Map<String, String> emailMap);

	public UserVO isThisKakaoMemberInService(String email);
	public UserVO isThisNaverMemberInService(String email);

	public void naverMemJoin(UserVO userVO);

	public void kakaoMemJoin(UserVO userVO);
	
	public UserAddressVO addressShow(String user_email);
	public void addressInsert(UserAddressVO addressVO);
	public void addressUpdate(UserAddressVO addressVO);
	public void addressDelete(int address_seq);
}
