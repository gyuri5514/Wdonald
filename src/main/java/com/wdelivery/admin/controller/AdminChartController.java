package com.wdelivery.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.store.chart.vo.ChartVO;
import com.wdelivery.store.service.ChartService;

import net.sf.json.JSONArray;

@Controller
public class AdminChartController {
	@Autowired
	private ChartService chartService;
	
	@GetMapping("/charts.mdo")
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
		/* c.setStore_code(av.getStore_code()); */

	    getChart(c,model);
		
		return "charts";
	}
	
	@ResponseBody
	@PostMapping("getNewChart.mdo")
	public JSONArray getNewChart(@RequestBody ChartVO chart,HttpSession session){
		if(session.getAttribute("admin")==null)
			return null;
		System.out.println(chart.toString());
		return JSONArray.fromObject(chartService.getResponsiveChart(chart));
	}
	
	public  void getChart(ChartVO chart,Model model){
		model.addAttribute("chartList",JSONArray.fromObject( chartService.getinitialChart(chart)));
	    model.addAttribute("start_date",chart.getStart_date());
	    model.addAttribute("end_date",chart.getEnd_date());
	    System.out.println(chart.toString());
	    ArrayList<ChartVO> pieList = chartService.getPieChart(chart);
	    for(ChartVO c : pieList)
	    	System.out.println(c.toString());
	    model.addAttribute("pieList",JSONArray.fromObject(chartService.getPieChart(chart)));
	}
	
}
