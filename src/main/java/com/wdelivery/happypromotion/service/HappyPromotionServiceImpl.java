package com.wdelivery.happypromotion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.happypromotion.dao.HappyPromotionDAO;
import com.wdelivery.happypromotion.vo.HappyPromotionVO;

@Service
public class HappyPromotionServiceImpl implements HappyPromotionService {

	@Autowired
	private HappyPromotionDAO happyPromotionDAO;
	
	@Override
	public List<HappyPromotionVO> selectHappyPromotion() {
		return happyPromotionDAO.selectHappyPromotion();
	}

	@Override
	public List<HappyPromotionVO> selectHappyPromotionEnd() {
		return happyPromotionDAO.selectHappyPromotionEnd();
		
	}

	@Override
	public HappyPromotionVO detailPromotion(Integer hp_code) {
		return happyPromotionDAO.detailPromotion(hp_code);
	}

	@Override
	public void countHappyPromotion(Integer hp_code) {
		happyPromotionDAO.countHappyPromotion(hp_code);
	}

}
