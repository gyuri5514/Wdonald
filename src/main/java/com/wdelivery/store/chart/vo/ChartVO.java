package com.wdelivery.store.chart.vo;

public class ChartVO {
	private int sales_amount;
	private int sales_count;// quantity of sales
	// @JsonFormat(pattern="yy-MM-dd")
	private String daily_chart;
	// @JsonFormat(pattern="yyyy-MM-dd")
	private String month_chart;
	// @JsonFormat(pattern="yyyy-MM")
	private String year_chart;
	private String user_gender;
	private String user_status;// member, naver , kakao , not member
	private String store_code;
	private String payment_type;
	private String start_date;
	private String end_date;
	private String date_term;
	private String type;
	private String order_status;
	private String product_name;
	private String store_name;
	public int getSales_amount() {
		return sales_amount;
	}
	public int getSales_count() {
		return sales_count;
	}
	public String getDaily_chart() {
		return daily_chart;
	}
	public String getMonth_chart() {
		return month_chart;
	}
	public String getYear_chart() {
		return year_chart;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public String getUser_status() {
		return user_status;
	}
	public String getStore_code() {
		return store_code;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public String getStart_date() {
		return start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public String getDate_term() {
		return date_term;
	}
	public String getType() {
		return type;
	}
	public String getOrder_status() {
		return order_status;
	}
	public String getProduct_name() {
		return product_name;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setSales_amount(int sales_amount) {
		this.sales_amount = sales_amount;
	}
	public void setSales_count(int sales_count) {
		this.sales_count = sales_count;
	}
	public void setDaily_chart(String daily_chart) {
		this.daily_chart = daily_chart;
	}
	public void setMonth_chart(String month_chart) {
		this.month_chart = month_chart;
	}
	public void setYear_chart(String year_chart) {
		this.year_chart = year_chart;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}
	public void setStore_code(String store_code) {
		this.store_code = store_code;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public void setDate_term(String date_term) {
		this.date_term = date_term;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	@Override
	public String toString() {
		return "ChartVO [sales_amount=" + sales_amount + ", sales_count=" + sales_count + ", daily_chart=" + daily_chart
				+ ", month_chart=" + month_chart + ", year_chart=" + year_chart + ", user_gender=" + user_gender
				+ ", user_status=" + user_status + ", store_code=" + store_code + ", payment_type=" + payment_type
				+ ", start_date=" + start_date + ", end_date=" + end_date + ", date_term=" + date_term + ", type="
				+ type + ", order_status=" + order_status + ", product_name=" + product_name + ", store_name="
				+ store_name + "]";
	}
	
}
