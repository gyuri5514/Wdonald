package com.wdelivery.member.payment.vo;

import java.util.Date;
/*
 *typeAliase = paymentVO
 * 
 */

public class PaymentVO {
	//help me
	private int order_seq;
	private String user_name;
	private int user_type;
	private Date order_date;
	private String delivery_time;
	private String user_address;
	private String user_phone;
	//hi
	private String order_status;
	private int total_price;
	private int final_price;
	private int discount;
	private String order_comment;
	private String user_email;
	//i am

	private String payment_type;
	private String store_code;
	private String coupon_no;
	//elon musk
	private String merchantuid;
	//if you see this comment, run
	private String pay_status;
	private String exactCash;
	//not too late to run away
	public int getOrder_seq() {
		return order_seq;
	}
	public String getUser_name() {
		return user_name;
	}
	public int getUser_type() {
		return user_type;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public String getDelivery_time() {
		return delivery_time;
	}
	public String getUser_address() {
		return user_address;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public String getOrder_status() {
		return order_status;
	}
	public int getTotal_price() {
		return total_price;
	}
	public int getFinal_price() {
		return final_price;
	}
	public int getDiscount() {
		return discount;
	}
	public String getOrder_comment() {
		return order_comment;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public String getStore_code() {
		return store_code;
	}
	public String getCoupon_no() {
		return coupon_no;
	}
	public String getMerchantuid() {
		return merchantuid;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public void setDelivery_time(String delivery_time) {
		this.delivery_time = delivery_time;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public void setFinal_price(int final_price) {
		this.final_price = final_price;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public void setOrder_comment(String order_comment) {
		this.order_comment = order_comment;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	public void setCoupon_no(String coupon_no) {
		this.coupon_no = coupon_no;
	}
	public void setMerchantuid(String merchantuid) {
		this.merchantuid = merchantuid;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getExactCash() {
		return exactCash;
	}
	public void setExactCash(String exactCash) {
		this.exactCash = exactCash;
	}
	@Override
	public String toString() {
		return "PaymentVO [order_seq=" + order_seq + ", user_name=" + user_name + ", user_type=" + user_type
				+ ", order_date=" + order_date + ", delivery_time=" + delivery_time + ", user_address=" + user_address
				+ ", user_phone=" + user_phone + ", order_status=" + order_status + ", total_price=" + total_price
				+ ", final_price=" + final_price + ", discount=" + discount + ", order_comment=" + order_comment
				+ ", user_email=" + user_email + ", payment_type=" + payment_type + ", store_code=" + store_code
				+ ", coupon_no=" + coupon_no + ", merchantuid=" + merchantuid + ", pay_status=" + pay_status
				+ ", exactCash=" + exactCash + "]";
	}
	
}
