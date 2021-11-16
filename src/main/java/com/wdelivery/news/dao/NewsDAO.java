package com.wdelivery.news.dao;

import java.util.List;

import com.wdelivery.news.vo.NewsVO;

public interface NewsDAO {
	
	public List<NewsVO> selectNews();

}
