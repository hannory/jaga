package com.kh.jaga.finStmt.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jaga.finStmt.model.vo.FinStmtAccount;
import com.kh.jaga.finStmt.model.vo.IncomeStmt;
import com.kh.jaga.finStmt.model.vo.FinStmtAccount;
import com.kh.jaga.finStmt.model.vo.MfrgStmt;

public interface FinStmtService {

	int insertIncomeStmt(IncomeStmt i);

	HashMap selectIncomeStmt(FinStmtAccount fsa);

	ArrayList<FinStmtAccount> selectSlip(FinStmtAccount fsa);

	HashMap selectMfrgStmt(FinStmtAccount fsa);

	int insertMfrgStmt(MfrgStmt ms);

	MfrgStmt searchMfrg(MfrgStmt ms);

	int countMfrgStmt(MfrgStmt ms);

	HashMap selectFinPos(FinStmtAccount fsa);

	int countClosedMfrg(MfrgStmt ms);

	int countIncomeStmt(IncomeStmt is);

	IncomeStmt searchIncomeStmt(IncomeStmt is);

	int countClosedIncomeStmt(IncomeStmt is);

	ArrayList selectSlipByDateWithArr(FinStmtAccount fsa, String accountClass);

	HashMap selectCompTrialBal(FinStmtAccount fsa);

	ArrayList<FinStmtAccount> selectSlipByDate(FinStmtAccount fsa);
}
