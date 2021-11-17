package com.wdelivery.news.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.news.dao.NewsDAO;
import com.wdelivery.news.utils.Criteria;
import com.wdelivery.news.vo.NewsVO;

@Service
public class NewsServiceImpl implements NewsService {

	@Autowired
	private NewsDAO newsDAO;
	
	@Override
	public int totalNews() {
		return newsDAO.totalNews();
	}

	@Override
	public List<NewsVO> selectNews(Criteria cri) {
		return newsDAO.selectNews(cri);
	}

	@Override
	public NewsVO detailNews(Integer news_code) {
		return newsDAO.detailNews(news_code);
	}

	@Override
	public void countNews(Integer news_code) {
		newsDAO.countNews(news_code);
	}

	@Override
	public List<NewsVO> selectNewsNotice() {
		return newsDAO.selectNewsNotice();
	}

}
