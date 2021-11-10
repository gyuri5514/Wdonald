package com.wdelivery.member.vo;

import java.util.Date;
/*
 * 
 * typeAlias = UserCouponVO
 * 
 */
public class UserCouponVO {
	private int user_seq;
	private String coupon_code;
	private Date coupon_startdate;
	private Date coupon_enddate;
	private int coupon_status;
	private String coupon_name;
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public String getCoupon_code() {
		return coupon_code;
	}
	public void setCoupon_code(String coupon_code) {
		this.coupon_code = coupon_code;
	}
	public Date getCoupon_startdate() {
		return coupon_startdate;
	}
	public void setCoupon_startdate(Date coupon_startdate) {
		this.coupon_startdate = coupon_startdate;
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
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	@Override
	public String toString() {
		return "UserCouponVO [user_seq=" + user_seq + ", coupon_code=" + coupon_code + ", coupon_startdate="
				+ coupon_startdate + ", coupon_enddate=" + coupon_enddate + ", coupon_status=" + coupon_status
				+ ", coupon_name=" + coupon_name + "]";
	}
	
	
}
