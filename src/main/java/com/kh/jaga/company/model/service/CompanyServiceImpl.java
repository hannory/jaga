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
			throw new LoginException(" 로그인 실패! ");
		}else {
			loginCompany = cd.selectCompany(sqlSession,c);
		}
		return loginCompany;
	}

	@Override
	public int insertCompany(Company c) {

		return cd.insertCompany(sqlSession,c);
	}

	@Override
	public int doubleCheckId(String userId) {
		int checkIdresult =0;
		Company checkId= cd.doubleCheckId(sqlSession,userId);
		
		if(checkId==null) {
			checkIdresult=1;
			
		}else {
			checkIdresult=99;
		}
		 return checkIdresult;
	}
} 
