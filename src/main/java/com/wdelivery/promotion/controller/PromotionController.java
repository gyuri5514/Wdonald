package com.wdelivery.promotion.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wdelivery.menu.burger.vo.BurgerVO;
import com.wdelivery.menu.dessert.vo.DessertVO;
import com.wdelivery.menu.drink.vo.DrinkVO;
import com.wdelivery.menu.happymeal.vo.HappyMealVO;
import com.wdelivery.menu.side.vo.SideVO;
import com.wdelivery.menu.winMorning.vo.WinMorningVO;
import com.wdelivery.promotion.service.PromotionService;
import com.wdelivery.promotion.vo.PromotionVO;

@Controller
public class PromotionController {

	@Autowired
	private PromotionService promotionService;

	@GetMapping("/promotion.do")
	public String selectPromotion(Model model) {
		List<PromotionVO> selectPromotion = promotionService.selectPromotion();
		model.addAttribute("selectPromotion", selectPromotion);

		List<PromotionVO> selectPromotionEnd = promotionService.selectPromotionEnd();
		model.addAttribute("selectPromotionEnd", selectPromotionEnd);

		System.out.println("selectPromotion");
		System.out.println("selectPromotionEnd");

		return "promotion";
	}

	@GetMapping("/promotionDetail.do")
	public String detailPromotion(Model model, @RequestParam(value = "p_code", required = false) Integer p_code) {

		if (p_code != null) {
			PromotionVO promotionVO = promotionService.detailPromotion(p_code);
			System.out.println("detailPromotion : " + promotionVO.getP_code());
			System.out.println("detailPromotion : " + promotionVO.getP_name());
			System.out.println("detailPromotion : " + promotionVO.getP_img_path());
			System.out.println("detailPromotion : " + promotionVO.getP_detail_img_path());

			model.addAttribute("detailPromotion", promotionVO);

			return "promotionDetail";

		} else {
			return "promotion.do";
		}
	}

}
