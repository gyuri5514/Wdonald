package com.wdelivery.faq.dao;

import java.util.List;
import java.util.Map;

import com.wdelivery.faq.vo.FaqVO;
import com.wdelivery.faq.utils.Criteria;

public interface FaqDAO {

	public List<FaqVO> faqSelect(Criteria cri);
	
	public List<FaqVO> MenuSelect(String faq_name);
	
	public List<FaqVO> KeywordSelect(Map<String, String> map);
	
	public int totalFaq(Criteria cri);
}