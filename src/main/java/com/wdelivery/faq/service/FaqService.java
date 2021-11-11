package com.wdelivery.faq.service;

import java.util.List;
import java.util.Map;


import com.wdelivery.faq.vo.FaqVO;

public interface FaqService {
	public List<FaqVO> faqSelect();
	
	public List<FaqVO> MenuSelect(String faq_name);
	
	public List<FaqVO> KeywordSelect(Map<String,String> map);
}
