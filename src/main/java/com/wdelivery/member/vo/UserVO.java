package com.wdelivery.member.vo;

import java.util.Date;

public class UserVO {
	
	private String user_email;
	private String user_password;
	private String user_name;
	private String user_gender;
	private String user_phone;
	private int user_seq;
	private int user_status;
	private Date user_regdate;
	private int terms_agree;
	private Date user_agreedate;
	private int sms_agree;
	private int email_agree;
	private String user_birth;
	private String order_comment;
	
	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public int getUser_status() {
		return user_status;
	}

	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}

	public Date getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}

	public int getTerms_agree() {
		return terms_agree;
	}

	public void setTerms_agree(int terms_agree) {
		this.terms_agree = terms_agree;
	}

	public Date getUser_agreedate() {
		return user_agreedate;
	}

	public void setUser_agreedate(Date user_agreedate) {
		this.user_agreedate = user_agreedate;
	}

	public int getSms_agree() {
		return sms_agree;
	}

	public void setSms_agree(int sms_agree) {
		this.sms_agree = sms_agree;
	}

	public int getEmail_agree() {
		return email_agree;
	}

	public void setEmail_agree(int email_agree) {
		this.email_agree = email_agree;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getOrder_comment() {
		return order_comment;
	}

	public void setOrder_comment(String order_comment) {
		this.order_comment = order_comment;
	}

	@Override
	public String toString() {
		return "UserVO [user_email=" + user_email + ", user_password=" + user_password + ", user_name=" + user_name
				+ ", user_gender=" + user_gender + ", user_phone=" + user_phone + ", user_seq=" + user_seq
				+ ", user_status=" + user_status + ", user_regdate=" + user_regdate + ", terms_agree=" + terms_agree
				+ ", user_agreedate=" + user_agreedate + ", sms_agree=" + sms_agree + ", email_agree=" + email_agree
				+ ", user_birth=" + user_birth + ", order_comment=" + order_comment + "]";
	}
	
}
