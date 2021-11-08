package com.wdelivery.faq.service;

import java.util.List;

import com.wdelivery.faq.vo.FaqVO;

public interface FaqService {
	public List<FaqVO> faqSelect();
	
	public List<FaqVO> MenuSelect(String faq_name);
}
