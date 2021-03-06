package com.wdelivery.promotion.vo;

import java.util.Date;

public class PromotionVO {

	private Integer p_code;
	private String p_detail_img_path;
	private String p_img_path;
	private String p_name;
	private Date p_regdate;
	private int p_status;
	private String p_title;
	private String p_link1;
	private int p_count;
	private String p_link2;
	private String p_youtube;

	public String getP_link1() {
		return p_link1;
	}
	public void setP_link1(String p_link1) {
		this.p_link1 = p_link1;
	}
	public String getP_link2() {
		return p_link2;
	}
	public void setP_link2(String p_link2) {
		this.p_link2 = p_link2;
	}
	public String getP_youtube() {
		return p_youtube;
	}
	public void setP_youtube(String p_youtube) {
		this.p_youtube = p_youtube;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}
	public Integer getP_code() {
		return p_code;
	}
	public void setP_code(Integer p_code) {
		this.p_code = p_code;
	}
	public String getP_detail_img_path() {
		return p_detail_img_path;
	}
	public void setP_detail_img_path(String p_detail_img_path) {
		this.p_detail_img_path = p_detail_img_path;
	}
	public String getP_img_path() {
		return p_img_path;
	}
	public void setP_img_path(String p_img_path) {
		this.p_img_path = p_img_path;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public Date getP_regdate() {
		return p_regdate;
	}
	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}
	public int getP_status() {
		return p_status;
	}
	public void setP_status(int p_status) {
		this.p_status = p_status;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	
}
