package com.wdelivery.member.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wdelivery.admin.service.AdminStoreService;
import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.faq.service.FaqService;
import com.wdelivery.faq.vo.FaqVO;
import com.wdelivery.member.service.MemberService;
import com.wdelivery.member.util.OrderTimer;
import com.wdelivery.member.util.TypeSafety;
import com.wdelivery.member.vo.UserAddressVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.menu.burger.service.BurgerService;
import com.wdelivery.menu.burger.vo.BurgerVO;
import com.wdelivery.menu.burgerLgSet.service.BurgerLgSetService;
import com.wdelivery.menu.burgerLgSet.vo.BurgerLgSetVO;
import com.wdelivery.menu.burgerSet.service.BurgerSetService;
import com.wdelivery.menu.burgerSet.vo.BurgerSetVO;
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
import com.wdelivery.menu.winMorningSet.service.WinMorningSetService;
import com.wdelivery.menu.winMorningSet.vo.WinMorningSetVO;
import com.wdelivery.qna.service.QnaService;
import com.wdelivery.qna.vo.QnaVO;

import net.sf.json.JSONArray;

@Controller
public class MemberController {

	/*
	 * @Autowired private BCryptPasswordEncoder pwdEncoder;
	 */
	@Autowired
	private QnaService qnaService;

	@Autowired
	private FaqService faqService;

	@Autowired
	private BurgerService burgerService;
	@Autowired
	private BurgerSetService burgerSetService;
	@Autowired
	private BurgerLgSetService burgerLgSetService;
	@Autowired
	private WinMorningService winMorningService;
	@Autowired
	private WinMorningSetService winMorningSetService;
	@Autowired
	private DessertService dessertService;
	@Autowired
	private SideService sideService;
	@Autowired
	private DrinkService drinkService;
	@Autowired
	private HappyMealService happyMealService;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private AdminStoreService adminStoreService;
	
	@GetMapping("/main.do")
	public String main() {
		return "main";
	}

	@GetMapping("/order.do")
	public String orderPage(Model model, @RequestParam(value = "b_code", required = false) String b_code,
			@RequestParam(value = "s_code", required = false) String s_code,
			@RequestParam(value = "d_code", required = false) String d_code,
			@RequestParam(value = "w_code", required = false) String w_code,
			@RequestParam(value = "h_code", required = false) String h_code,
			@RequestParam(value = "dessert_code", required = false) String dessert_code,
			@RequestParam(value = "va", required = false) String va,
			@RequestParam(value = "num", required = false) String num,
			HttpSession session) {
		
		
		if(va != null) {
			if(va.equals("변경")) {
				List<CartVO> cartList = TypeSafety.sessionCartCaster(session.getAttribute("cartList"));
				System.out.println("b_code : " + b_code);
				System.out.println("s_code : " + s_code);
				System.out.println("d_code : " + d_code);
				System.out.println("num : " + num);
				for(int i = 0; i < cartList.size(); i ++) {
					System.out.println("vo : " + cartList.get(i).getCart_b_name());
				}
				cartList.remove(Integer.parseInt(num));
				session.setAttribute("cartList", cartList);
				System.out.println("size : " + cartList.size());
			}
		}
		if (b_code != null) {
			BurgerLgSetVO burgerLgSetVO = burgerLgSetService.detailBurgerLgSet(Integer.parseInt(b_code)+400);
			BurgerSetVO burgerSetVO = burgerSetService.detailBurgerSet(Integer.parseInt(b_code)+100);
			BurgerVO burgerVO = burgerService.detailBurger(Integer.parseInt(b_code));
			//return true = winmoring available / return false = winmorning not on sale
			if(OrderTimer.isMenuOrderTime()) {
				model.addAttribute("menuAvailable","n");
				return "burger";
			}
			model.addAttribute("burgerLgSetVO", burgerLgSetVO);
			model.addAttribute("burgerSetVO", burgerSetVO);
			model.addAttribute("burgerVO", burgerVO);

		} else if (s_code != null) {
			SideVO sideVO = sideService.detailSide(Integer.parseInt(s_code));
			
			model.addAttribute("sideVO", sideVO);

		} else if (d_code != null) {
			DrinkVO drinkVO = drinkService.detailDrink(Integer.parseInt(d_code));
			
			model.addAttribute("drinkVO", drinkVO);

		} else if (w_code != null) {
			//return true = winmoring available / return false = winmorning not on sale
			if(!OrderTimer.isMenuOrderTime()) {
				model.addAttribute("menuAvailable","n");
				return "morning";
			}
			WinMorningVO winMorningVO = winMorningService.detailMorning(Integer.parseInt(w_code));
			WinMorningSetVO winMorningSetVO = winMorningSetService.detailMorningSet(Integer.parseInt(w_code)+200);
			
			model.addAttribute("winMorningVO", winMorningVO);
			model.addAttribute("winMorningSetVO",winMorningSetVO);
			
		} else if (dessert_code != null) {
			DessertVO dessertVO = dessertService.detailDessert(Integer.parseInt(dessert_code));
			
			model.addAttribute("dessertVO", dessertVO);
			
		} else if(h_code != null) {
			HappyMealVO happyMealVO = happyMealService.detailHappyMeal(Integer.parseInt(h_code));
			
			model.addAttribute("happyMealVO", happyMealVO);
			
		}
			
		List<DrinkVO> drinkList = drinkService.selectDrink();
		model.addAttribute("drinkList", JSONArray.fromObject(drinkList));
		return "order";
	}

