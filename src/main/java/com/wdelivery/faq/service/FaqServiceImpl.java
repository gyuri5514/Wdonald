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
	public List<FaqVO> faqSelect(Criteria cri) {
		List<FaqVO> vo = faqDAO.faqSelect(cri);
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
	public int totalFaq(Criteria cri) {
		return faqDAO.totalFaq(cri);
	}
	
	@Override
	public List<FaqVO> faqBoard(FaqVO faqVO) {
		return faqDAO.faqBoard(faqVO);
	}
	@Override
	public void insertFaq(FaqVO faqVO) {
		faqDAO.insertFaq(faqVO);
	}
	@Override
	public void updateFaq(FaqVO faqVO) {
		faqDAO.updateFaq(faqVO);
	}
	@Override
	public void deleteFaq(int faq_seq) {
		faqDAO.deleteFaq(faq_seq);
	}
	@Override
	public FaqVO faqDetail(FaqVO faqVO) {
		return faqDAO.faqDetail(faqVO);
	}
}