package com.wdelivery.happypromotion.service;

import java.util.List;

import com.wdelivery.happypromotion.vo.HappyPromotionVO;

public interface HappyPromotionService {

	public List<HappyPromotionVO> selectHappyPromotion();

	public List<HappyPromotionVO> selectHappyPromotionEnd();

	public HappyPromotionVO detailPromotion(Integer hp_code);

	public void countHappyPromotion(Integer hp_code);
}
