package com.kh.jaga.common;

import java.util.UUID;

public class CommonsUtils {
	
	public static String getRandomString() {
		
		return UUID.randomUUID().toString().replace("-", "");
	}

}
