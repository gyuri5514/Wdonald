package com.wdelivery.member.payment.vo;

import java.util.Date;
/*
 *typeAliase = paymentVO
 * 
 */

import com.fasterxml.jackson.annotation.JsonFormat;

public class PaymentVO {
	//help me
	private int order_seq;
	private String user_name;
	private int user_type;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
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
	private String coupon_code;
	private String coupon_title;
	//elon musk
	private String merchantuid;
	//if you see this comment, run
	private String pay_status;
	private String exactCash;
	//not too late to run away
	private String store_name;
	private int ht_code;
	public int getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getDelivery_time() {
		return delivery_time;
	}
	public void setDelivery_time(String delivery_time) {
		this.delivery_time = delivery_time;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getFinal_price() {
		return final_price;
	}
	public void setFinal_price(int final_price) {
		this.final_price = final_price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getOrder_comment() {
		return order_comment;
	}
	public void setOrder_comment(String order_comment) {
		this.order_comment = order_comment;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
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
	public String getMerchantuid() {
		return merchantuid;
	}
	public void setMerchantuid(String merchantuid) {
		this.merchantuid = merchantuid;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	public String getExactCash() {
		return exactCash;
	}
	public void setExactCash(String exactCash) {
		this.exactCash = exactCash;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public int getHt_code() {
		return ht_code;
	}
	public void setHt_code(int ht_code) {
		this.ht_code = ht_code;
	}
	@Override
	public String toString() {
		return "PaymentVO [order_seq=" + order_seq + ", user_name=" + user_name + ", user_type=" + user_type
				+ ", order_date=" + order_date + ", delivery_time=" + delivery_time + ", user_address=" + user_address
				+ ", user_phone=" + user_phone + ", order_status=" + order_status + ", total_price=" + total_price
				+ ", final_price=" + final_price + ", discount=" + discount + ", order_comment=" + order_comment
				+ ", user_email=" + user_email + ", payment_type=" + payment_type + ", store_code=" + store_code
				+ ", coupon_code=" + coupon_code + ", coupon_title=" + coupon_title + ", merchantuid=" + merchantuid
				+ ", pay_status=" + pay_status + ", exactCash=" + exactCash + ", store_name=" + store_name
				+ ", ht_code=" + ht_code + "]";
	}
	
	
}
