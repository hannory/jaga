package com.kh.jaga.company.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.company.model.exception.LoginException;
import com.kh.jaga.company.model.vo.Company;

public interface CompanyDao {

	String selectEncPassword(SqlSessionTemplate sqlSession, Company c);

	Company selectCompany(SqlSessionTemplate sqlSession, Company c);

	Company loginCheck(SqlSessionTemplate sqlSession, Company c) throws LoginException;

	int insertCompany(SqlSessionTemplate sqlSession, Company c);

	Company doubleCheckId(SqlSessionTemplate sqlSession, String userId);

}
