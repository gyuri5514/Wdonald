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
		
		List<HappyMealVO> selectHappyMealPM = happyMealService.selectHappyMealPM();
		
		model.addAttribute("selectHappyMealPM", selectHappyMealPM);
		
		return "happymeal_pm";
	}

	@GetMapping("/detail.do")
	public String detailMenu(Model model, @RequestParam(value = "b_code", required = false) Integer b_code,
			@RequestParam(value = "w_code", required = false) Integer w_code,
			@RequestParam(value = "dessert_code", required = false) Integer dessert_code,
			@RequestParam(value = "s_code", required = false) Integer s_code,
			@RequestParam(value = "d_code", required = false) Integer d_code,
			@RequestParam(value = "h_code", required = false) Integer h_code,
			@RequestParam(value = "va", required = false) String va) {

		if (b_code != null) {
			BurgerVO burgerVO = new BurgerVO();
			List<BurgerVO> selectBurger = burgerService.selectBurger();
			
			if(va == null) {
				burgerVO = burgerService.detailBurger(b_code);
				
				model.addAttribute("detailBurger", burgerVO);
				model.addAttribute("selectBurger_first", selectBurger.get(0).getB_code());
				model.addAttribute("selectBurger_end", selectBurger.get(selectBurger.size()-1).getB_code());
				return "detail";
			} else {
				for(int i = 0 ; i < selectBurger.size(); i++) {
					if(b_code.equals(selectBurger.get(i).getB_code())) {
						if(va.equals("left")) 
							burgerVO = burgerService.detailBurger(selectBurger.get(i-1).getB_code());
							
						 else if(va.equals("right")) 
							burgerVO = burgerService.detailBurger(selectBurger.get(i+1).getB_code());
							
						model.addAttribute("detailBurger", burgerVO);
						model.addAttribute("selectBurger_first", selectBurger.get(0).getB_code());
						model.addAttribute("selectBurger_end", selectBurger.get(selectBurger.size()-1).getB_code());
						
						return "detail";
					}
				}
			}
			model.addAttribute("message", "판매가 종료된 상품입니다.");
			return "detail";
		} else if (w_code != null) {
			WinMorningVO winMorningVO = new WinMorningVO();
			List<WinMorningVO> selectWinMorning = winMorningService.selectWinMorning();
			
			if(va == null) {
				winMorningVO = winMorningService.detailMorning(w_code);
				
				model.addAttribute("detailMorning", winMorningVO);
				model.addAttribute("selectWinMorning_first", selectWinMorning.get(0).getW_code());
				model.addAttribute("selectWinMorning_end", selectWinMorning.get(selectWinMorning.size()-1).getW_code());
				return "detail";
			} else {
				for(int i = 0 ; i < selectWinMorning.size(); i++) {
					if(w_code.equals(selectWinMorning.get(i).getW_code())) {
						if(va.equals("left")) 
							winMorningVO = winMorningService.detailMorning(selectWinMorning.get(i-1).getW_code());
							
						 else if(va.equals("right")) 
							 winMorningVO = winMorningService.detailMorning(selectWinMorning.get(i+1).getW_code());
							
						model.addAttribute("detailMorning", winMorningVO);
						model.addAttribute("selectWinMorning_first", selectWinMorning.get(0).getW_code());
						model.addAttribute("selectWinMorning_end", selectWinMorning.get(selectWinMorning.size()-1).getW_code());
						
						return "detail";
					}
				}
			}
			model.addAttribute("message", "판매가 종료된 상품입니다.");
			return "detail";
		} else if (dessert_code != null) {
			DessertVO dessertVO = new DessertVO();
			List<DessertVO> selectDessert = dessertService.selectDessert();
			
			if(va == null) {
				dessertVO = dessertService.detailDessert(dessert_code);
				
				model.addAttribute("detailDessert", dessertVO);
				model.addAttribute("selectDessert_first", selectDessert.get(0).getDessert_code());
				model.addAttribute("selectDessert_end", selectDessert.get(selectDessert.size()-1).getDessert_code());
				return "detail";
			} else {
				for(int i = 0 ; i < selectDessert.size(); i++) {
					if(dessert_code.equals(selectDessert.get(i).getDessert_code())) {
						if(va.equals("left")) 
							dessertVO = dessertService.detailDessert(selectDessert.get(i-1).getDessert_code());
							
						 else if(va.equals("right")) 
							 dessertVO = dessertService.detailDessert(selectDessert.get(i+1).getDessert_code());
							
						model.addAttribute("detailDessert", dessertVO);
						model.addAttribute("selectDessert_first", selectDessert.get(0).getDessert_code());
						model.addAttribute("selectDessert_end", selectDessert.get(selectDessert.size()-1).getDessert_code());
						
						return "detail";
					}
				}
			}
			model.addAttribute("message", "판매가 종료된 상품입니다.");
			return "detail";
		} else if (s_code != null) {
			SideVO sideVO = new SideVO();
			List<SideVO> selectSide = sideService.selectSide();
			
			if(va == null) {
				sideVO = sideService.detailSide(s_code);
				
				model.addAttribute("detailSide", sideVO);
				model.addAttribute("selectSide_first", selectSide.get(0).getS_code());
				model.addAttribute("selectSide_end", selectSide.get(selectSide.size()-1).getS_code());
				return "detail";
			} else {
				for(int i = 0 ; i < selectSide.size(); i++) {
					if(s_code.equals(selectSide.get(i).getS_code())) {
						if(va.equals("left")) 
							sideVO = sideService.detailSide(selectSide.get(i-1).getS_code());
							
						 else if(va.equals("right")) 
							 sideVO = sideService.detailSide(selectSide.get(i+1).getS_code());
							
						model.addAttribute("detailSide", sideVO);
						model.addAttribute("selectSide_first", selectSide.get(0).getS_code());
						model.addAttribute("selectSide_end", selectSide.get(selectSide.size()-1).getS_code());
						
						return "detail";
					}
				}
			}
			model.addAttribute("message", "판매가 종료된 상품입니다.");
			return "detail";
		} else if (d_code != null) {
			DrinkVO drinkVO = new DrinkVO();
			List<DrinkVO> selectDrink = drinkService.selectDrink();
			
			if(va == null) {
				drinkVO = drinkService.detailDrink(d_code);
				model.addAttribute("detailDrink", drinkVO);
				
				model.addAttribute("selectDrink_first", selectDrink.get(0).getD_code());
				model.addAttribute("selectDrink_end", selectDrink.get(selectDrink.size()-1).getD_code());
				return "detail";
			} else {
				for(int i = 0 ; i < selectDrink.size(); i++) {
					if(d_code.equals(selectDrink.get(i).getD_code())) {
						if(va.equals("left")) 
							drinkVO = drinkService.detailDrink(selectDrink.get(i-1).getD_code());
							
						 else if(va.equals("right")) 
							 drinkVO = drinkService.detailDrink(selectDrink.get(i+1).getD_code());
							
						model.addAttribute("detailDrink", drinkVO);
						
						model.addAttribute("selectDrink_first", selectDrink.get(0).getD_code());
						model.addAttribute("selectDrink_end", selectDrink.get(selectDrink.size()-1).getD_code());
						
						return "detail";
					}
				}
			}
			model.addAttribute("message", "판매가 종료된 상품입니다.");
			return "detail";
		} else if (h_code != null) {
			HappyMealVO happyMealVO = new HappyMealVO();
			List<HappyMealVO> selectHappyMeal = happyMealService.selectHappyMeal();
			
			if(va == null) {
				happyMealVO = happyMealService.detailHappyMeal(h_code);
				model.addAttribute("detailHappyMeal", happyMealVO);
				
				model.addAttribute("selectHappyMeal_first", selectHappyMeal.get(0).getH_code());
				model.addAttribute("selectHappyMeal_end", selectHappyMeal.get(selectHappyMeal.size()-1).getH_code());
				return "detail";
			} else {
				for(int i = 0 ; i < selectHappyMeal.size(); i++) {
					if(h_code.equals(selectHappyMeal.get(i).getH_code())) {
						if(va.equals("left")) 
							happyMealVO = happyMealService.detailHappyMeal(selectHappyMeal.get(i-1).getH_code());
							
						 else if(va.equals("right")) 
							 happyMealVO = happyMealService.detailHappyMeal(selectHappyMeal.get(i+1).getH_code());
							
						model.addAttribute("detailHappyMeal", happyMealVO);
						
						model.addAttribute("selectHappyMeal_first", selectHappyMeal.get(0).getH_code());
						model.addAttribute("selectHappyMeal_end", selectHappyMeal.get(selectHappyMeal.size()-1).getH_code());
						
						return "detail";
					}
				}
			}
			model.addAttribute("message", "판매가 종료된 상품입니다.");
			return "detail";
			
		} else {
			return "burger.do";
		}
	}
}
