package com.wdelivery.promotion.dao;

import java.util.List;

import com.wdelivery.promotion.vo.PromotionVO;

public interface PromotionDAO {
	
	public List<PromotionVO> selectPromotion();
	
	public List<PromotionVO> selectPromotionEnd();
	
	public PromotionVO detailPromotion(Integer p_code);
	
	public void countPromotion(Integer p_code);

}
