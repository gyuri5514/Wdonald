package com.wdelivery.promotion.dao;

import java.util.List;

import com.wdelivery.promotion.vo.PromotionVO;

public interface PromotionDAO {
	
	public List<PromotionVO> selectPromotion();
	
	public PromotionVO detailPromotion();

}
