package com.wdelivery.faq.dao;

import java.util.List;

import com.wdelivery.faq.vo.FaqVO;

public interface FaqDAO {

	public List<FaqVO> faqSelect();
	
	public List<FaqVO> MenuSelect(String faq_name);
}