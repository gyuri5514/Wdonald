package com.wdelivery.quartz.service;

public interface QuartzWdonaldService {

	void updateExpiredUserCoupon();
	void updateExpiredAdminCoupon();
	void updateLastLoginStatus();
}