	@GetMapping("/orderConfirm.do")
	public String cart(Model model, @RequestParam(value = "burger", required = false) String b_code,
			@RequestParam(value = "va", required = false) String va,
			@RequestParam(value = "side", required = false) String side,
			@RequestParam(value = "drink", required = false) String drink,
			@RequestParam(value = "s_code", required = false) String s_code,
			@RequestParam(value = "d_code", required = false) String d_code,
			@RequestParam(value = "w_code", required = false) String w_code,
			@RequestParam(value = "dessert_code", required = false) String dessert_code,
			@RequestParam(value = "s_name", required = false) String s_name,
			@RequestParam(value = "d_name", required = false) String d_name,
			@RequestParam(value = "num", required = false) String num,
			@RequestParam(value = "quantity", required = false) String quantity, 
			@RequestParam(value = "price", required = false) String total_price, 
			@RequestParam(value = "delivery_price", required = false) String deliveryPrice, HttpSession session) {
		
		List<CartVO> cartList = TypeSafety.sessionCartCaster(session.getAttribute("cartList"));
		
		if(va == null) {
			int price = 0;
			int delivery_price = 0;
			if(cartList != null) {
				if(session.getAttribute("total_price") != null) 
					price = (int) session.getAttribute("total_price");
				if(session.getAttribute("delivery_price") != null) 
					delivery_price = (int) session.getAttribute("delivery_price");
			}
			model.addAttribute("cartList", cartList);
			model.addAttribute("price", price);
			model.addAttribute("delivery_price", delivery_price);
			
			return "orderConfirm";
			
		} else {
			if (va.equals("새로고침")) {
				System.out.println("새로고침");
				model.addAttribute("cartList", cartList);
				model.addAttribute("price", total_price);
				model.addAttribute("delivery_price", deliveryPrice);
				return "orderConfirm";
			}
			
			if (va.equals("삭제")) {
				cartList.remove(Integer.parseInt(num));
	
			} else if (va.equals("라지세트")) {
				BurgerVO burgerVO = burgerService.detailBurger(Integer.parseInt(b_code));
				BurgerLgSetVO burgerLgSetVO = burgerLgSetService.detailBurgerLgSet(Integer.parseInt(b_code) + 400);
				
				CartVO cartVO = new CartVO();
				cartVO.setCart_b_Lgset_code(burgerLgSetVO.getB_lgset_code());
				cartVO.setCart_b_Lgset_img_path(burgerLgSetVO.getB_lgset_img_path());
				cartVO.setCart_b_Lgset_name(burgerLgSetVO.getB_lgset_name());
				
				if(Integer.parseInt(d_code) != 323 && Integer.parseInt(d_code) != 324 && Integer.parseInt(d_code) != 325 &&
						Integer.parseInt(d_code) != 326 && Integer.parseInt(d_code) != 327) 
					cartVO.setCart_b_Lgset_price((burgerLgSetVO.getB_lgset_price() * Integer.parseInt(quantity)) + 1000);
				else
					cartVO.setCart_b_Lgset_price(burgerLgSetVO.getB_lgset_price() * Integer.parseInt(quantity));
				
				cartVO.setCart_b_code(burgerVO.getB_code());
				cartVO.setCart_b_name(burgerVO.getB_name());
				cartVO.setCart_s_code(Integer.parseInt(s_code));
				cartVO.setCart_s_name(side);
				cartVO.setCart_d_code(Integer.parseInt(d_code));
				cartVO.setCart_d_name(drink);
				cartVO.setCart_quantity(Integer.parseInt(quantity));
				
				cartVO.setCart_product_code(burgerLgSetVO.getB_lgset_code());
				cartVO.setCart_product_name(burgerLgSetVO.getB_lgset_name());
				cartVO.setCart_product_img_path(burgerLgSetVO.getB_lgset_img_path());
				cartVO.setCart_product_price(burgerLgSetVO.getB_lgset_price());
				cartVO.setCart_product_quantity(Integer.parseInt(quantity));
				cartVO.setCart_product_side_name(side);
				cartVO.setCart_product_drink_name(drink);
				
				cartList.add(cartVO);
				
			} else if (va.equals("세트")) {
				CartVO cartVO = new CartVO();
				
				if(b_code != null) {
					BurgerVO burgerVO = burgerService.detailBurger(Integer.parseInt(b_code));
					BurgerSetVO burgerSetVO = burgerSetService.detailBurgerSet(Integer.parseInt(b_code) + 100);
					
					cartVO.setCart_b_set_code(burgerSetVO.getB_set_code());
					cartVO.setCart_b_set_img_path(burgerSetVO.getB_set_img_path());
					cartVO.setCart_b_set_name(burgerSetVO.getB_set_name());
					if(Integer.parseInt(d_code) != 323 && Integer.parseInt(d_code) != 324 && Integer.parseInt(d_code) != 325 &&
							Integer.parseInt(d_code) != 326 && Integer.parseInt(d_code) != 327) 
						cartVO.setCart_b_set_price(burgerSetVO.getB_set_price() * Integer.parseInt(quantity) + + 1000);
					else
						cartVO.setCart_b_set_price(burgerSetVO.getB_set_price() * Integer.parseInt(quantity));
					
					cartVO.setCart_b_code(burgerVO.getB_code());
					cartVO.setCart_b_name(burgerVO.getB_name());
					cartVO.setCart_s_code(Integer.parseInt(s_code));
					cartVO.setCart_s_name(side);
					cartVO.setCart_d_code(Integer.parseInt(d_code));
					cartVO.setCart_d_name(drink);
					cartVO.setCart_quantity(Integer.parseInt(quantity));
					
					cartVO.setCart_product_code(burgerSetVO.getB_set_code());
					cartVO.setCart_product_name(burgerSetVO.getB_set_name());
					cartVO.setCart_product_img_path(burgerSetVO.getB_set_img_path());
					cartVO.setCart_product_price(burgerSetVO.getB_set_price());
					cartVO.setCart_product_quantity(Integer.parseInt(quantity));
					cartVO.setCart_product_side_name(side);
					cartVO.setCart_product_drink_name(drink);
					
				} else if(w_code != null) {
					WinMorningVO winMorningVO = winMorningService.detailMorning(Integer.parseInt(w_code));
					WinMorningSetVO winMorningSetVO = winMorningSetService.detailMorningSet(Integer.parseInt(w_code)+ 200);
					
					cartVO.setCart_w_set_code(winMorningSetVO.getW_set_code());
					cartVO.setCart_w_set_img_path(winMorningSetVO.getW_set_img_path());
					cartVO.setCart_w_set_name(winMorningSetVO.getW_set_name());
					cartVO.setCart_w_set_price(winMorningSetVO.getW_set_price() * Integer.parseInt(quantity));
					cartVO.setCart_w_name(winMorningVO.getW_name());
					cartVO.setCart_w_code(winMorningVO.getW_code());
					cartVO.setCart_s_code(Integer.parseInt(s_code));
					cartVO.setCart_s_name(side);
					cartVO.setCart_d_code(Integer.parseInt(d_code));
					cartVO.setCart_d_name(drink);
					cartVO.setCart_quantity(Integer.parseInt(quantity));
					
					cartVO.setCart_product_code(winMorningSetVO.getW_set_code());
					cartVO.setCart_product_name(winMorningSetVO.getW_set_name());
					cartVO.setCart_product_img_path(winMorningSetVO.getW_set_img_path());
					cartVO.setCart_product_price(winMorningSetVO.getW_set_price());
					cartVO.setCart_product_quantity(Integer.parseInt(quantity));
					cartVO.setCart_product_side_name(side);
					cartVO.setCart_product_drink_name(drink);
				}
				
				cartList.add(cartVO);
				
			} else if (va.equals("단품")) {
				CartVO cartVO = new CartVO();
				if(b_code != null) {
					BurgerVO burgerVO = burgerService.detailBurger(Integer.parseInt(b_code));
		
					cartVO.setCart_b_code(burgerVO.getB_code());
					cartVO.setCart_b_img_path(burgerVO.getB_img_path());
					cartVO.setCart_b_name(burgerVO.getB_name());
					cartVO.setCart_b_price(burgerVO.getB_price() * Integer.parseInt(quantity));
					cartVO.setCart_quantity(Integer.parseInt(quantity));
					
					cartVO.setCart_product_code(burgerVO.getB_code());
					cartVO.setCart_product_name(burgerVO.getB_name());
					cartVO.setCart_product_img_path(burgerVO.getB_img_path());
					cartVO.setCart_product_price(burgerVO.getB_price());
					cartVO.setCart_product_quantity(Integer.parseInt(quantity));
		
				} else if(w_code != null) {
					WinMorningVO winMorningVO = winMorningService.detailMorning(Integer.parseInt(w_code));
					
					cartVO.setCart_w_code(winMorningVO.getW_code());
					cartVO.setCart_w_img_path(winMorningVO.getW_img_path());
					cartVO.setCart_w_name(winMorningVO.getW_name());
					cartVO.setCart_w_price(winMorningVO.getW_price() * Integer.parseInt(quantity));
					cartVO.setCart_quantity(Integer.parseInt(quantity));
					
					cartVO.setCart_product_code(winMorningVO.getW_code());
					cartVO.setCart_product_name(winMorningVO.getW_name());
					cartVO.setCart_product_img_path(winMorningVO.getW_img_path());
					cartVO.setCart_product_price(winMorningVO.getW_price());
					cartVO.setCart_product_quantity(Integer.parseInt(quantity));
				}
				
				cartList.add(cartVO);
				
			} else if (va.equals("사이드")) {
				int side_price = 0;
				
				if(Integer.parseInt(s_code) == 704 || Integer.parseInt(s_code) == 705 || Integer.parseInt(s_code) == 706) {
					if (s_name.indexOf("미디움") > 0)
						side_price = 700;
					else if (s_name.indexOf("라지") > 0)
						side_price = 1000;
				}
	
				SideVO sideVO = sideService.detailSide(Integer.parseInt(s_code));
	
				CartVO cartVO = new CartVO();
				cartVO.setCart_s_code(sideVO.getS_code());
				cartVO.setCart_s_img_path(sideVO.getS_img_path());
				cartVO.setCart_s_name(sideVO.getS_name());
				cartVO.setCart_s_price((sideVO.getS_price() + side_price) * Integer.parseInt(quantity));
				cartVO.setCart_quantity(Integer.parseInt(quantity));
			
				cartVO.setCart_product_code(sideVO.getS_code());
				cartVO.setCart_product_name(sideVO.getS_name());
				cartVO.setCart_product_img_path(sideVO.getS_img_path());
				cartVO.setCart_product_price((sideVO.getS_price() + side_price));
				cartVO.setCart_product_quantity(Integer.parseInt(quantity));
				
				cartList.add(cartVO);
				
			} else if (va.equals("음료")) {
				int drink_price = 0;
				
				if(Integer.parseInt(d_code) == 323 || Integer.parseInt(d_code) == 324 || Integer.parseInt(d_code) == 325 ||
						Integer.parseInt(d_code) == 326 || Integer.parseInt(d_code) == 327) {
					if (d_name.indexOf("미디움") > 0)
						drink_price = 500;
					else if (d_name.indexOf("라지") > 0)
						drink_price = 1000;
				}
				DrinkVO drinkVO = drinkService.detailDrink(Integer.parseInt(d_code));
	
				CartVO cartVO = new CartVO();
				cartVO.setCart_d_code(drinkVO.getD_code());
				cartVO.setCart_d_img_path(drinkVO.getD_img_path());
				cartVO.setCart_d_name(d_name);
				cartVO.setCart_d_price((drinkVO.getD_price() + drink_price) * Integer.parseInt(quantity));
				cartVO.setCart_quantity(Integer.parseInt(quantity));
				
				
				cartVO.setCart_product_code(drinkVO.getD_code());
				cartVO.setCart_product_name(d_name);
				cartVO.setCart_product_img_path(drinkVO.getD_img_path());
				cartVO.setCart_product_price((drinkVO.getD_price() + drink_price));
				cartVO.setCart_product_quantity(Integer.parseInt(quantity));
				
				cartList.add(cartVO);
				
			}  else if (va.equals("디저트")) {
				int side_price = 0;
	
				if (s_name.indexOf("미디움") > 0)
					side_price = 500;
				else if (s_name.indexOf("라지") > 0)
					side_price = 1000;
				DessertVO dessertVO = dessertService.detailDessert(Integer.parseInt(dessert_code));
	
				CartVO cartVO = new CartVO();
				cartVO.setCart_dessert_code(dessertVO.getDessert_code());
				cartVO.setCart_dessert_img_path(dessertVO.getDessert_img_path());
				cartVO.setCart_dessert_name(dessertVO.getDessert_name());
				cartVO.setCart_dessert_price((dessertVO.getDessert_price() + side_price) * Integer.parseInt(quantity));
				cartVO.setCart_quantity(Integer.parseInt(quantity));
	
				cartVO.setCart_product_code(dessertVO.getDessert_code());
				cartVO.setCart_product_name(dessertVO.getDessert_name());
				cartVO.setCart_product_img_path(dessertVO.getDessert_img_path());
				cartVO.setCart_product_price((dessertVO.getDessert_price() + side_price));
				cartVO.setCart_product_quantity(Integer.parseInt(quantity));
				
				cartList.add(cartVO);
				
			} 
			
			int price = 0;
			
			int b_Lgset_price = 0;
			int b_price = 0;
			int b_set_price = 0;
			int d_price = 0;
			int s_price = 0;
			int w_price = 0;
			int w_set_price = 0;
			int dessert_price = 0;
			int product_quantity = 0;
			int delivery_price = 7000;
			
			for (CartVO vo : cartList) {
				if (vo.getCart_b_Lgset_price() != null)
					b_Lgset_price = vo.getCart_b_Lgset_price();
				if (vo.getCart_b_price() != null)
					b_price = vo.getCart_b_price();
				if (vo.getCart_b_set_price() != null)
					b_set_price = vo.getCart_b_set_price();
				if (vo.getCart_d_price() != null)
					d_price = vo.getCart_d_price();
				if (vo.getCart_s_price() != null)
					s_price = vo.getCart_s_price();
				if (vo.getCart_w_set_price() != null)
					w_set_price = vo.getCart_w_set_price();
				if (vo.getCart_w_price() != null)
					w_price = vo.getCart_w_price();
				if (vo.getCart_dessert_price() != null)
					dessert_price = vo.getCart_dessert_price();
				if (vo.getCart_quantity() != null)
					product_quantity = vo.getCart_quantity();
				
				System.out.println("---------------------------------");
				System.out.println("b_Lgset_price : " + b_Lgset_price);
				System.out.println("b_price : " + b_price);
				System.out.println("b_set_price : " + b_set_price);
				System.out.println("d_price : " + d_price);
				System.out.println("s_price : " + s_price);
				System.out.println("w_price : " + w_price);
				System.out.println("w_set_price : " + w_set_price);
				System.out.println("dessert_price : " + dessert_price);
				System.out.println("product_quantity : " + product_quantity);
				System.out.println("---------------------------------");
				price = (b_Lgset_price + b_price + b_set_price + d_price + s_price 
						+ dessert_price + w_price + w_set_price) + delivery_price;
				System.out.println("price : " + price);
				System.out.println("---------------------------------");
			}
			session.setAttribute("total_price", price);
			session.setAttribute("delivery_price", delivery_price);
			session.setAttribute("cartList", cartList);
			
			model.addAttribute("cartList", cartList);
			model.addAttribute("price", price);
			model.addAttribute("delivery_price", delivery_price);
		
			UserVO userVO = (UserVO) session.getAttribute("userinfo");
			if(userVO != null) {
				UserAddressVO addressVO = memberService.addressSelect(userVO.getUser_email());
				String address = addressVO.getAddress1() + addressVO.getAddress2();
				model.addAttribute("address", address);
			}
		}
		return "orderConfirm";
	}

