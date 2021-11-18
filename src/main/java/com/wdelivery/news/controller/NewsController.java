package com.wdelivery.news.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wdelivery.news.service.NewsService;
import com.wdelivery.news.utils.Criteria;
import com.wdelivery.news.utils.PageMaker;
import com.wdelivery.news.vo.NewsVO;

@Controller
public class NewsController {

	@Autowired
	NewsService newsService;
	
	@GetMapping("/news.do")
	public ModelAndView selectNews(Criteria cri) {
		
		ModelAndView mav = new ModelAndView("news");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(newsService.totalNews(cri));
		
		List<NewsVO> list = newsService.selectNews(cri);
		List<NewsVO> notice = newsService.selectNewsNotice();
		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("notice", notice);
		
		return mav;
	}
	
	@GetMapping("/newsDetail.do")
	public String detailNews(Model model, @RequestParam(value = "news_code", required = false) Integer news_code) {
		NewsVO newsVO = newsService.detailNews(news_code);
		
		newsService.countNews(news_code);
		
		model.addAttribute("detailNews", newsVO);
		
		return "newsDetail";
	}
}
