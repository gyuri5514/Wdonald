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
	

}
