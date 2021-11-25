package com.wdelivery.quartz;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.wdelivery.quartz.service.QuartzWdonaldService;

public class QuartzWdonald extends QuartzJobBean {
	
	private QuartzWdonaldService quartzService;
	
	@Override
	protected void executeInternal(JobExecutionContext context) 
			throws JobExecutionException {
			quartzService.updateExpiredUserCoupon();
			quartzService.updateExpiredAdminCoupon();
	}

	public void setQuartzService(QuartzWdonaldService quartzService) {
		this.quartzService = quartzService;
	}

}
