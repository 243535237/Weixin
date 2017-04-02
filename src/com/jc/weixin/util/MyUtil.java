package com.jc.weixin.util;

import java.util.Calendar;
import java.util.Date;

public  class MyUtil {
	
	public static Date getDateByLong(Long time){
		Calendar c = Calendar.getInstance();
		c.setTimeInMillis(1403931367000L);
		return c.getTime();
	} 
	
	
}
