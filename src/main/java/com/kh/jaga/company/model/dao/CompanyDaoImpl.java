package com.kh.jaga.company.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.company.model.exception.LoginException;
import com.kh.jaga.company.model.vo.Company;

@Repository
public class CompanyDaoImpl implements CompanyDao {

	@Override
	public Company loginCheck(SqlSessionTemplate sqlSession, Company c) throws LoginException {
		System.out.println("Dao다");
		
		Company loginCompany = sqlSession.selectOne("Company.loginCheck",c);
		
		System.out.println("dao로그인되었니"+loginCompany);
		
		if(loginCompany ==null) {
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
		
		System.out.println("dao");

		return sqlSession.insert("Company.insertCompany",c);
	}

}
