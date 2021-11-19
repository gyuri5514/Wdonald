package com.wdelivery.admin.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

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
	
	
	@GetMapping("/burger.mdo")
	public String viewBurger(Model model){
		List<BurgerVO> burgerList = adminService.viewBurger();
		model.addAttribute("burgerVO", burgerList);
		return "burger";
	}

	@GetMapping("/burgerRegister.mdo")
	public String burgerRegister(Model model) {
		return "burgerRegister";
	}
	
	@PostMapping("/burgerRegister.mdo")
	public String burgerInsert(@RequestParam(name="file")MultipartFile file,
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
		String key = "";
		if(burger_type.equals("단품")) {
			key = "img/hamburger/" + file.getOriginalFilename();
			BurgerVO burgerVO = new BurgerVO();
			burgerVO.setB_code(Integer.parseInt(burger_code));
			burgerVO.setB_img_path(uploadFolder + key);
			burgerVO.setB_name(burger_name);
			burgerVO.setB_price(Integer.parseInt(burger_price));
			burgerVO.setB_kcal(Integer.parseInt(burger_kcal));
			burgerVO.setB_regdate(fm.parse(burger_regdate));
			burgerVO.setB_detail_comment(burger_detail);
			burgerVO.setB_img(file.getOriginalFilename());
			burgerVO.setB_status(1);
			System.out.println(burgerVO.toString());
			burgerService.insertBurger(burgerVO);
		}
		else if(burger_type.equals("세트")) {
			key = "img/hamburger_set/" + file.getOriginalFilename();
			BurgerSetVO burgerSetVO = new BurgerSetVO();
			burgerSetVO.setB_set_code(Integer.parseInt(burger_code));
			burgerSetVO.setB_set_img_path(uploadFolder + key);
			burgerSetVO.setB_set_name(burger_name);
			burgerSetVO.setB_set_price(Integer.parseInt(burger_price));
			burgerSetVO.setB_set_kcal(Integer.parseInt(burger_kcal));
			burgerSetVO.setB_set_regdate(fm.parse(burger_regdate));
			burgerSetVO.setB_set_detail_comment(burger_detail);
			burgerSetVO.setB_set_img(file.getOriginalFilename());
			burgerSetVO.setB_set_status(1);
			burgerSetService.insertBurgerSet(burgerSetVO);
			
			BurgerLgSetVO burgerLgSetVO = new BurgerLgSetVO();
			burgerLgSetVO.setB_lgset_code(Integer.parseInt(burger_code));
			burgerLgSetVO.setB_lgset_img_path(uploadFolder + key);
			burgerLgSetVO.setB_lgset_name(burger_name);
			burgerLgSetVO.setB_lgset_price(Integer.parseInt(burger_price));
			burgerLgSetVO.setB_lgset_kcal(Integer.parseInt(burger_kcal));
			burgerLgSetVO.setB_lgset_regdate(fm.parse(burger_regdate));
			burgerLgSetVO.setB_lgset_detail_comment(burger_detail);
			burgerLgSetVO.setB_lgset_img(file.getOriginalFilename());
			burgerLgSetVO.setB_lgset_status(1);
			burgerLgSetService.insertBurgerLgSet(burgerLgSetVO);
		} 
		
		InputStream is = file.getInputStream();
        String contentType = file.getContentType();
        long contentLength = file.getSize();
        awsS3.upload(is, key, contentType, contentLength);
        
		return "redirect:burger.mdo";
	}
}
