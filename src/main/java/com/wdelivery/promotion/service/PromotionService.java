package com.wdelivery.promotion.service;

import java.util.List;

import com.wdelivery.promotion.vo.PromotionVO;

public interface PromotionService {

	public List<PromotionVO> selectPromotion();
	
	public List<PromotionVO> selectPromotionEnd();

	public PromotionVO detailPromotion(Integer p_code);
}
