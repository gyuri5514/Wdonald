package com.wdelivery.quartz.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.wdelivery.quartz.dao.QuartzWdonaldDAO;

public class QuartzWdonaldServiceImpl implements QuartzWdonaldService {

	@Autowired
	private QuartzWdonaldDAO quartzWdonaldDAO;
	private SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	
	@Override
	public void updateExpiredUserCoupon() {
		int result = quartzWdonaldDAO.updateExpiredUserCoupon(date.format(new Date()));
		System.out.println(result);
	}

	@Override
	public void updateExpiredAdminCoupon() {
		int result = quartzWdonaldDAO.updateExpiredAdminCoupon(date.format(new Date()));
		System.out.println(result);
	}
}
