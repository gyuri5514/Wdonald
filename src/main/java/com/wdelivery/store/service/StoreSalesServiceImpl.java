package com.wdelivery.store.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.excel.util.ExcelRead;
import com.wdelivery.excel.util.ExcelReadOption;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.store.dao.StoreSalesDAO;

@Service
public class StoreSalesServiceImpl implements StoreSalesService {

	@Autowired
	private StoreSalesDAO storeSalesDAO;

	@Override
	public List<PaymentVO> orderList(AdminVO adminVO) {
		
		return storeSalesDAO.orderList(adminVO);
	}

	@Override
	public void orderStatus(PaymentVO paymentVO) {
		storeSalesDAO.orderStatus(paymentVO);
	}

	@Override
	public List<PaymentVO> orderCancel(String store_code) {
		return storeSalesDAO.orderCancel(store_code);
	}

	
}
