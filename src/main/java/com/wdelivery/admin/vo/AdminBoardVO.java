package com.wdelivery.admin.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AdminBoardVO {
	
	public int notice_seq;
	public String notice_title;
	public String notice_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	public Date notice_regdate;
	public int admin_seq;
	
	public int getNotice_seq() {
		return notice_seq;
	}
	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_regdate() {
		return notice_regdate;
	}
	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}
	public int getAdmin_seq() {
		return admin_seq;
	}
	public void setAdmin_seq(int admin_seq) {
		this.admin_seq = admin_seq;
	}
	@Override
	public String toString() {
		return "AdminBoardVO [notice_seq=" + notice_seq + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_regdate=" + notice_regdate + ", admin_seq=" + admin_seq + "]";
	}
	
}
