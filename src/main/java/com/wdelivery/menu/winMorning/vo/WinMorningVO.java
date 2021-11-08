package com.wdelivery.menu.winMorning.vo;

import java.util.Date;

public class WinMorningVO {

	private Integer w_code;
	private String w_name;
	private String w_price;
	private int w_kcal;
	private Date w_regdate;
	private String w_img_path;
	private String w_img;
	private String w_n_img_path;
	private String w_n_img;
	private int w_status;
	private int category_code;
	private String w_e_name;
	
	public Integer getCategory_code() {
		return category_code;
	}
	public void setCategory_code(Integer category_code) {
		this.category_code = category_code;
	}
	public String getW_e_name() {
		return w_e_name;
	}
	public void setW_e_name(String w_e_name) {
		this.w_e_name = w_e_name;
	}
	public int getW_code() {
		return w_code;
	}
	public void setW_code(int w_code) {
		this.w_code = w_code;
	}
	public String getW_name() {
		return w_name;
	}
	public void setW_name(String w_name) {
		this.w_name = w_name;
	}
	public String getW_price() {
		return w_price;
	}
	public void setW_price(String w_price) {
		this.w_price = w_price;
	}
	public int getW_kcal() {
		return w_kcal;
	}
	public void setW_kcal(int w_kcal) {
		this.w_kcal = w_kcal;
	}
	public Date getW_regdate() {
		return w_regdate;
	}
	public void setW_regdate(Date w_regdate) {
		this.w_regdate = w_regdate;
	}
	public String getW_img_path() {
		return w_img_path;
	}
	public void setW_img_path(String w_img_path) {
		this.w_img_path = w_img_path;
	}
	public String getW_img() {
		return w_img;
	}
	public void setW_img(String w_img) {
		this.w_img = w_img;
	}
	public String getW_n_img_path() {
		return w_n_img_path;
	}
	public void setW_n_img_path(String w_n_img_path) {
		this.w_n_img_path = w_n_img_path;
	}
	public String getW_n_img() {
		return w_n_img;
	}
	public void setW_n_img(String w_n_img) {
		this.w_n_img = w_n_img;
	}
	public int getW_status() {
		return w_status;
	}
	public void setW_status(int w_status) {
		this.w_status = w_status;
	}
	
}
