package com.wdelivery.menu.dessert.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class DessertVO {

	private Integer dessert_code;
	private String dessert_name;
	private String dessert_img_path;
	private String dessert_img;
	private String dessert_detail_img_path;
	private String dessert_detail_img;
	private int dessert_status;
	private int dessert_kcal;
	private int category_code;
	private String dessert_e_name;

	private int dessert_price;
	private String dessert_n_img_path;
	private String dessert_n_img;
	private String dessert_allergy;
	private String dessert_detail_comment;
	

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dessert_regdate;
	

	public String getDessert_detail_img_path() {
		return dessert_detail_img_path;
	}
	public void setDessert_detail_img_path(String dessert_detail_img_path) {
		this.dessert_detail_img_path = dessert_detail_img_path;
	}
	public String getDessert_detail_img() {
		return dessert_detail_img;
	}
	public void setDessert_detail_img(String dessert_detail_img) {
		this.dessert_detail_img = dessert_detail_img;
	}
	
	public int getDessert_price() {
		return dessert_price;
	}
	public void setDessert_price(int dessert_price) {
		this.dessert_price = dessert_price;
	}
	public String getDessert_allergy() {
		return dessert_allergy;
	}
	public void setDessert_allergy(String dessert_allergy) {
		this.dessert_allergy = dessert_allergy;
	}

	public String getDessert_detail_comment() {
		return dessert_detail_comment;
	}
	public void setDessert_detail_comment(String dessert_detail_comment) {
		this.dessert_detail_comment = dessert_detail_comment;
	}
	public Date getDessert_regdate() {
		return dessert_regdate;
	}
	public void setDessert_regdate(Date dessert_regdate) {
		this.dessert_regdate = dessert_regdate;
	}
	public Integer getDessert_code() {
		return dessert_code;
	}
	public void setDessert_code(Integer dessert_code) {
		this.dessert_code = dessert_code;
	}
	public String getDessert_name() {
		return dessert_name;
	}
	public void setDessert_name(String dessert_name) {
		this.dessert_name = dessert_name;
	}
	public String getDessert_img_path() {
		return dessert_img_path;
	}
	public void setDessert_img_path(String dessert_img_path) {
		this.dessert_img_path = dessert_img_path;
	}
	public String getDessert_img() {
		return dessert_img;
	}
	public void setDessert_img(String dessert_img) {
		this.dessert_img = dessert_img;
	}
	public String getDessert_n_img_path() {
		return dessert_n_img_path;
	}
	public void setDessert_n_img_path(String dessert_n_img_path) {
		this.dessert_n_img_path = dessert_n_img_path;
	}
	public String getDessert_n_img() {
		return dessert_n_img;
	}
	public void setDessert_n_img(String dessert_n_img) {
		this.dessert_n_img = dessert_n_img;
	}
	public int getDessert_status() {
		return dessert_status;
	}
	public void setDessert_status(int dessert_status) {
		this.dessert_status = dessert_status;
	}
	public int getDessert_kcal() {
		return dessert_kcal;
	}
	public void setDessert_kcal(int dessert_kcal) {
		this.dessert_kcal = dessert_kcal;
	}
	public int getCategory_code() {
		return category_code;
	}
	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}
	public String getDessert_e_name() {
		return dessert_e_name;
	}
	public void setDessert_e_name(String dessert_e_name) {
		this.dessert_e_name = dessert_e_name;
	}
}
