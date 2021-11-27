package com.wdelivery.quartz.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.wdelivery.quartz.dao.QuartzWdonaldDAO;

public class QuartzWdonaldServiceImpl implements QuartzWdonaldService {

	@Autowired
	private QuartzWdonaldDAO quartzWdonaldDAO;
	private SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	
	@Override
	public void updateExpiredUserCoupon() {
		System.out.println(quartzWdonaldDAO.updateExpiredUserCoupon(date.format(new Date())));
	}

	@Override
	public void updateExpiredAdminCoupon() {
		System.out.println(quartzWdonaldDAO.updateExpiredAdminCoupon(date.format(new Date())));
	}

	@Override
	public void updateLastLoginStatus() {
		 Calendar week = Calendar.getInstance();
		 week.add(Calendar.DATE , -30);
		 System.out.println(quartzWdonaldDAO.updateLastLoginStatus(date.format(week.getTime())));
	}
}