	@GetMapping("/faq.do")
	public String faq(Model model) {
		List<FaqVO> vo = faqService.faqSelect();
		model.addAttribute("vo", vo);
		return "faq";
	}

	@GetMapping("/faqSelect.do")
	@ResponseBody
	public List<FaqVO> faqMenu(@RequestParam(value = "MenuSelect", required = false) String MenuSelect,@RequestParam(value = "KeywordSelect", required = false) String KeywordSelect ) {
		List<FaqVO> faqList = new ArrayList<FaqVO>();
		if(MenuSelect != null && KeywordSelect == null) {
			System.out.println("MenuSelect : " + MenuSelect);
			System.out.println("KeywordSelect : " + KeywordSelect);
		faqList = faqService.MenuSelect(MenuSelect);
		for (FaqVO faqList1 : faqList) {
			System.out.println(faqList1.getFaq_seq());
			System.out.println(faqList1.getFaq_name());
			System.out.println(faqList1.getFaq_title());
			System.out.println(faqList1.getFaq_content());
			
		}
		}
		else if(MenuSelect != null && KeywordSelect != null) {
			Map<String, String> map = new HashMap<String,String>();
			map.put("MenuSelect", MenuSelect);
			map.put("KeywordSelect", KeywordSelect);
			System.out.println("MenuSelect : " + MenuSelect);
			System.out.println("KeywordSelect : " + KeywordSelect);
			faqList = faqService.KeywordSelect(map);
			for(FaqVO faqKeyword1 : faqList) {
				System.out.println(faqKeyword1.getFaq_seq());
				System.out.println(faqKeyword1.getFaq_name());
				System.out.println(faqKeyword1.getFaq_title());
				System.out.println(faqKeyword1.getFaq_content());
				
		}
		}
		return faqList;
	}
	
//	@PostMapping("/faqKeyword.do")
//	@ResponseBody
//	public List<FaqVO> faqKeyword(@RequestParam(value = "MenuSelect", required = false)String type, @RequestParam(value = "KeywordSelect", required = false) String keyword ){
//		List<FaqVO> faqKeyword = faqService.KeywordSelect(type, keyword);
//		for(FaqVO faqKeyword1 : faqKeyword) {
//			System.out.println(faqKeyword1.getFaq_seq());
//			System.out.println(faqKeyword1.getFaq_name());
//			System.out.println(faqKeyword1.getFaq_title());
//			System.out.println(faqKeyword1.getFaq_content());
//		}
//		return faqService.KeywordSelect(type, keyword);
//	}

