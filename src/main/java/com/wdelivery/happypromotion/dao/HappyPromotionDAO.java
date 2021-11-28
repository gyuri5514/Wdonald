package com.wdelivery.happypromotion.dao;

import java.util.List;

import com.wdelivery.happypromotion.vo.HappyPromotionVO;

public interface HappyPromotionDAO {
	
	public List<HappyPromotionVO> selectHappyPromotion();
	
	public List<HappyPromotionVO> selectHappyPromotionEnd();
	
	public HappyPromotionVO detailHappyPromotion(Integer hp_code);
	
	public void countHappyPromotion(Integer hp_code);
	
	public List<HappyPromotionVO> happyPromotion(HappyPromotionVO happyPromotionVO);
	
	public HappyPromotionVO happyPromotionDetail(HappyPromotionVO happyPromotionVO);
	
	public void insertHappyPromotion(HappyPromotionVO happyPromotionVO);
	
	public void updateHappyPromotion(HappyPromotionVO happyPromotionVO);
	
	public void deleteHappyPromotion(int hp_code);
}
