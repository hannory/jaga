package com.kh.jaga.aggregateIncomeTax.model.service;

import java.util.List;
import java.util.Map;

import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.vo.BizCodeVo;
import com.kh.jaga.finStmt.model.vo.IncomeStmt;

public interface AggregateService {

	int insertAddedTaxStmt(AddedTaxStmtDto dto);

	List<BizCodeVo> selectBizCodeList();

	IncomeStmt getData40(Map<String, String> info);

}
