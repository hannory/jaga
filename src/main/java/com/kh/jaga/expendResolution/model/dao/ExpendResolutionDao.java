package com.kh.jaga.expendResolution.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.companyInnerId.model.vo.ComInIdVo;
import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;
import com.kh.jaga.expendResolution.model.vo.AccountTitleVo;
import com.kh.jaga.expendResolution.model.vo.DepartmentVo;
import com.kh.jaga.expendResolution.model.vo.ExpendResolutionDetailVo;
import com.kh.jaga.vender.model.vo.Vender;

public interface ExpendResolutionDao {

	int insertExpendResoltion(ExpendResolutionDto dto, SqlSessionTemplate sqlSession);

	List<DepartmentVo> selectDeptList(SqlSessionTemplate sqlSession);

	List<AccountTitleVo> selectAccountTitleList(SqlSessionTemplate sqlSession);

	List<ComInIdVo> selectComInIdListList(SqlSessionTemplate sqlSession, String comCome);

	List<ExpendResolutionDto> selectExpendResolutionList(SqlSessionTemplate sqlSession);

	ExpendResolutionDto selectExpendResolutionOne(SqlSessionTemplate sqlSession, String expendResolutionNo);

	List<ExpendResolutionDetailVo> selectDetailList(SqlSessionTemplate sqlSession, String expendResolutionNo);

	List<Vender> selectVenderList(SqlSessionTemplate sqlSession, String comCode);

}
