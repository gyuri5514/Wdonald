package com.wdelivery.news.service;

import java.util.List;

import com.wdelivery.news.utils.Criteria;
import com.wdelivery.news.vo.NewsVO;

public interface NewsService {

	public List<NewsVO> selectNews(Criteria cri);

	// 게시물 총 개수
	public int totalNews(Criteria cri);

	public NewsVO detailNews(Integer news_code);

	public void countNews(Integer news_code);

	public List<NewsVO> selectNewsNotice();

	public List<NewsVO> news(NewsVO newsVO);

	public void insertNews(NewsVO newsVO);

	public void updateNews(NewsVO newsVO);

	public void deleteNews(int news_code);

	public NewsVO newsDetail(NewsVO newsVO);

}
