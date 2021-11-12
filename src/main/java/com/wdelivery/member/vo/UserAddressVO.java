package com.wdelivery.member.vo;

public class UserAddressVO {
//	private int user_seq;
	private String user_email;
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	private String address1;
	private String address2;
	private int address_seq;
	private String d_key;
	private String order_comment;
	private double address_lat;
	private double address_lon;
	
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public int getAddress_seq() {
		return address_seq;
	}
	public void setAddress_seq(int address_seq) {
		this.address_seq = address_seq;
	}
	public String getD_key() {
		return d_key;
	}
	public void setD_key(String d_key) {
		this.d_key = d_key;
	}
	
	public String getOrder_comment() {
		return order_comment;
	}
	public void setOrder_comment(String order_comment) {
		this.order_comment = order_comment;
	}
	
	public double getAddress_lat() {
		return address_lat;
	}
	public void setAddress_lat(double address_lat) {
		this.address_lat = address_lat;
	}
	public double getAddress_lon() {
		return address_lon;
	}
	public void setAddress_lon(double address_lon) {
		this.address_lon = address_lon;
	}
	@Override
	public String toString() {
		return "UserAddressVO [user_email=" + user_email + ", address1=" + address1 + ", address2=" + address2
				+ ", address_seq=" + address_seq + ", d_key=" + d_key + ", order_comment=" + order_comment
				+ ", address_lat=" + address_lat + ", address_lon=" + address_lon + "]";
	}

}