	@GetMapping("/join.do")
	public String join() {
		return "join";
	}

	// qnaselect
	@PostMapping("/qnaSelect.do")
	@ResponseBody
	public QnaVO qna(QnaVO qnaVO, @RequestParam(name = "qa_email", defaultValue = "1") String qa_email,
			@RequestParam(name = "qa_password", defaultValue = "1") String qa_password) throws Exception {
		QnaVO vo = qnaService.qnaSelect(qnaVO);

		try {
			//System.out.println(vo.toString());

		} catch (NullPointerException e) {
			//System.out.println("NullException");
		}
		return vo;
	}

	@GetMapping("/qna.do")
	public String qnapage(Model model, @RequestParam(name = "value", required = false) String value) {
		return "qna";
	}

	@GetMapping("/store.do")
	public String store(AdminVO adminVO, Model model) { //하는 중...........

		List<AdminVO> storeList = memberService.getStoreList(adminVO);
		
		
		
		model.addAttribute("storeList", JSONArray.fromObject(storeList));
		
		return "store";
	}
	
	@PostMapping("/searchStore.do")
	@ResponseBody
	public List<AdminVO> searchStore(@RequestParam(name="searchWord")String searchWord) { //매장 검색 부분
		System.out.println("searchWord : " + searchWord);
		List<AdminVO> storeList = adminStoreService.searchStore(searchWord);
		
		for(AdminVO vo : storeList) {
			System.out.println(vo.toString());
		}
		return storeList;
	}
	
