package com.kh.jaga.expendResolution.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.companyInnerId.model.vo.ComInIdVo;
import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;
import com.kh.jaga.expendResolution.model.vo.AccountTitleVo;
import com.kh.jaga.expendResolution.model.vo.DepartmentVo;

public interface ExpendResolutionDao {

	int insertExpendResoltion(ExpendResolutionDto dto, SqlSessionTemplate sqlSession);

	List<DepartmentVo> selectDeptList(SqlSessionTemplate sqlSession);

	List<AccountTitleVo> selectAccountTitleList(SqlSessionTemplate sqlSession);

	List<ComInIdVo> selectComInIdListList(SqlSessionTemplate sqlSession, String comCome);

	List<ExpendResolutionDto> selectExpendResolutionList(SqlSessionTemplate sqlSession);

}
