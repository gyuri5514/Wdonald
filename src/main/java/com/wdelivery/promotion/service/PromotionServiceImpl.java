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
	public List<PromotionVO> selectPromotionAll() {
		return promotionDAO.selectPromotionAll();
	}
	
	@Override
	public List<PromotionVO> selectPromotionIng() {
		return promotionDAO.selectPromotionIng();
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

	@Override
	public PromotionVO promotionDetail(PromotionVO promotionVO) {
		return promotionDAO.promotionDetail(promotionVO);
	}

	@Override
	public List<PromotionVO> promotion(PromotionVO promotionVO) {
		return promotionDAO.promotion(promotionVO);
	}

	@Override
	public void insertPromotion(PromotionVO promotionVO) {
		promotionDAO.insertPromotion(promotionVO);
	}

	@Override
	public void updatePromotion(PromotionVO promotionVO) {
		promotionDAO.updatePromotion(promotionVO);
	}

	@Override
	public void deletePromotion(PromotionVO promotionVO) {
		promotionDAO.deletePromotion(promotionVO);
	}

}
