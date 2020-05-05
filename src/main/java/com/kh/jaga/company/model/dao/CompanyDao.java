package com.kh.jaga.company.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.company.model.exception.LoginException;
import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.company.model.vo.TypeOfBiz;
import com.kh.jaga.companyInnerId.model.vo.ComInIdVo;

public interface CompanyDao {

	String selectEncPassword(SqlSessionTemplate sqlSession, Company c);

	Company selectCompany(SqlSessionTemplate sqlSession, Company c);

	Company loginCheck(SqlSessionTemplate sqlSession, Company c) throws LoginException;

	int insertCompany(SqlSessionTemplate sqlSession, Company c);
 
	Company doubleCheckId(SqlSessionTemplate sqlSession, String userId);

	ComInIdVo loginEmp(SqlSessionTemplate sqlSession, HashMap<String, String> empData);

	List<TypeOfBiz> selectbizTypeList(SqlSessionTemplate sqlSession);

}
