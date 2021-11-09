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
import com.wdelivery.menu.side.service.SideService;
import com.wdelivery.menu.side.vo.SideVO;
import com.wdelivery.menu.winMorning.service.WinMorningService;
import com.wdelivery.menu.winMorning.vo.WinMorningVO;

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
	
	@GetMapping("/burger.do")
	public String selectBurger(Model model) {
		List<BurgerVO> selectBurger = burgerService.selectBurger();
		model.addAttribute("selectBurger", selectBurger);
		
		System.out.println("selectBurger");
		
		return "burger";
	}
	
	@GetMapping("/drink.do")
	public String selectDrink(Model model) {
		List<DrinkVO> selectDrink = drinkService.selectDrink();
		model.addAttribute("selectDrink", selectDrink);
		
		System.out.println("selectDrink");
		
		return "drink";
	}
	
	@GetMapping("/side.do")
	public String selectSide(Model model) {
		List<SideVO> selectSide = sideService.selectSide();
		model.addAttribute("selectSide", selectSide);
		
		System.out.println("selectSide");
		
		return "side";
	}
	
	@GetMapping("/morning.do")
	public String selectWinMorning(Model model) {
		List<WinMorningVO> selectWinMorning = winMorningService.selectWinMorning();
		model.addAttribute("selectWinMorning", selectWinMorning);
		
		System.out.println("selectWinMorning");
		
		return "morning";
	}
	
	@GetMapping("/dessert.do")
	public String selectDessert(Model model) {
		List<DessertVO> selectDessert = dessertService.selectDessert();
		model.addAttribute("selectDessert", selectDessert);
		
		System.out.println("selectDessert");
		
		return "dessert";
	}
	
	@GetMapping("/detail.do")
	public String detailBurger(Model model, @RequestParam(value = "b_code", required = false) Integer b_code,
			@RequestParam(value = "w_code", required = false) Integer w_code,
			@RequestParam(value = "dessert_code", required = false) Integer dessert_code,
			@RequestParam(value = "s_code", required = false) Integer s_code,
			@RequestParam(value = "d_code", required = false) Integer d_code) {
		
		if (b_code != null) {
			BurgerVO burgerVO = burgerService.detailBurger(b_code);
			System.out.println("detailBurger : " + burgerVO.getB_code());
			System.out.println("detailBurger : " + burgerVO.getB_name());
			System.out.println("detailBurger : " + burgerVO.getB_img_path());
			System.out.println("detailBurger : " + burgerVO.getB_n_img_path());	
			
			model.addAttribute("detailBurger", burgerVO);
			
			return "detail";
		} else if (w_code != null) {
			WinMorningVO winMorningVO = winMorningService.detailMorning(w_code);
			System.out.println("detailMorning : " + winMorningVO.getW_code());
			System.out.println("detailMorning : " + winMorningVO.getW_name());
			System.out.println("detailMorning : " + winMorningVO.getW_img_path());
			System.out.println("detailMorning : " + winMorningVO.getW_n_img_path());	
			model.addAttribute("detailMorning", winMorningVO);
			
			return "detail";
		} else if (dessert_code != null) {
			DessertVO dessertVO = dessertService.detailDessert(d_code);
			System.out.println("detailDessert : " + dessertVO.getDessert_code());
			System.out.println("detailDessert : " + dessertVO.getDessert_name());
			System.out.println("detailDessert : " + dessertVO.getDessert_img_path());
			
			model.addAttribute("detailDessert", dessertVO);
			
			return "detail";
		} else if (s_code != null) {
			SideVO sideVO = sideService.detailSide(s_code);
			System.out.println("detailDessert : " + sideVO.getS_code());
			System.out.println("detailDessert : " + sideVO.getS_name());
			System.out.println("detailDessert : " + sideVO.getS_img_path());

			return "detail";

		} else if (d_code != null) {
			DrinkVO drinkVO = drinkService.detailDrink(d_code);
			System.out.println("detailDrink : " + drinkVO.getD_code());
			System.out.println("detailDrink : " + drinkVO.getD_name());
			System.out.println("detailDrink : " + drinkVO.getD_img_path());
			
			return "detail";
		} else {
			return "burger.do";
		}
		
	}
}
