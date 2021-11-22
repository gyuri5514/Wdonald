package com.wdelivery.admin.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wdelivery.admin.service.AdminService;
import com.wdelivery.admin.util.AwsS3;
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

import net.sf.json.JSONArray;


@Controller
public class AdminMenuController {

	@Autowired
	private AdminService adminService;
	
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
	
	@GetMapping("/burger.mdo")
	public String viewBurger(Model model, HttpSession session){
		List<BurgerVO> burgerList = adminService.viewBurger();
		model.addAttribute("burgerVO", JSONArray.fromObject(burgerList));
		model.addAttribute("burgerList", burgerList);
		session.setAttribute("burger", burgerList);
		return "burger";
	}
	
	@PostMapping("/burgerUpdate.mdo")
	public String burgerUpdate(BurgerVO burgerVO) {
		adminService.burgerUpdate(burgerVO);
		return "redirect:burger.mdo";
	}
	
	@GetMapping("/winMorning.mdo")
	public String viewMorning(Model model){
		List<WinMorningVO> morningList = adminService.viewMorning();
		model.addAttribute("morningVO", JSONArray.fromObject(morningList));
		model.addAttribute("morningList", morningList);
		return "winMorning";
	}
	
	@PostMapping("/morningUpdate.mdo")
	public String morningUpdate(WinMorningVO winMorningVO) {
		adminService.morningUpdate(winMorningVO);
		return "redirect:winMorning.mdo";
	}
	
	@GetMapping("/side.mdo")
	public String viewSide(Model model){
		List<SideVO> sideList = adminService.viewSide();
		model.addAttribute("sideVO", JSONArray.fromObject(sideList));
		model.addAttribute("sideList", sideList);
		return "side";
	}
	
	@PostMapping("/sideUpdate.mdo")
	public String sideUpdate(SideVO sideVO) {
		adminService.sideUpdate(sideVO);
		return "redirect:side.mdo";
	}
	
	@GetMapping("/dessert.mdo")
	public String viewDessert(Model model){
		List<DessertVO> dessertList = adminService.viewDessert();
		model.addAttribute("dessertVO", JSONArray.fromObject(dessertList));
		model.addAttribute("dessertList", dessertList);
		return "dessert";
	}
	
	@PostMapping("/dessertUpdate.mdo")
	public String dessertUpdate(DessertVO dessertVO) {
		adminService.dessertUpdate(dessertVO);
		return "redirect:dessert.mdo";
	}
	
	@GetMapping("/drink.mdo")
	public String viewDrink(Model model){
		List<DrinkVO> drinkList = adminService.viewDrink();
		model.addAttribute("drinkVO", JSONArray.fromObject(drinkList));
		model.addAttribute("drinkList", drinkList);
		return "drink";
	}
	
	@PostMapping("/drinkUpdate.mdo")
	public String drinkUpdate(DrinkVO drinkVO) {
		adminService.drinkUpdate(drinkVO);
		return "redirect:drink.mdo";
	}
	
	@GetMapping("/happyMeal.mdo")
	public String viewHappyMeal(Model model){
		List<HappyMealVO> happyMealList = adminService.viewHappy();
		model.addAttribute("happyMealVO", JSONArray.fromObject(happyMealList));
		model.addAttribute("happyMealList", happyMealList);
		return "happyMeal";
	}
	
	@PostMapping("/happyMealUpdate.mdo")
	public String happyMealUpdate(HappyMealVO happyMealVO) {
		adminService.happyUpdate(happyMealVO);
		return "redirect:happyMeal.mdo";
	}
	
	@GetMapping("/burgerRegister.mdo")
	public String burgerRegister() {
		return "burgerRegister";
	}
	
