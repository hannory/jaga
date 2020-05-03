package com.kh.jaga.company.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.company.model.exception.LoginException;
import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.companyInnerId.model.vo.ComInIdVo;

@Repository
public class CompanyDaoImpl implements CompanyDao {

	@Override
	public Company loginCheck(SqlSessionTemplate sqlSession, Company c) throws LoginException {
		
		Company loginCompany = sqlSession.selectOne("Company.loginCheck",c);
		
		if(loginCompany == null) {
			
			throw new LoginException("로그인 정보가 존재하지 않습니다.");
		}
		 
		return loginCompany;
	}
	
	@Override
	public String selectEncPassword(SqlSessionTemplate sqlSession, Company c) {
		return sqlSession.selectOne("Company.selectPwd",c.getCompanyId());
	}

	@Override
	public Company selectCompany(SqlSessionTemplate sqlSession, Company c) {
		return sqlSession.selectOne("Company.selectLoginCompany",c);
	}

	@Override
	public int insertCompany(SqlSessionTemplate sqlSession, Company c) {
		return sqlSession.insert("Company.insertCompany",c);
	}

	@Override
	public Company doubleCheckId(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("Company.doubleIdCheck", userId);
	}

	@Override
	public ComInIdVo loginEmp(SqlSessionTemplate sqlSession, HashMap<String, String> empData) {
		
		ComInIdVo loginEmp = sqlSession.selectOne("Company.selectLoginEmp", empData);
		
		return loginEmp;
	}

}
