package com.wdelivery.quartz.dao;

public interface QuartzWdonaldDAO {

	int updateExpiredUserCoupon(String enddate);

	int updateExpiredAdminCoupon(String enddate);
	
}
