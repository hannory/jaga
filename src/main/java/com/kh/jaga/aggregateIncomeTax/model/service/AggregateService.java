package com.kh.jaga.aggregateIncomeTax.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.AggregateCalculatedDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.AmountDataDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.DeductStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.IncomeAmountStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.PaidTaxStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.vo.BizCodeVo;
import com.kh.jaga.finStmt.model.vo.IncomeStmt;

public interface AggregateService {

	int insertAddedTaxStmt(AddedTaxStmtDto dto);

	List<BizCodeVo> selectBizCodeList();

	AmountDataDto getData40(Map<String, String> info);

	int insertIncomeAmount(IncomeAmountStmtDto dto);

	AggregateCalculatedDto selectAggregateCalculated(Map<String, String> map);

	AggregateCalculatedDto selectExistingData(HashMap<String, String> map);

	int insertDeduct(DeductStmtDto dto);

	int insertPrePaid(PaidTaxStmtDto dto);


}
