package com.kh.jaga.companyInnerId.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;

public interface CompanyInnerIdDao {

	public abstract int insertComInnerId(
			CreateCompanyInnerIdDto data, SqlSessionTemplate sqlSession);

	public abstract List selectComInIdList(SqlSessionTemplate sqlSession);

	
}
