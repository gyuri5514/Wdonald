package com.wdelivery.happypromotion.vo;

import java.util.Date;

public class HappyPromotionVO {

	private Integer hp_code;
	private String hp_name;
	private String hp_img_path;
	private String hp_detail_img_path;
	private String hp_title;
	private Date hp_regdate;
	private int hp_status;
	private int hp_count;
	
	public int getHp_count() {
		return hp_count;
	}
	public void setHp_count(int hp_count) {
		this.hp_count = hp_count;
	}
	public Integer getHp_code() {
		return hp_code;
	}
	public void setHp_code(Integer hp_code) {
		this.hp_code = hp_code;
	}
	public String getHp_name() {
		return hp_name;
	}
	public void setHp_name(String hp_name) {
		this.hp_name = hp_name;
	}
	public String getHp_img_path() {
		return hp_img_path;
	}
	public void setHp_img_path(String hp_img_path) {
		this.hp_img_path = hp_img_path;
	}
	public String getHp_detail_img_path() {
		return hp_detail_img_path;
	}
	public void setHp_detail_img_path(String hp_detail_img_path) {
		this.hp_detail_img_path = hp_detail_img_path;
	}
	public String getHp_title() {
		return hp_title;
	}
	public void setHp_title(String hp_title) {
		this.hp_title = hp_title;
	}
	public Date getHp_regdate() {
		return hp_regdate;
	}
	public void setHp_regdate(Date hp_regdate) {
		this.hp_regdate = hp_regdate;
	}
	public int getHp_status() {
		return hp_status;
	}
	public void setHp_status(int hp_status) {
		this.hp_status = hp_status;
	}
}
