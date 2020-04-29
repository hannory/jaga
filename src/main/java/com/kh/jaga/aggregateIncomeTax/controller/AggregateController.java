package com.kh.jaga.aggregateIncomeTax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;

/**
 * @author SWY
 * @comment 종합소득세 컨트롤러
 * @createDate 2020. 4. 29.
 */
@Controller
public class AggregateController {
	
	@RequestMapping("showAggregateIncomeTax.aggregate")
	public String showAggregateIncomeTax() {
		/* 소득금액명세서 */
		return "aggregateIncomeTax";
	}

	@RequestMapping("showIncomeDeductStmt.aggregate")
	public String showIncomeDeductStmt() {
		/* 소득공제명세서 */
		
		return "incomeDeductStmt";
	}
	
	@RequestMapping("showAddedTaxStmt.aggregate")
	public String showAddedTaxStmt() {
		/* 가산세명세서 */
		return "addedTaxStmt";
	}
	
	@RequestMapping("showAggregateCalculated.aggregate")
	public String showAggregateCalculated() {
		/* 종합소득세액계산서 */
		return "aggregateCalculated";
	}
	
	@RequestMapping("insertAddedTaxStmt.aggregate")
	public String insertAddedTaxStmt(AddedTaxStmtDto dto) {
		System.out.println("저장 버튼 눌렀음 ,, 컨트롤러도착,, dto :::");
		System.out.println(dto);
		return "addedTaxStmt";
	}
	
	
}//class
