package com.kh.jaga.companyInnerId.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;
import com.kh.jaga.companyInnerId.model.exception.ComInIdException;
import com.kh.jaga.companyInnerId.model.vo.PageInfo;
import com.kh.jaga.companyInnerId.model.vo.SelectCompanyIdVo;

public interface CompanyInnerIdDao {

	public abstract int insertComInnerId(
			CreateCompanyInnerIdDto data, SqlSessionTemplate sqlSession);

	public abstract List selectComInIdList(SqlSessionTemplate sqlSession, PageInfo pi);

	public abstract int insertTest(CreateCompanyInnerIdDto data, SqlSessionTemplate sqlSession) throws ComInIdException;

	public abstract int selectComIdListCount(SqlSessionTemplate sqlSession, String companyCode);


	
}