	@PostMapping("/burgerRegister.mdo")
	public String burgerInsert(@RequestParam(name="file1")MultipartFile file1,
			@RequestParam(name="file2")MultipartFile file2,
			@RequestParam(name="burger_code") String burger_code,
			@RequestParam(name="burger_name") String burger_name,
			@RequestParam(name="burger_kcal") String burger_kcal,
			@RequestParam(name="burger_price") String burger_price,
			@RequestParam(name="burger_type") String burger_type,
			@RequestParam(name="burger_regdate") String burger_regdate,
			@RequestParam(name="burger_detail") String burger_detail) throws IOException, ParseException{
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		AwsS3 awsS3 = AwsS3.getInstance();
		String uploadFolder = "https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/";
		String key1 = "";
		String key2 = "";
		if(burger_type.equals("단품")) {
			key1 = "img/hamburger/" + file1.getOriginalFilename();
			key2 = "img/hamburger/" + file2.getOriginalFilename();
			BurgerVO burgerVO = new BurgerVO();
			burgerVO.setB_code(Integer.parseInt(burger_code));
			burgerVO.setB_img_path(uploadFolder + key1);
			burgerVO.setB_detail_img_path(uploadFolder + key2);
			burgerVO.setB_name(burger_name);
			burgerVO.setB_price(Integer.parseInt(burger_price));
			burgerVO.setB_kcal(Integer.parseInt(burger_kcal));
			burgerVO.setB_regdate(fm.parse(burger_regdate));
			burgerVO.setB_detail_comment(burger_detail);
			burgerVO.setB_img(file1.getOriginalFilename());
			burgerVO.setB_status(1);
			System.out.println(burgerVO.toString());
			burgerService.insertBurger(burgerVO);
		}
		else if(burger_type.equals("세트")) {
			key1 = "img/hamburger_set/" + file1.getOriginalFilename();
			BurgerSetVO burgerSetVO = new BurgerSetVO();
			burgerSetVO.setB_set_code(Integer.parseInt(burger_code));
			burgerSetVO.setB_set_img_path(uploadFolder + key1);
			burgerSetVO.setB_set_name(burger_name);
			burgerSetVO.setB_set_price(Integer.parseInt(burger_price));
			burgerSetVO.setB_set_kcal(Integer.parseInt(burger_kcal));
			burgerSetVO.setB_set_regdate(fm.parse(burger_regdate));
			burgerSetVO.setB_set_detail_comment(burger_detail);
			burgerSetVO.setB_set_img(file1.getOriginalFilename());
			burgerSetVO.setB_set_status(1);
			burgerSetService.insertBurgerSet(burgerSetVO);
			
			BurgerLgSetVO burgerLgSetVO = new BurgerLgSetVO();
			burgerLgSetVO.setB_lgset_code(Integer.parseInt(burger_code));
			burgerLgSetVO.setB_lgset_img_path(uploadFolder + key1);
			burgerLgSetVO.setB_lgset_name(burger_name);
			burgerLgSetVO.setB_lgset_price(Integer.parseInt(burger_price));
			burgerLgSetVO.setB_lgset_kcal(Integer.parseInt(burger_kcal));
			burgerLgSetVO.setB_lgset_regdate(fm.parse(burger_regdate));
			burgerLgSetVO.setB_lgset_detail_comment(burger_detail);
			burgerLgSetVO.setB_lgset_img(file1.getOriginalFilename());
			burgerLgSetVO.setB_lgset_status(1);
			burgerLgSetService.insertBurgerLgSet(burgerLgSetVO);
		} 
		
		InputStream is = file1.getInputStream();
        String contentType = file1.getContentType();
        long contentLength = file1.getSize();
        awsS3.upload(is, key1, contentType, contentLength);
        
        InputStream is2 = file2.getInputStream();
        String contentType2 = file2.getContentType();
        long contentLength2 = file2.getSize();
        awsS3.upload(is2, key2, contentType2, contentLength2);
        
		return "redirect:burger.mdo";
	}
	
	@GetMapping("/winMorningRegister.mdo")
	public String winMorningRegister() {
		return "winMorningRegister";
	}
	
