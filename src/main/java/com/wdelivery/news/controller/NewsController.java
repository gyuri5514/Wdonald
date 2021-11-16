package com.wdelivery.news.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.wdelivery.news.service.NewsService;
import com.wdelivery.news.vo.NewsVO;

@Controller
public class NewsController {

	@Autowired
	NewsService newsService;
	
	@GetMapping("/news.do")
	public String selectNews(Model model) {
		List<NewsVO> selectNews = newsService.selectNews();
		model.addAttribute("selectNews", selectNews);
		
		return "news";
	}
	
}
