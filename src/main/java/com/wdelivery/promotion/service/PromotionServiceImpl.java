package com.wdelivery.promotion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.promotion.dao.PromotionDAO;
import com.wdelivery.promotion.vo.PromotionVO;

@Service
public class PromotionServiceImpl implements PromotionService {

	@Autowired
	private PromotionDAO promotionDAO;
	
	@Override
	public List<PromotionVO> selectPromotion() {
		return promotionDAO.selectPromotion();
	}

	@Override
	public PromotionVO detailPromotion(Integer p_code) {
		return promotionDAO.detailPromotion(p_code);
	}

	@Override
	public List<PromotionVO> selectPromotionEnd() {
		return promotionDAO.selectPromotionEnd();
	}

	@Override
	public void countPromotion(Integer p_code) {
		promotionDAO.countPromotion(p_code);
		
	}

}
