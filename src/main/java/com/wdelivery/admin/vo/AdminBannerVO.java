package com.wdelivery.admin.vo;

public class AdminBannerVO {

	private int banner_seq;
	private String banner_title;
	private String banner_img;
	private String banner_content;
	private int p_code;

	public int getP_code() {
		return p_code;
	}

	public void setP_code(int p_code) {
		this.p_code = p_code;
	}

	public int getBanner_seq() {
		return banner_seq;
	}

	public void setBanner_seq(int banner_seq) {
		this.banner_seq = banner_seq;
	}

	public String getBanner_title() {
		return banner_title;
	}

	public void setBanner_title(String banner_title) {
		this.banner_title = banner_title;
	}

	public String getBanner_img() {
		return banner_img;
	}

	public void setBanner_img(String banner_img) {
		this.banner_img = banner_img;
	}

	public String getBanner_content() {
		return banner_content;
	}

	public void setBanner_content(String banner_content) {
		this.banner_content = banner_content;
	}

}
