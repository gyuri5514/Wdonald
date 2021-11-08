package com.wdelivery.member.vo;

public class KakaoUserVO {
	private String email;
	private String gender;
	private String birthday;

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

	@Override
	public String toString() {
		return "KakaoUserVO [email=" + email + ", gender=" + gender + ", birthday=" + birthday + ", getEmail()="
				+ getEmail() + ", getGender()=" + getGender() + ", getBirthday()=" + getBirthday() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

}
