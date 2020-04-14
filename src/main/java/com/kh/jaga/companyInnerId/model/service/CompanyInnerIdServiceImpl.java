package com.kh.jaga.companyInnerId.model.service;

import org.springframework.stereotype.Service;

import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;

@Service
public class CompanyInnerIdServiceImpl implements CompanyInnerIdService {

	@Override
	public int insertComInnerId(CreateCompanyInnerIdDto data) {
		System.out.println("서비스 호출됨,, data출력해보자");
		System.out.println(data);
		
		return -99;
	}

}
