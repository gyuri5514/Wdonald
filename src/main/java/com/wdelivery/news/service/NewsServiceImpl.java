package com.wdelivery.news.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.news.dao.NewsDAO;
import com.wdelivery.news.vo.NewsVO;

@Service
public class NewsServiceImpl implements NewsService {

	@Autowired
	private NewsDAO newsDAO;
	
	@Override
	public List<NewsVO> selectNews() {
		return newsDAO.selectNews();
	}

}
