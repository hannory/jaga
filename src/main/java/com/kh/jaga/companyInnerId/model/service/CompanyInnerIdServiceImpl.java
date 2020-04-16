package com.kh.jaga.companyInnerId.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.companyInnerId.model.dao.CompanyInnerIdDaoImpl;
import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;

@Service
public class CompanyInnerIdServiceImpl implements CompanyInnerIdService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	CompanyInnerIdDaoImpl comInnerIdDao;

	@Override
	public int insertComInnerId(CreateCompanyInnerIdDto data) {
		System.out.println("서비스 호출됨,, data출력해보자");
		System.out.println(data);
		
		int result = comInnerIdDao.insertComInnerId(data, sqlSession);
		
		
		
		
		return result;
	}

}
