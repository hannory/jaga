package com.kh.jaga.finStmt.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jaga.finStmt.model.vo.IncomeStmt;
import com.kh.jaga.finStmt.model.vo.IncomeStmtAccount;

public interface FinStmtService {

	int insertIncomeStmt(IncomeStmt i);

	HashMap selectIncomeStmt(IncomeStmtAccount isa);

	ArrayList<IncomeStmtAccount> selectSlip(IncomeStmtAccount isa);

	HashMap selectMfrgCostStmt(IncomeStmtAccount isa);
}
