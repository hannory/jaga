package com.kh.jaga.financialStmt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author hannory
 * @comment Financial Statement(재무제표) 관련 Controller 
 * @createDate 2020. 4. 8.
 */
@Controller
public class finStmtController {
	@GetMapping("compTrialBal.fs")
    public String showCompTrialBal() {
       return "compTrialBal";
    }
	
	@GetMapping("stmtOfFinPos.fs")
    public String showStmtOfFinPos() {
       return "stmtOfFinPos";
    }
	
	@GetMapping("incomeStmt.fs")
	public String showIncomeStmt() {
		return "incomeStmt";
	}
	
	@GetMapping("mfrgCostsStmt.fs")
	public String showMfrgCostsStmt() {
		return "mfrgCostsStmt";
	}
	
	@GetMapping("stmtOfCashFlow.fs")
	public String showStmtOfCashFlow() {
		return "stmtOfCashFlow";
	}
}
