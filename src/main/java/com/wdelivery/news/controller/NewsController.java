package com.wdelivery.news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wdelivery.news.service.NewsService;
import com.wdelivery.news.utils.Paging;

@Controller
public class NewsController {

	@Autowired
	NewsService newsService;

//	@GetMapping("/news.do")
//	public String selectNews(Model model) {
//		List<NewsVO> selectNews = newsService.selectNews();
//		model.addAttribute("selectNews", selectNews);
//		
//		return "news";
//	}

//	@GetMapping("/news.do")
//	public String selectNews(NewsPagingVO newsPagingVO, Model model,
//			@RequestParam(value = "nowPage", required = false) String nowPage,
//			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
//		int total = newsService.totalNews();
//		
//		if (nowPage == null && cntPerPage == null) {
//			nowPage = "1";
//			cntPerPage = "5";
//		} else if (nowPage == null) {
//			nowPage = "1";
//		} else if (cntPerPage == null) {
//			cntPerPage = "5";
//		}
//		
//		newsPagingVO = new NewsPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//		model.addAttribute("paging", newsPagingVO);
//		model.addAttribute("viewAAll", newsService.selectNewsPaging(newsPagingVO));
//		
//		return "news";
//	}

	@GetMapping("/news.do")
	public String getBoardList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		// 전체 게시글 개수
		int listCnt = newsService.totalNews();
		
		// Paging 객체 생성
		Paging paging = new Paging();
		paging.pageInfo(page,  range, listCnt);
		
		model.addAttribute("paging", paging);
		model.addAttribute("news", newsService.selectNews(paging));
		
		return "news";
	}

}
