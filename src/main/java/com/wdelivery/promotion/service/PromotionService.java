package com.wdelivery.promotion.service;

import java.util.List;

import com.wdelivery.promotion.vo.PromotionVO;

public interface PromotionService {

	public List<PromotionVO> selectPromotionAll();
	
	public List<PromotionVO> selectPromotionIng();
	
	public List<PromotionVO> selectPromotionEnd();

	public PromotionVO detailPromotion(Integer p_code);
	
	public void countPromotion(Integer p_code);
}
