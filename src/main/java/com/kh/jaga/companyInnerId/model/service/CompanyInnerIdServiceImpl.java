package com.kh.jaga.companyInnerId.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.companyInnerId.model.dao.CompanyInnerIdDao;
import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;

@Service
public class CompanyInnerIdServiceImpl implements CompanyInnerIdService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	CompanyInnerIdDao dao;

	@Override
	public int insertComInnerId(CreateCompanyInnerIdDto data) {
		System.out.println("서비스 호출됨,, data출력해보자");
		System.out.println(data);
		
		int result = dao.insertComInnerId(data, sqlSession);
		
		
		
		
		return result;
	}

	@Override
	public List selectComInIdList() {
		
		System.out.println("service 진입 ...");
		
		List list = dao.selectComInIdList(sqlSession);
		
		System.out.println("service > return list : " + list);
		
		return list;
	}

}
