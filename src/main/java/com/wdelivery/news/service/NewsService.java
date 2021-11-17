package com.wdelivery.news.service;

import java.util.List;

import com.wdelivery.news.utils.Paging;
import com.wdelivery.news.vo.NewsVO;

public interface NewsService {

	public List<NewsVO> selectNews(Paging paging);
	
	public NewsVO detailNews(int news_code);

	// 게시물 총 개수
	public int totalNews();

}
