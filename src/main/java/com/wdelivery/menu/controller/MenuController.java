package com.wdelivery.menu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wdelivery.menu.burger.service.BurgerService;
import com.wdelivery.menu.burger.vo.BurgerVO;
import com.wdelivery.menu.dessert.service.DessertService;
import com.wdelivery.menu.dessert.vo.DessertVO;
import com.wdelivery.menu.drink.service.DrinkService;
import com.wdelivery.menu.drink.vo.DrinkVO;
import com.wdelivery.menu.happymeal.service.HappyMealService;
import com.wdelivery.menu.happymeal.vo.HappyMealVO;
import com.wdelivery.menu.side.service.SideService;
import com.wdelivery.menu.side.vo.SideVO;
import com.wdelivery.menu.winMorning.service.WinMorningService;
import com.wdelivery.menu.winMorning.vo.WinMorningVO;
import com.wdelivery.news.utils.Criteria;
import com.wdelivery.news.utils.PageMaker;

@Controller
public class MenuController {

	@Autowired
	public BurgerService burgerService;

	@Autowired
	public DrinkService drinkService;

	@Autowired
	public SideService sideService;

	@Autowired
	public WinMorningService winMorningService;

	@Autowired
	public DessertService dessertService;

	@Autowired
	public HappyMealService happyMealService;

	@GetMapping("/burger.do")
	public String selectBurger(Model model, Criteria cri) {
		List<BurgerVO> selectBurger = burgerService.selectBurger();
		
		model.addAttribute("selectBurger", selectBurger);

		return "burger";
	}

	@GetMapping("/drink.do")
	public String selectDrink(Model model) {
		List<DrinkVO> selectDrink = drinkService.selectDrink();
		model.addAttribute("selectDrink", selectDrink);

		return "drink";
	}

	@GetMapping("/side.do")
	public String selectSide(Model model) {
		List<SideVO> selectSide = sideService.selectSide();
		model.addAttribute("selectSide", selectSide);

		return "side";
	}

	@GetMapping("/morning.do")
	public String selectWinMorning(Model model) {
		List<WinMorningVO> selectWinMorning = winMorningService.selectWinMorning();
		model.addAttribute("selectWinMorning", selectWinMorning);

		return "morning";
	}

	@GetMapping("/dessert.do")
	public String selectDessert(Model model) {
		List<DessertVO> selectDessert = dessertService.selectDessert();
		model.addAttribute("selectDessert", selectDessert);

		return "dessert";
	}

	@GetMapping("/happymeal.do")
	public String selectHappyMeal(Model model) {

		List<HappyMealVO> selectHappyMeal = happyMealService.selectHappyMeal();
		model.addAttribute("selectHappyMeal", selectHappyMeal);

		return "happymeal";
	}

	@GetMapping("/happymeal_pm.do")
	public String selectHappyMealPM(Model model) {
		
		List<HappyMealVO> selectHappyMeal = happyMealService.selectHappyMeal();
		model.addAttribute("selectHappyMeal", selectHappyMeal);
		
		return "happymeal_pm";
	}

	@GetMapping("/detail.do")
	public String detailMenu(Model model, @RequestParam(value = "b_code", required = false) Integer b_code,
			@RequestParam(value = "w_code", required = false) Integer w_code,
			@RequestParam(value = "dessert_code", required = false) Integer dessert_code,
			@RequestParam(value = "s_code", required = false) Integer s_code,
			@RequestParam(value = "d_code", required = false) Integer d_code,
			@RequestParam(value = "h_code", required = false) Integer h_code) {

		if (b_code != null) {
			BurgerVO burgerVO = burgerService.detailBurger(b_code);
			model.addAttribute("detailBurger", burgerVO);

			return "detail";

		} else if (w_code != null) {
			WinMorningVO winMorningVO = winMorningService.detailMorning(w_code);
			model.addAttribute("detailMorning", winMorningVO);

			return "detail";
		} else if (dessert_code != null) {
			DessertVO dessertVO = dessertService.detailDessert(d_code);
			model.addAttribute("detailDessert", dessertVO);

			return "detail";
		} else if (s_code != null) {
			SideVO sideVO = sideService.detailSide(s_code);
			model.addAttribute("detailSide", sideVO);

			return "detail";

		} else if (d_code != null) {
			DrinkVO drinkVO = drinkService.detailDrink(d_code);
			model.addAttribute("detailDrink", drinkVO);

			return "detail";
		} else if (h_code != null) {
			HappyMealVO happyMealVO = happyMealService.detailHappyMeal(h_code);
			model.addAttribute("detailHappyMeal", happyMealVO);

			return "detail";
		} else {
			return "burger.do";
		}
	}
}
