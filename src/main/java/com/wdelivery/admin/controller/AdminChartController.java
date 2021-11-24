package com.wdelivery.admin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wdelivery.admin.service.AdminStoreService;
import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.store.chart.vo.ChartVO;
import com.wdelivery.store.service.ChartService;

import net.sf.json.JSONArray;

@Controller
public class AdminChartController {
	@Autowired
	private ChartService chartService;
	
	@Autowired
	private AdminStoreService adminStoreService;
	
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
	
	
	 @GetMapping("excel.mdo")
	 public void excelDownload(PaymentVO paymentVO, HttpSession session, HttpServletResponse response) throws IOException {
		 //AdminVO adminVO = (AdminVO) session.getAttribute("admin");
	     // Workbook wb = new HSSFWorkbook();
	        Workbook wb = new XSSFWorkbook();
	        Sheet sheet = wb.createSheet("첫번째 시트");
	        Row row = null;
	        Cell cell = null;
	        int rowNum = 0;

	        // Header
	        String[] header = {"지점", "구매자이메일", "결제방법", "금액", "날짜"};
	        row = sheet.createRow(rowNum++);
	        for(int i=0; i<header.length; i++) {
	        	cell = row.createCell(i);
	        	cell.setCellValue(header[i]);
	        }
			
	        List<PaymentVO> paymentList = adminStoreService.orderList();
	        // Body
	        for (int i=0; i<paymentList.size(); i++) {        	
				SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
				 	
	            row = sheet.createRow(rowNum++);
	            cell = row.createCell(0);
	            cell.setCellValue(paymentList.get(i).getStore_code());
	            cell = row.createCell(1);
	            cell.setCellValue(paymentList.get(i).getUser_email());
	            cell = row.createCell(2);
	            cell.setCellValue(paymentList.get(i).getPayment_type());
	            cell = row.createCell(3);
	            cell.setCellValue(paymentList.get(i).getTotal_price());
	            cell = row.createCell(4);
	            cell.setCellValue(date.format(paymentList.get(i).getOrder_date()));
	        }

	        // 컨텐츠 타입과 파일명 지정
	        response.setContentType("ms-vnd/excel");
	       // response.setHeader("Content-Disposition", "attachment;filename=example.xls");
	        response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

	        // Excel File Output
	        wb.write(response.getOutputStream());
	        wb.close();
	    }
	 
}
