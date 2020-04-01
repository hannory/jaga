package com.kh.jaga.service;

import org.springframework.stereotype.Service;

@Service
public class testServiceImpl implements testService{

	@Override
	public String abcd() {
		return "뭐시기뭐시기 성공인건가";
	}

}
