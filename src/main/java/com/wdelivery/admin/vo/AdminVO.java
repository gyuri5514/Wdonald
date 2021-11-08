package com.wdelivery.admin.vo;

public class AdminVO {
	private int admin_seq;
	private String admin_id;
	private String admin_password;
	private String admin_name;
	private String admin_phone;
	private String store_name;
	private String store_address;
	private String store_phone;
	private int store_delivery;
	private int store_drivethru;
	private int store_status;
	private String store_code;
	public int getAdmin_seq() {
		return admin_seq;
	}
	public void setAdmin_seq(int admin_seq) {
		this.admin_seq = admin_seq;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_phone() {
		return admin_phone;
	}
	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_address() {
		return store_address;
	}
	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}
	public String getStore_phone() {
		return store_phone;
	}
	public void setStore_phone(String store_phone) {
		this.store_phone = store_phone;
	}
	public int getStore_delivery() {
		return store_delivery;
	}
	public void setStore_delivery(int store_delivery) {
		this.store_delivery = store_delivery;
	}
	public int getStore_drivethru() {
		return store_drivethru;
	}
	public void setStore_drivethru(int store_drivethru) {
		this.store_drivethru = store_drivethru;
	}
	public int getStore_status() {
		return store_status;
	}
	public void setStore_status(int store_status) {
		this.store_status = store_status;
	}
	public String getStore_code() {
		return store_code;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	@Override
	public String toString() {
		return "adminVO [admin_seq=" + admin_seq + ", admin_id=" + admin_id + ", admin_password=" + admin_password
				+ ", admin_name=" + admin_name + ", admin_phone=" + admin_phone + ", store_name=" + store_name
				+ ", store_address=" + store_address + ", store_phone=" + store_phone + ", store_delivery="
				+ store_delivery + ", store_drivethru=" + store_drivethru + ", store_status=" + store_status
				+ ", store_code=" + store_code + "]";
	}
	
	
	
}
