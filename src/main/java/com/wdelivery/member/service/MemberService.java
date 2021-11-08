package com.wdelivery.member.service;

import java.util.Map;

import com.wdelivery.member.vo.UserAddressVO;
import com.wdelivery.member.vo.UserVO;

public interface MemberService {

	UserVO findUser(UserVO userVO);
	
	public void winMemJoin(UserVO userVO);
	public void winAddressJoin(UserAddressVO addressVO);
	int emailChk(String user_email) throws Exception;
	public void certifiedPhoneNumber(String user_phone, String numStr);
	public UserVO userSelect(String user_email);
	public void mypageUpdate(UserVO userVO);
	public void mypageDelete(UserVO userVO); //don하는 중
	void insertAuthData(UserVO userVO);
	void updateAuthKey(Map<String, String> map);
	void signUpConfirm(String email);
	boolean isAuthKeyAvailable(Map<String, String> emailMap);
	UserVO isMemberInService(String loginType, String email);
	void socialMemJoin(String joinType, UserVO userVO);
	
	public UserAddressVO addressShow(String user_email);
	public void addressInsert(UserAddressVO addressVO);
	public void addressUpdate(UserAddressVO addressVO);
	public void addressDelete(int address_seq);
}
