package com.kh.jaga.aggregateIncomeTax.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.vo.BizCodeVo;

public interface AggregateDao {

	int insertAddedTaxStmt(SqlSessionTemplate sqlSession, AddedTaxStmtDto dto);

	List<BizCodeVo> selectBizCodeList(SqlSessionTemplate sqlSession);

}
