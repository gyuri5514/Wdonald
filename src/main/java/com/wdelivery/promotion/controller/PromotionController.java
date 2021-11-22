package com.wdelivery.promotion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wdelivery.happypromotion.service.HappyPromotionService;
import com.wdelivery.happypromotion.vo.HappyPromotionVO;
import com.wdelivery.promotion.service.PromotionService;
import com.wdelivery.promotion.vo.PromotionVO;

@Controller
public class PromotionController {

	@Autowired
	private PromotionService promotionService;
	
	@Autowired
	private HappyPromotionService happyPromotionService;

	@GetMapping("/promotion.do")
	public String selectPromotion(Model model) {
		List<PromotionVO> selectPromotion = promotionService.selectPromotion();
		model.addAttribute("selectPromotion", selectPromotion);

		List<PromotionVO> selectPromotionEnd = promotionService.selectPromotionEnd();
		model.addAttribute("selectPromotionEnd", selectPromotionEnd);

		return "promotion";
	}

	@GetMapping("/promotionDetail.do")
	public String detailPromotion(Model model, @RequestParam(value = "p_code", required = false) Integer p_code) {

		if (p_code != null) {
			PromotionVO promotionVO = promotionService.detailPromotion(p_code);
			
			promotionService.countPromotion(p_code);
			
			model.addAttribute("detailPromotion", promotionVO);

			return "promotionDetail";

		} else {
			return "promotion.do";
		}
	}
	
	@GetMapping("/happymealPromotion.do")
	public String selectHappyPromotion(Model model) {
		List<HappyPromotionVO> selectHappyPromotion = happyPromotionService.selectHappyPromotion();
		model.addAttribute(selectHappyPromotion);
		
		List<HappyPromotionVO> selectHappyPromotionEnd = happyPromotionService.selectHappyPromotionEnd();
		model.addAttribute(selectHappyPromotionEnd);

		return "happymealPromotion";
	}
	
	@GetMapping("/happyPromotionDetail.do")
	public String selectHappyPromotionDetail(Model model, @RequestParam(value = "hp_code", required = false) Integer hp_code) {
		
		if (hp_code != null) {
			HappyPromotionVO happyPromotionVO = happyPromotionService.detailPromotion(hp_code);
			happyPromotionService.countHappyPromotion(hp_code);
			
			model.addAttribute("detailPromotion", happyPromotionVO);
			
			return "happyPromotionDetail";
		} else {
			return "happymealPromotion.do";
		}
	}
	
	@GetMapping("/noResult.do")
	public String noResult(Model model) {
		return "noResult";
	}
	
}
