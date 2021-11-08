package com.wdelivery.menu.burger.vo;

import java.util.Date;

public class BurgerVO {

	private Integer b_code;
	private String b_name;
	private String b_price;
	private String b_kcal;
	private Date b_regdate;
	private String b_img_path;
	private String b_img;
	private int b_status;
	private String b_n_img_path;
	private String b_n_img;
	private int category_code;
	private String b_e_name;
	private String b_detail_img_path;

	public String getB_detail_img_path() {
		return b_detail_img_path;
	}

	public void setB_detail_img_path(String b_detail_img_path) {
		this.b_detail_img_path = b_detail_img_path;
	}

	public Integer getB_code() {
		return b_code;
	}

	public void setB_code(Integer b_code) {
		this.b_code = b_code;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_price() {
		return b_price;
	}

	public void setB_price(String b_price) {
		this.b_price = b_price;
	}

	public String getB_kcal() {
		return b_kcal;
	}

	public void setB_kcal(String b_kcal) {
		this.b_kcal = b_kcal;
	}

	public Date getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}

	public String getB_img_path() {
		return b_img_path;
	}

	public void setB_img_path(String b_img_path) {
		this.b_img_path = b_img_path;
	}

	public String getB_img() {
		return b_img;
	}

	public void setB_img(String b_img) {
		this.b_img = b_img;
	}

	public int getB_status() {
		return b_status;
	}

	public void setB_status(int b_status) {
		this.b_status = b_status;
	}

	public String getB_n_img_path() {
		return b_n_img_path;
	}

	public void setB_n_img_path(String b_n_img_path) {
		this.b_n_img_path = b_n_img_path;
	}

	public String getB_n_img() {
		return b_n_img;
	}

	public void setB_n_img(String b_n_img) {
		this.b_n_img = b_n_img;
	}

	public int getCategory_code() {
		return category_code;
	}

	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}

	public String getB_e_name() {
		return b_e_name;
	}

	public void setB_e_name(String b_e_name) {
		this.b_e_name = b_e_name;
	}

	@Override
	public String toString() {
		return "BurgerVO [b_code=" + b_code + ", b_name=" + b_name + ", b_price=" + b_price + ", b_kcal=" + b_kcal
				+ ", b_regdate=" + b_regdate + ", b_img_path=" + b_img_path + ", b_img=" + b_img + ", b_status="
				+ b_status + ", b_n_img_path=" + b_n_img_path + ", b_n_img=" + b_n_img + ", category_code="
				+ category_code + ", b_e_name=" + b_e_name + "]";
	}

}