	@PostMapping("/winMorningRegister.mdo")
	public String winMorningInsert(@RequestParam(name="file1")MultipartFile file1,
			@RequestParam(name="file2")MultipartFile file2,
			@RequestParam(name="winMorning_code") String winMorning_code,
			@RequestParam(name="winMorning_name") String winMorning_name,
			@RequestParam(name="winMorning_kcal") String winMorning_kcal,
			@RequestParam(name="winMorning_price") String winMorning_price,
			@RequestParam(name="winMorning_type") String winMorning_type,
			@RequestParam(name="winMorning_regdate") String winMorning_regdate,
			@RequestParam(name="winMorning_detail") String winMorning_detail) throws IOException, ParseException{
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		AwsS3 awsS3 = AwsS3.getInstance();
		String uploadFolder = "https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/";
		String key1 = "";
		String key2 = "";
		if(winMorning_type.equals("단품")) {
			key1 = "img/mcmorning/mcmorning" + file1.getOriginalFilename();
			key2 = "img/mcmorning/mcmorning" + file2.getOriginalFilename();
			WinMorningVO winMorningVO = new WinMorningVO();
			winMorningVO.setW_code(Integer.parseInt(winMorning_code));
			winMorningVO.setW_img_path(uploadFolder + key1);
			winMorningVO.setW_detail_img_path(uploadFolder + key2);
			winMorningVO.setW_name(winMorning_name);
			winMorningVO.setW_price(Integer.parseInt(winMorning_price));
			winMorningVO.setW_kcal(Integer.parseInt(winMorning_kcal));
			winMorningVO.setW_regdate(fm.parse(winMorning_regdate));
			winMorningVO.setW_detail_comment(winMorning_detail);
			winMorningVO.setW_img(file1.getOriginalFilename());
			winMorningVO.setW_status(1);
			System.out.println(winMorningVO.toString());
			winMorningService.insertWinMorning(winMorningVO);
		}
		else if(winMorning_type.equals("세트")) {
			key1 = "img/mcmorning/mcmorning_set" + file1.getOriginalFilename();
			WinMorningSetVO winMorningSetVO = new WinMorningSetVO();
			winMorningSetVO.setW_set_code(Integer.parseInt(winMorning_code));
			winMorningSetVO.setW_set_img_path(uploadFolder + key1);
			winMorningSetVO.setW_set_name(winMorning_name);
			winMorningSetVO.setW_set_price(Integer.parseInt(winMorning_price));
			winMorningSetVO.setW_set_kcal(Integer.parseInt(winMorning_kcal));
			winMorningSetVO.setW_set_regdate(fm.parse(winMorning_regdate));
			winMorningSetVO.setW_set_img(file1.getOriginalFilename());
			winMorningSetVO.setW_set_status(1);
			winMorningSetService.insertWinMorningSet(winMorningSetVO);
			
		} 
		
		InputStream is = file1.getInputStream();
        String contentType = file1.getContentType();
        long contentLength = file1.getSize();
        awsS3.upload(is, key1, contentType, contentLength);
        
        InputStream is2 = file2.getInputStream();
        String contentType2 = file2.getContentType();
        long contentLength2 = file2.getSize();
        awsS3.upload(is2, key2, contentType2, contentLength2);
        
		return "redirect:winMorning.mdo";
	}
	
	@GetMapping("/dessertRegister.mdo")
	public String dessertRegister() {
		return "dessertRegister";
	}
	
