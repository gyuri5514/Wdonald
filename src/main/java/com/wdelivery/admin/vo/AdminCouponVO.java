package com.wdelivery.admin.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AdminCouponVO {
	private String coupon_code;
	private String coupon_title;
	private String coupon_type;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_regdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_enddate;
	private int coupon_status;
	private int coupon_discount;
	public String getCoupon_code() {
		return coupon_code;
	}
	public void setCoupon_code(String coupon_code) {
		this.coupon_code = coupon_code;
	}
	public String getCoupon_title() {
		return coupon_title;
	}
	public void setCoupon_title(String coupon_title) {
		this.coupon_title = coupon_title;
	}
	public String getCoupon_type() {
		return coupon_type;
	}
	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}
	public Date getCoupon_regdate() {
		return coupon_regdate;
	}
	public void setCoupon_regdate(Date coupon_regdate) {
		this.coupon_regdate = coupon_regdate;
	}
	public Date getCoupon_enddate() {
		return coupon_enddate;
	}
	public void setCoupon_enddate(Date coupon_enddate) {
		this.coupon_enddate = coupon_enddate;
	}
	public int getCoupon_status() {
		return coupon_status;
	}
	public void setCoupon_status(int coupon_status) {
		this.coupon_status = coupon_status;
	}
	public int getCoupon_discount() {
		return coupon_discount;
	}
	public void setCoupon_discount(int coupon_discount) {
		this.coupon_discount = coupon_discount;
	}
	@Override
	public String toString() {
		return "AdminCouponVO [coupon_code=" + coupon_code + ", coupon_title=" + coupon_title + ", coupon_type="
				+ coupon_type + ", coupon_regdate=" + coupon_regdate + ", coupon_enddate=" + coupon_enddate
				+ ", coupon_status=" + coupon_status + ", coupon_discount=" + coupon_discount + "]";
	}
	
	
}
