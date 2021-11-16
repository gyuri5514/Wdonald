package com.wdelivery.member.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.naming.ldap.StartTlsRequest;

/**
 * return true = winmoring available / return false = winmorning not on sale
 */
public class OrderTimer {
	private int endTime = 1030;
	private int startTime = 400;
	public  boolean isMenuOrderTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("HHmm");
		Date d = new Date();
		if(Integer.parseInt(sdf.format(d))>startTime && Integer.parseInt(sdf.format(d))<endTime) 
			return true;
		return false;
	}
	public void setEndTime(int endTime) {
		this.endTime = endTime;
	}
	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}
	
}
