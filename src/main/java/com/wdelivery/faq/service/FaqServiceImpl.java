package com.wdelivery.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.faq.dao.FaqDAO;
import com.wdelivery.faq.vo.FaqVO;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqDAO faqDAO;

	@Override
	public List<FaqVO> faqSelect() {
		List<FaqVO> vo = faqDAO.faqSelect();
		return vo;
	}
	@Override
	public List<FaqVO> MenuSelect(String faq_name){
		List<FaqVO> vo1 = faqDAO.MenuSelect(faq_name);
		return vo1;
	}
	@Override
	public List<FaqVO> KeywordSelect(String menuSelect, String keyword){
		List<FaqVO> vo2 = faqDAO.KeywordSelect(menuSelect, keyword);
		return vo2;
	}
}