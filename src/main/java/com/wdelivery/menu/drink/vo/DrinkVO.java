package com.wdelivery.menu.drink.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class DrinkVO {
	
	private Integer d_code;
	private String d_name;
	private String d_img_path;
	private String d_img;
	private String d_n_img_path;
	private String d_n_img;
	private int d_status;
	private int category_code;
	private String d_e_name;
	private int d_kcal;
	private int d_price;
	private String d_detail_img_path;
	private String d_detail_comment;
	private String d_allergy;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date d_regdate;
	
	public Date getD_regdate() {
		return d_regdate;
	}
	public void setD_regdate(Date d_regdate) {
		this.d_regdate = d_regdate;
	}
	public String getD_allergy() {
		return d_allergy;
	}
	public void setD_allergy(String d_allergy) {
		this.d_allergy = d_allergy;
	}
	public Integer getD_code() {
		return d_code;
	}
	public int getD_price() {
		return d_price;
	}
	public void setD_price(int d_price) {
		this.d_price = d_price;
	}
	public void setD_code(Integer d_code) {
		this.d_code = d_code;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getD_img_path() {
		return d_img_path;
	}
	public void setD_img_path(String d_img_path) {
		this.d_img_path = d_img_path;
	}
	public String getD_img() {
		return d_img;
	}
	public void setD_img(String d_img) {
		this.d_img = d_img;
	}
	public String getD_n_img_path() {
		return d_n_img_path;
	}
	public void setD_n_img_path(String d_n_img_path) {
		this.d_n_img_path = d_n_img_path;
	}
	public String getD_n_img() {
		return d_n_img;
	}
	public void setD_n_img(String d_n_img) {
		this.d_n_img = d_n_img;
	}
	public int getD_status() {
		return d_status;
	}
	public void setD_status(int d_status) {
		this.d_status = d_status;
	}
	public int getCategory_code() {
		return category_code;
	}
	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}
	public String getD_e_name() {
		return d_e_name;
	}
	public void setD_e_name(String d_e_name) {
		this.d_e_name = d_e_name;
	}
	public int getD_kcal() {
		return d_kcal;
	}
	public void setD_kcal(int d_kcal) {
		this.d_kcal = d_kcal;
	}
	public String getD_detail_img_path() {
		return d_detail_img_path;
	}
	public void setD_detail_img_path(String d_detail_img_path) {
		this.d_detail_img_path = d_detail_img_path;
	}
	public String getD_detail_comment() {
		return d_detail_comment;
	}
	public void setD_detail_comment(String d_detail_comment) {
		this.d_detail_comment = d_detail_comment;
	}
	
}
