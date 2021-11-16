package com.wdelivery.news.vo;

import java.util.Date;

public class NewsVO {
	
	private Integer news_code;
	private String news_title;
	private Date news_regdate;
	private int news_count;
	private String news_content;
	private String news_img_path;
	
	public Integer getNews_code() {
		return news_code;
	}
	public void setNews_code(Integer news_code) {
		this.news_code = news_code;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public Date getNews_regdate() {
		return news_regdate;
	}
	public void setNews_regdate(Date news_regdate) {
		this.news_regdate = news_regdate;
	}
	public int getNews_count() {
		return news_count;
	}
	public void setNews_count(int news_count) {
		this.news_count = news_count;
	}
	public String getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}
	public String getNews_img_path() {
		return news_img_path;
	}
	public void setNews_img_path(String news_img_path) {
		this.news_img_path = news_img_path;
	}

}
