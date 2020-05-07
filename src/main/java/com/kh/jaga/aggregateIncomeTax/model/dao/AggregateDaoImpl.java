package com.kh.jaga.aggregateIncomeTax.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.vo.BizCodeVo;

@Repository
public class AggregateDaoImpl implements AggregateDao{

	@Override
	public int insertAddedTaxStmt(SqlSessionTemplate sqlSession, AddedTaxStmtDto dto) {

		int result = sqlSession.insert("Aggregate.insertAddedTaxStmt", dto);
		
		return result;
	}

	@Override
	public List<BizCodeVo> selectBizCodeList(SqlSessionTemplate sqlSession) {

		List<BizCodeVo> list = sqlSession.selectList("Aggregate.selectBizCodeList");
		
		return list;
	}

	@Override
	public int updateAddedTaxStmt(SqlSessionTemplate sqlSession, AddedTaxStmtDto dto) {
		
		int result = sqlSession.update("Aggregate.updateAddedTaxStmt", dto);
		
		return result;
	}

}
