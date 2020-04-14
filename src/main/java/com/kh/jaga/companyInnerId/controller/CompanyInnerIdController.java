package com.kh.jaga.companyInnerId.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;
import com.kh.jaga.companyInnerId.model.service.CompanyInnerIdServiceImpl;

@Controller
public class CompanyInnerIdController {
	
	@Autowired
	private CompanyInnerIdServiceImpl comInnerIdservice;
	
	@RequestMapping(value="createComInnerId.companyInnerId")
	public String createComInnerId(CreateCompanyInnerIdDto data) {
		
		System.out.println("컨트롤러 진입");
		System.out.println(data);
		
		//받아온 데이터 디비에 저장해보자
		int result = comInnerIdservice.insertComInnerId(data);
		
		System.out.println("result : " + result);
		
		
		
		
		return "redirect:temp.jsp";
	}
}