	@GetMapping("/brandintro.do")
	public String brandintro() {
		return "brandintro";
	}

	@RequestMapping("/memberJoin.do")
	public String memberJoin() {
		return "memberJoin";
	}

	@GetMapping("/noUserAddress.do")
	public String noUserAddrss() {
		return "noUserAddress";
	}

	@GetMapping("/delivery.do")
	public String delivery() {
		return "delivery";
	}

	@GetMapping("/brandhistory.do")
	public String brandHistory() {
		return "brandhistory";
	}

	// qna Insert
	@RequestMapping("/qnaInsert.do")
	public String qnaInsert(QnaVO qnaVO) {
		// System.out.println("1 = " + qnaVO.getQa_agree1());
		// System.out.println("2 = " + qnaVO.getQa_agree2());

		qnaService.qnaInsert(qnaVO);
		System.out.println("insertcontroller => " + qnaVO.toString());

		return "qna";
	}

	@GetMapping("/qnaStoreSearch.do")
	public String qnaStoreSearch() {
		return "qnaStoreSearch";
	}

	@PostMapping("/qnaStoreSearchP.do")
	@ResponseBody
	public List<AdminVO> qnaStoreSearchP(@RequestParam(value = "store_address", required = false) String store_address,
			Model model) {
		List<AdminVO> adminVO = new ArrayList<AdminVO>();
		adminVO = qnaService.storeSelect(store_address);
		//System.out.println("qnaStoreSearchP" + store_address);

		model.addAttribute("adminVO", adminVO);

		//System.out.println("qnaStoreSerarch : " + adminVO.toString());

		return adminVO;
	}

	@GetMapping("/competition.do")
	public String competition() {
		return "competition";
	}

	@GetMapping("/crew_recruit.do")
	public String crew_recruit() {
		return "crew_recruit";
	}

	@GetMapping("/crew_work.do")
	public String crew_work() {
		return "crew_work";
	}

	@GetMapping("/crew.do")
	public String crew() {
		return "crew";
	}

	@GetMapping("/paymentWin.do")
	public String paymentWin(Model model, @RequestParam(value = "price", required=false) String price, @RequestParam(value = "delivery_price", required=false) 
				String delivery_price,
				HttpSession session) {
					/*
					 * List<CartVO> cartList =
					 * TypeSafety.sessionCartCaster(session.getAttribute("cartList")); for(CartVO vo
					 * : cartList) { System.out.println(vo.getCart_product_code()); }
					 */
		model.addAttribute("price", price);
		model.addAttribute("delivery_cost",delivery_price);
		int totalPrice = Integer.parseInt(price) +Integer.parseInt(delivery_price);
		model.addAttribute("total_price",totalPrice);
		model.addAttribute("discount",0);
		System.out.println("price : " + price);
		System.out.println("delivery_price : " + delivery_price);
		return "paymentWin";
	}

}