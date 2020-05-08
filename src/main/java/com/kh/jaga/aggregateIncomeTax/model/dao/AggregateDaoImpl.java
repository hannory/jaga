package com.kh.jaga.aggregateIncomeTax.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;
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
	public IncomeStmt selectData40(SqlSessionTemplate sqlSession, Map<String, String> info) {
		
		IncomeStmt is = sqlSession.selectOne("Aggregate.selectData40", info);
		
		return is;
	}

}