	@PostMapping("/dessertRegister.mdo")
	public String dessertInsert(@RequestParam(name="file1")MultipartFile file1,
			@RequestParam(name="file2")MultipartFile file2,
			@RequestParam(name="dessert_code") String dessert_code,
			@RequestParam(name="dessert_name") String dessert_name,
			@RequestParam(name="dessert_kcal") String dessert_kcal,
			@RequestParam(name="dessert_price") String dessert_price,
			@RequestParam(name="dessert_type", required = false) String dessert_type,
			@RequestParam(name="dessert_regdate") String dessert_regdate,
			@RequestParam(name="dessert_detail") String dessert_detail) throws IOException, ParseException {
				
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		AwsS3 awsS3 = AwsS3.getInstance();
		String uploadFolder = "https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/";
		String key1 = "img/dessert" + file1.getOriginalFilename();
		String key2 = "img/dessert" + file2.getOriginalFilename();
		DessertVO dessertVO = new DessertVO();
		dessertVO.setDessert_code(Integer.parseInt(dessert_code));
		dessertVO.setDessert_img_path(uploadFolder + key1);
		dessertVO.setDessert_detail_img_path(uploadFolder + key2);
		dessertVO.setDessert_name(dessert_name);
		dessertVO.setDessert_price(Integer.parseInt(dessert_price));
		dessertVO.setDessert_kcal(Integer.parseInt(dessert_kcal));
		dessertVO.setDessert_regdate(fm.parse(dessert_regdate));
		dessertVO.setDessert_detail_comment(dessert_detail);
		dessertVO.setDessert_img(file1.getOriginalFilename());
		dessertVO.setDessert_detail_img(file2.getOriginalFilename());
		dessertVO.setDessert_status(1);
		System.out.println(dessertVO.toString());
		dessertService.insertDessert(dessertVO);
		
		InputStream is = file1.getInputStream();
        String contentType = file1.getContentType();
        long contentLength = file1.getSize();
        awsS3.upload(is, key1, contentType, contentLength);
        
        InputStream is2 = file2.getInputStream();
        String contentType2 = file2.getContentType();
        long contentLength2 = file2.getSize();
        awsS3.upload(is2, key2, contentType2, contentLength2);
		
		return "redirect:dessert.mdo";
	}
	
	@GetMapping("/sideRegister.mdo")
	public String sideRegister() {
		return "sideRegister";
	}
	
	@PostMapping("/sideRegister.mdo")
	public String sideInsert(@RequestParam(name="file1")MultipartFile file1,
			@RequestParam(name="file2")MultipartFile file2,
			@RequestParam(name="s_code") String s_code,
			@RequestParam(name="s_name") String s_name,
			@RequestParam(name="s_kcal") String s_kcal,
			@RequestParam(name="s_price") String s_price,
			@RequestParam(name="s_type", required = false) String s_type,
			@RequestParam(name="s_regdate") String s_regdate,
			@RequestParam(name="s_detail") String s_detail) throws IOException, ParseException {
				
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		AwsS3 awsS3 = AwsS3.getInstance();
		String uploadFolder = "https://kgitmacbucket.s3.ap-northeast-2.amazonaws.com/";
		String key1 = "img/snack&side" + file1.getOriginalFilename();
		String key2 = "img/snack&side" + file2.getOriginalFilename();
		SideVO sideVO = new SideVO();
		sideVO.setS_code(Integer.parseInt(s_code));
		sideVO.setS_img_path(uploadFolder + key1);
		sideVO.setS_detail_img_path(uploadFolder + key2);
		sideVO.setS_name(s_name);
		sideVO.setS_price(Integer.parseInt(s_price));
		sideVO.setS_kcal(Integer.parseInt(s_kcal));
		sideVO.setS_regdate(fm.parse(s_regdate));
		sideVO.setS_detail_comment(s_detail);
		sideVO.setS_img(file1.getOriginalFilename());
		sideVO.setS_status(1);
		System.out.println(sideVO.toString());
		sideService.insertSide(sideVO);
		
		InputStream is = file1.getInputStream();
        String contentType = file1.getContentType();
        long contentLength = file1.getSize();
        awsS3.upload(is, key1, contentType, contentLength);
        
        InputStream is2 = file2.getInputStream();
        String contentType2 = file2.getContentType();
        long contentLength2 = file2.getSize();
        awsS3.upload(is2, key2, contentType2, contentLength2);
		
		return "redirect:side.mdo";
	}

}
