package com.kh.jaga.company.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.jaga.company.model.dao.CompanyDao;
import com.kh.jaga.company.model.exception.LoginException;
import com.kh.jaga.company.model.vo.Company;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CompanyDao cd;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public Company loginCompany(Company c) throws LoginException {
		Company loginCompany = null;
		
		String encPassword = cd.selectEncPassword(sqlSession,c);
		
		if(!passwordEncoder.matches(c.getCompanyPwd(),encPassword)) {
			throw new LoginException("로그인실패!");
		}else {
			loginCompany = cd.selectCompany(sqlSession,c);
		}
		return loginCompany;
	}

	@Override
	public int insertCompany(Company c) {
		
		System.out.println("insertMember 호출됨");
		System.out.println("아이디"+c.getCompanyId());
		System.out.println("비번"+c.getCompanyPwd());
		return cd.insertCompany(sqlSession,c);
	}



}
