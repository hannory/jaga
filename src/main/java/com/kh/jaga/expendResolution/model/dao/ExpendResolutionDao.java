package com.kh.jaga.expendResolution.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;
import com.kh.jaga.expendResolution.model.vo.DepartmentVo;

public interface ExpendResolutionDao {

	int insertExpendResoltion(ExpendResolutionDto dto, SqlSessionTemplate sqlSession);

	List<DepartmentVo> selectDeptList(SqlSessionTemplate sqlSession);

}
