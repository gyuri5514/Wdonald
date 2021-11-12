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
		System.out.println("selectPromotion Impl");
		return promotionDAO.selectPromotion();
	}

	@Override
	public PromotionVO detailPromotion(Integer p_code) {
		System.out.println("detailPromotion Impl");
		return promotionDAO.detailPromotion(p_code);
	}

	@Override
	public List<PromotionVO> selectPromotionEnd() {
		System.out.println("selectPromotionEnd");
		return promotionDAO.selectPromotionEnd();
	}

}
