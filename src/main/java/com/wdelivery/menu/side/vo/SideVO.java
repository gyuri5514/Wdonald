package com.wdelivery.menu.side.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SideVO {

	private Integer s_code;
	private String s_name;
	private int s_price;
	private String s_img_path;
	private String s_img;
	private String s_n_img_path;
	private String s_n_img;
	private int s_status;
	private int s_kcal;
	private int category_code;
	private String s_e_name;
	private String s_detail_comment;
	private String s_detail_img_path;
	private String s_allergy;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date s_regdate;
	
	public Date getS_regdate() {
		return s_regdate;
	}
	public void setS_regdate(Date s_regdate) {
		this.s_regdate = s_regdate;
	}
	public String getS_allergy() {
		return s_allergy;
	}
	public void setS_allergy(String s_allergy) {
		this.s_allergy = s_allergy;
	}
	public String getS_detail_comment() {
		return s_detail_comment;
	}
	public void setS_detail_comment(String s_detail_comment) {
		this.s_detail_comment = s_detail_comment;
	}
	public String getS_detail_img_path() {
		return s_detail_img_path;
	}
	public void setS_detail_img_path(String s_detail_img_path) {
		this.s_detail_img_path = s_detail_img_path;
	}
	public Integer getS_code() {
		return s_code;
	}
	public void setS_code(Integer s_code) {
		this.s_code = s_code;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public String getS_img_path() {
		return s_img_path;
	}
	public void setS_img_path(String s_img_path) {
		this.s_img_path = s_img_path;
	}
	public String getS_img() {
		return s_img;
	}
	public void setS_img(String s_img) {
		this.s_img = s_img;
	}
	public String getS_n_img_path() {
		return s_n_img_path;
	}
	public void setS_n_img_path(String s_n_img_path) {
		this.s_n_img_path = s_n_img_path;
	}
	public String getS_n_img() {
		return s_n_img;
	}
	public void setS_n_img(String s_n_img) {
		this.s_n_img = s_n_img;
	}
	public int getS_status() {
		return s_status;
	}
	public void setS_status(int s_status) {
		this.s_status = s_status;
	}
	public int getS_kcal() {
		return s_kcal;
	}
	public void setS_kcal(int s_kcal) {
		this.s_kcal = s_kcal;
	}
	public int getCategory_code() {
		return category_code;
	}
	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}
	public String getS_e_name() {
		return s_e_name;
	}
	public void setS_e_name(String s_e_name) {
		this.s_e_name = s_e_name;
	}
	
}
