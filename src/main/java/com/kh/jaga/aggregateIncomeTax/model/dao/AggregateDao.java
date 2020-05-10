package com.kh.jaga.aggregateIncomeTax.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.AggregateCalculatedDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.AmountDataDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.IncomeAmountStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.vo.BizCodeVo;
import com.kh.jaga.finStmt.model.vo.IncomeStmt;

public interface AggregateDao {

	int insertAddedTaxStmt(SqlSessionTemplate sqlSession, AddedTaxStmtDto dto);

	List<BizCodeVo> selectBizCodeList(SqlSessionTemplate sqlSession);

	int updateAddedTaxStmt(SqlSessionTemplate sqlSession, AddedTaxStmtDto dto);

	AmountDataDto selectData40(SqlSessionTemplate sqlSession, Map<String, String> info);

	int insertIncomeAmount(SqlSessionTemplate sqlSession, IncomeAmountStmtDto dto);

	AggregateCalculatedDto selectAggregateCalculated(SqlSessionTemplate sqlSession, Map<String, String> map);

}
