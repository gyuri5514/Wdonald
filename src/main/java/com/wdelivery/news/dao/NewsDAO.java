package com.wdelivery.news.dao;

import java.util.List;

import com.wdelivery.news.utils.Paging;
import com.wdelivery.news.vo.NewsVO;

public interface NewsDAO {
	
	public List<NewsVO> selectNews(Paging paging);
	
	// 게시물 총 개수
	public int totalNews();
	
	// 페이징 처리 게시글 조회
	public List<NewsVO> selectNewsPaging(Paging paging);
	
}
