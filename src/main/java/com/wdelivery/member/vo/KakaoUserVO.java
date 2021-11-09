package com.wdelivery.member.vo;

public class KakaoUserVO {
	private String email;
	private String gender;
	private String birthday;
	private String nickname;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "KakaoUserVO [email=" + email + ", gender=" + gender + ", birthday=" + birthday + ", nickname="
				+ nickname + "]";
	}

}
