package com.kh.jaga.aggregateIncomeTax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
}//class
