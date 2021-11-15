package com.wdelivery.member.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * return true = winmoring available / return false = winmorning not on sale
 */
public class OrderTimer {
	public static boolean isMenuOrderTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("HHmm");
		Date d = new Date();
		if(Integer.parseInt(sdf.format(d))>400 && Integer.parseInt(sdf.format(d))<1030) 
			return true;
		return false;
	}
}
