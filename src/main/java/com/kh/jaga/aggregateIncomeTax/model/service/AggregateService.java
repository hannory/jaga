package com.kh.jaga.aggregateIncomeTax.model.service;

import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;

public interface AggregateService {

	int insertAddedTaxStmt(AddedTaxStmtDto dto);

}
