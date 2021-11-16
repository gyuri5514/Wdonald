package com.wdelivery.news.service;

import java.util.List;

import com.wdelivery.news.vo.NewsVO;

public interface NewsService {
	
	public List<NewsVO> selectNews();

}
