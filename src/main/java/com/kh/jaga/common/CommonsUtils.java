package com.kh.jaga.common;

import java.util.Calendar;
import java.util.UUID;

public class CommonsUtils {
	
	public static String getRandomString() {
		
		return UUID.randomUUID().toString().replace("-", "");
	}

	
	
	//timemillis 가져옴
	public String getMillisec() {
		String millis = String.valueOf(Calendar.getInstance().getTimeInMillis());

		return millis;
	}
	
	//매개변수로 int n 전달하면 timeinmills에서 뒤에서부터 n개 가져옴
	public String getMillisec(int n) {
		String millis = String.valueOf(Calendar.getInstance().getTimeInMillis());
		
		millis = millis.substring(millis.length() - n);

		return millis;
	}
	

	
	
	
	
}//class
