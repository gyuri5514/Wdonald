package com.wdelivery.store.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.store.chart.vo.ChartVO;
import com.wdelivery.store.service.ChartService;
import com.wdelivery.store.service.StoreSalesService;

import edu.emory.mathcs.backport.java.util.Collections;
import net.sf.json.JSONArray;

@Controller
public class StoreSalesController {
	
	@Autowired 
	StoreSalesService storeSalesService;
	@Autowired
	private ChartService chartService;
	
	@GetMapping("tables.sdo")
	public String tables(@RequestParam(name="order_seq", defaultValue = "0") int order_seq, @RequestParam(name="order_status", defaultValue = "0") String order_status,
			Model model, HttpSession session, PaymentVO paymentVO) {
		AdminVO adminVO = (AdminVO) session.getAttribute("admin");
		if(adminVO != null) {
			List<PaymentVO> orderList = storeSalesService.orderList(adminVO);
			model.addAttribute("orderList", orderList);
		}
		if(order_seq > 0) {
			storeSalesService.orderStatus(paymentVO);
		}
		
		
		return "tables";
	}
	
	@GetMapping("/charts.sdo")
	public String charts(Model model,HttpSession session) {
		AdminVO av = (AdminVO) session.getAttribute("admin");
		if(av==null) {
			model.addAttribute("error",1);
			return "index";
		}
		
	    SimpleDateFormat date = new SimpleDateFormat("yy-MM-dd");
	    Calendar week = Calendar.getInstance();
	    week.add(Calendar.DATE , -7);
	    ChartVO c = new ChartVO();
	    String startDate= date.format(week.getTime());
	    c.setEnd_date(date.format(new Date()));
	    c.setStart_date(startDate);
	    c.setStore_code(av.getStore_code());

	    getChart(c,model);
		
		return "charts";
	}
	
	@ResponseBody
	@PostMapping("getNewChart.sdo")
	public JSONArray getNewChart(@RequestBody ChartVO chart,HttpSession session){
		AdminVO av = (AdminVO) session.getAttribute("admin");
		chart.setStore_code(av.getStore_code());
		return JSONArray.fromObject(chartService.getResponsiveChart(chart));
	}
	
	public  ArrayList<ChartVO> getChart(ChartVO chart,Model model){
		ArrayList<ChartVO> chartList = chartService.getinitialChart(chart);
		model.addAttribute("chartList",JSONArray.fromObject(chartList));
	    model.addAttribute("start_date",chart.getStart_date());
	    model.addAttribute("end_date",chart.getEnd_date());
	    
	    List<Integer> maxList = new ArrayList<Integer>();
	    
	    for(ChartVO ca : chartList) 
	    	maxList.add(ca.getSales_amount());
	    
	    model.addAttribute("max",(Integer)Collections.max(maxList));
	    
		return chartList;
	}
}
