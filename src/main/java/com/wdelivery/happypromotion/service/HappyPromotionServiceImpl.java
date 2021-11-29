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
	public HappyPromotionVO detailHappyPromotion(Integer hp_code) {
		return happyPromotionDAO.detailHappyPromotion(hp_code);
	}

	@Override
	public void countHappyPromotion(Integer hp_code) {
		happyPromotionDAO.countHappyPromotion(hp_code);
	}

	@Override
	public List<HappyPromotionVO> happyPromotion(HappyPromotionVO happyPromotionVO) {
		return happyPromotionDAO.happyPromotion(happyPromotionVO);
	}

	@Override
	public HappyPromotionVO happyPromotionDetail(HappyPromotionVO happyPromotionVO) {
		return happyPromotionDAO.happyPromotionDetail(happyPromotionVO);
	}

	@Override
	public void insertHappyPromotion(HappyPromotionVO happyPromotionVO) {
		happyPromotionDAO.insertHappyPromotion(happyPromotionVO);
	}

	@Override
	public void updateHappyPromotion(HappyPromotionVO happyPromotionVO) {
		happyPromotionDAO.updateHappyPromotion(happyPromotionVO);
	}

	@Override
	public void deleteHappyPromotion(HappyPromotionVO happyPromotionVO) {
		happyPromotionDAO.deleteHappyPromotion(happyPromotionVO);
	}

}
