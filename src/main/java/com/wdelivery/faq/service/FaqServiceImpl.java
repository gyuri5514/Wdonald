package com.wdelivery.faq.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.faq.dao.FaqDAO;
import com.wdelivery.faq.vo.FaqVO;
import com.wdelivery.faq.utils.Criteria;

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
	public List<FaqVO> KeywordSelect(Map<String,String> map){
		List<FaqVO> vo2 = faqDAO.KeywordSelect(map);
		return vo2;
	}
	@Override
	public List<FaqVO> selectFaq(Criteria cri) {
		return faqDAO.selectFaq(cri);
	}
	@Override
	public int totalFaq(Criteria cri) {
		return faqDAO.totalFaq(cri);
	}
}