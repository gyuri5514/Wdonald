package com.wdelivery.member.payment.vo;

public class ToyCountVO {
	/*
	 * private AdminVO adminVO; private CartVO cartVO; private PaymentVO paymentVO;
	 */
	
	private int admin_seq;
	private String ht_name;
	private String ht_series;
	private String ht_count;
	private String store_code;
	private int ht_code;
	private int product_quantity;
	private int order_seq;
	
	
	public int getOrder_seq() {
		return order_seq;
	}
	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}
	public int getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}
	public int getHt_code() {
		return ht_code;
	}
	public void setHt_code(int ht_code) {
		this.ht_code = ht_code;
	}
	public int getAdmin_seq() {
		return admin_seq;
	}
	public void setAdmin_seq(int admin_seq) {
		this.admin_seq = admin_seq;
	}
	public String getHt_name() {
		return ht_name;
	}
	public void setHt_name(String ht_name) {
		this.ht_name = ht_name;
	}
	public String getHt_series() {
		return ht_series;
	}
	public void setHt_series(String ht_series) {
		this.ht_series = ht_series;
	}
	public String getHt_count() {
		return ht_count;
	}
	public void setHt_count(String ht_count) {
		this.ht_count = ht_count;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	@Override
	public String toString() {
		return "ToyCountVO [admin_seq=" + admin_seq + ", ht_name=" + ht_name + ", ht_series=" + ht_series
				+ ", ht_count=" + ht_count + ", store_code=" + store_code + ", ht_code=" + ht_code
				+ ", product_quantity=" + product_quantity + ", order_seq=" + order_seq + "]";
	}
	
	

}
