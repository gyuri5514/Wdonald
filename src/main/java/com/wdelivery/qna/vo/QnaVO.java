package com.wdelivery.qna.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;


public class QnaVO {
	private int qa_seq;
	private String qa_title;
	private String qa_content;
	private String qa_password;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date qa_regdate;
	private int qa_status;
	private String qa_store;
	private String qa_name;
	private String qa_phone1;
	private String qa_phone2;
	private String qa_phone3;
	private String qa_email;
	private String qa_agree1;
	private String qa_agree2;

	public int getQa_seq() {
		return qa_seq;
	}

	public void setQa_seq(int qa_seq) {
		this.qa_seq = qa_seq;
	}

	public String getQa_title() {
		return qa_title;
	}

	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public String getQa_password() {
		return qa_password;
	}

	public void setQa_password(String qa_password) {
		this.qa_password = qa_password;
	}

	public Date getQa_regdate() {
		return qa_regdate;
	}

	public void setQa_regdate(Date qa_regdate) {
		this.qa_regdate = qa_regdate;
	}

	public int getQa_status() {
		return qa_status;
	}

	public void setQa_status(int qa_status) {
		this.qa_status = qa_status;
	}

	public String getQa_store() {
		return qa_store;
	}

	public void setQa_store(String qa_store) {
		this.qa_store = qa_store;
	}

	public String getQa_name() {
		return qa_name;
	}

	public void setQa_name(String qa_name) {
		this.qa_name = qa_name;
	}

	public String getQa_phone1() {
		return qa_phone1;
	}

	public void setQa_phone1(String qa_phone1) {
		this.qa_phone1 = qa_phone1;
	}

	public String getQa_phone2() {
		return qa_phone2;
	}

	public void setQa_phone2(String qa_phone2) {
		this.qa_phone2 = qa_phone2;
	}

	public String getQa_phone3() {
		return qa_phone3;
	}

	public void setQa_phone3(String qa_phone3) {
		this.qa_phone3 = qa_phone3;
	}

	public String getQa_email() {
		return qa_email;
	}

	public void setQa_email(String qa_email) {
		this.qa_email = qa_email;
	}

	public String getQa_agree1() {
		return qa_agree1;
	}

	public void setQa_agree1(String qa_agree1) {
		this.qa_agree1 = qa_agree1;
	}

	public String getQa_agree2() {
		return qa_agree2;
	}

	public void setQa_agree2(String qa_agree2) {
		this.qa_agree2 = qa_agree2;
	}

	@Override
	public String toString() {
		return "QnaVO [qa_seq=" + qa_seq + ", qa_title=" + qa_title + ", qa_content=" + qa_content + ", qa_password="
				+ qa_password + ", qa_regdate=" + qa_regdate + ", qa_status=" + qa_status + ", qa_store=" + qa_store
				+ ", qa_name=" + qa_name + ", qa_phone1=" + qa_phone1 + ", qa_phone2=" + qa_phone2 + ", qa_phone3="
				+ qa_phone3 + ", qa_email=" + qa_email + ", qa_agree1=" + qa_agree1 + ", qa_agree2=" + qa_agree2 + "]";
	}

}
