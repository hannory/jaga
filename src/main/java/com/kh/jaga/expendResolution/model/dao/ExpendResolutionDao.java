package com.kh.jaga.expendResolution.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;

public interface ExpendResolutionDao {

	int insertExpendResoltion(ExpendResolutionDto dto, SqlSessionTemplate sqlSession);

}
