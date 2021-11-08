package com.wdelivery.qna.vo;

import java.util.Date;

public class QaaVO {
	private int qa_seq;
	private String qaa_content;
	private int admin_seq;
	private Date qaa_regdate;
	public int getQa_seq() {
		return qa_seq;
	}
	public void setQa_seq(int qa_seq) {
		this.qa_seq = qa_seq;
	}
	public String getQaa_content() {
		return qaa_content;
	}
	public void setQaa_content(String qaa_content) {
		this.qaa_content = qaa_content;
	}
	public int getAdmin_seq() {
		return admin_seq;
	}
	public void setAdmin_seq(int admin_seq) {
		this.admin_seq = admin_seq;
	}
	public Date getQaa_regdate() {
		return qaa_regdate;
	}
	public void setQaa_regdate(Date qaa_regdate) {
		this.qaa_regdate = qaa_regdate;
	}
	@Override
	public String toString() {
		return "QaaVO [qa_seq=" + qa_seq + ", qaa_content=" + qaa_content + ", admin_seq=" + admin_seq
				+ ", qaa_regdate=" + qaa_regdate + "]";
	}
	
	
}
