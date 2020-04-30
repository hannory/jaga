package com.kh.jaga.aggregateIncomeTax.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;

public interface AggregateDao {

	int insertAddedTaxStmt(SqlSessionTemplate sqlSession, AddedTaxStmtDto dto);

}
