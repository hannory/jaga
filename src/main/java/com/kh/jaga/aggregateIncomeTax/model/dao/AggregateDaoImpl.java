package com.kh.jaga.aggregateIncomeTax.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;

@Repository
public class AggregateDaoImpl implements AggregateDao{

	@Override
	public int insertAddedTaxStmt(SqlSessionTemplate sqlSession, AddedTaxStmtDto dto) {

		int result = sqlSession.insert("Aggregate.insertAddedTaxStmt", dto);
		
		return result;
	}

}
