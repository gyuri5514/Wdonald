package com.wdelivery.store.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.order.vo.OrderVO;
import com.wdelivery.store.chart.vo.ChartVO;
import com.wdelivery.store.service.StoreSalesService;

@Controller
public class StoreSalesController {
	
	@Autowired 
	StoreSalesService storeSalesService;
	
	
	@GetMapping("tables.sdo")
	public String tables(@RequestParam(name="order_seq", defaultValue = "0") int order_seq, @RequestParam(name="order_status", defaultValue = "0") String order_status,
			Model model, HttpSession session, PaymentVO paymentVO) {
		AdminVO adminVO = (AdminVO) session.getAttribute("store_admin");
		if(adminVO == null) {
			model.addAttribute("error",1);
			return "index";
		}
		List<PaymentVO> orderList = storeSalesService.orderList(adminVO);
		model.addAttribute("orderList", orderList);
		if(order_seq > 0) {
			storeSalesService.orderStatus(paymentVO);
		}
		
		
		return "tables";
	}
	@GetMapping("orderCancel.sdo")
	public String orderCancel(PaymentVO paymentVO, Model model, HttpSession session) {
		AdminVO adminVO = (AdminVO) session.getAttribute("store_admin");
		if(adminVO != null) {
			System.out.println(adminVO.getStore_code());
			List<PaymentVO> orderCancel = storeSalesService.orderCancel(adminVO.getStore_code());
			//System.out.println("cancelView : " + orderCancel.toString());
			model.addAttribute("orderCancel", orderCancel);
		}else {
			return "redirect:login.mdo";
		}
		return "orderCancel";
	}
	
	

	 @GetMapping("excel.sdo")
	 public void excelDownload(PaymentVO paymentVO, HttpSession session, HttpServletResponse response) throws IOException {
		 AdminVO adminVO = (AdminVO) session.getAttribute("store_admin");
	       // Workbook wb = new HSSFWorkbook();
	        Workbook wb = new XSSFWorkbook();
	        Sheet sheet = wb.createSheet("첫번째 시트");
	        Row row = null;
	        Cell cell = null;
	        int rowNum = 0;

	        // Header
	        String[] header = {"구매자 성함", "사용자이메일", "결제방법", "금액", "날짜"};
	        row = sheet.createRow(rowNum++);
	        for(int i=0; i<header.length; i++) {
	        	cell = row.createCell(i);
	        	cell.setCellValue(header[i]);
	        }
			
	        List<PaymentVO> paymentList = storeSalesService.orderList(adminVO);
	        // Body
	        for (int i=0; i<paymentList.size(); i++) {        	
				SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
				 	
	            row = sheet.createRow(rowNum++);
	            cell = row.createCell(0);
	            cell.setCellValue(paymentList.get(i).getUser_name());
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
