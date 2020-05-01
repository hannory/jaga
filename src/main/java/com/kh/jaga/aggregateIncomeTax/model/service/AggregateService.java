package com.kh.jaga.aggregateIncomeTax.model.service;

import java.util.List;

import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.vo.BizCodeVo;

public interface AggregateService {

	int insertAddedTaxStmt(AddedTaxStmtDto dto);

	List<BizCodeVo> selectBizCodeList();

}
