package com.kh.jaga.aggregateIncomeTax.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.AggregateCalculatedDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.AmountDataDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.IncomeAmountStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.vo.BizCodeVo;
import com.kh.jaga.finStmt.model.vo.IncomeStmt;

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

	@Override
	public AmountDataDto selectData40(SqlSessionTemplate sqlSession, Map<String, String> info) {
		
		AmountDataDto is = sqlSession.selectOne("Aggregate.selectData40", info);
		
		return is;
	}

	@Override
	public int insertIncomeAmount(SqlSessionTemplate sqlSession, IncomeAmountStmtDto dto) {
		
		int result = sqlSession.insert("Aggregate.insertIncomeAmount",dto);
		
		return result;
	}

	@Override
	public AggregateCalculatedDto selectAggregateCalculated(SqlSessionTemplate sqlSession, Map<String, String> map) {
		
		AggregateCalculatedDto dto = sqlSession.selectOne("Aggregate.selectAggregateCalculated",map);
		
		return dto;
	}

	@Override
	public AggregateCalculatedDto selectExistingData(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("Aggregate.selectExistingData",map);
	}

}
