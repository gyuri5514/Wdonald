package com.wdelivery.promotion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.wdelivery.promotion.service.PromotionService;
import com.wdelivery.promotion.vo.PromotionVO;

public class PromotionController {
	
	@Autowired
	private PromotionService promotionService;
	
	@GetMapping("/promotion.do")
	public String selectPromotion(Model model) {
		List<PromotionVO> selectPromotion = promotionService.selectPromotion();
		model.addAttribute("selectPromotion", selectPromotion);

		System.out.println("selectPromotion");

		return "promotion";
	}

}
