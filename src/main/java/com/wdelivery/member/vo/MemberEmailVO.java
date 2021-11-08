package com.wdelivery.member.vo;

import java.util.Date;

public class MemberEmailVO {
	private int memberNo;
	private String email;
	private String password;
	private String nickname;
	private Date createdDate;
	private String authKey; //인증키
	private int authstatus; //권한확인
	private String idPhoto;
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getAuthKey() {
		return authKey;
	}
	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}
	public int getAuthstatus() {
		return authstatus;
	}
	public void setAuthstatus(int authstatus) {
		this.authstatus = authstatus;
	}
	public String getIdPhoto() {
		return idPhoto;
	}
	public void setIdPhoto(String idPhoto) {
		this.idPhoto = idPhoto;
	}
	@Override
	public String toString() {
		return "MemberEmailVO [memberNo=" + memberNo + ", email=" + email + ", password=" + password + ", nickname="
				+ nickname + ", createdDate=" + createdDate + ", authKey=" + authKey + ", authstatus=" + authstatus
				+ ", idPhoto=" + idPhoto + "]";
	}
	
	
}
