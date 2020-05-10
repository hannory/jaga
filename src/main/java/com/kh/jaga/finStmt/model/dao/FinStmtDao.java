package com.kh.jaga.finStmt.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.finStmt.model.vo.IncomeStmt;
import com.kh.jaga.finStmt.model.vo.FinStmtAccount;
import com.kh.jaga.finStmt.model.vo.MfrgStmt;

public interface FinStmtDao {

	int insertIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt i);

	ArrayList selectSlip(SqlSessionTemplate sqlSession, FinStmtAccount fsa);

	List selectCurFinStmt(SqlSessionTemplate sqlSession, FinStmtAccount fsa);

	List selectPastFinStmt(SqlSessionTemplate sqlSession, FinStmtAccount fsa);

	int insertMfrgStmt(SqlSessionTemplate sqlSession, MfrgStmt ms);

	int countMfrgStmt(SqlSessionTemplate sqlSession, MfrgStmt ms);

	int updateMfrgStmt(SqlSessionTemplate sqlSession, MfrgStmt ms);

	MfrgStmt searchMfrg(SqlSessionTemplate sqlSession, MfrgStmt ms);

	int selectMfrgSum90(SqlSessionTemplate sqlSession, FinStmtAccount fsa);

	int countSavedMfrgStmt(SqlSessionTemplate sqlSession, MfrgStmt ms);

	int countClosedMfrg(SqlSessionTemplate sqlSession, MfrgStmt ms);

	int countIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt is);

	IncomeStmt searchIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt is);

	int countSavedIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt is);

	int updateIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt is);

	int countClosedIncometStmt(SqlSessionTemplate sqlSession, IncomeStmt is);

	List<FinStmtAccount> selectCurFinStmtByDate(SqlSessionTemplate sqlSession, FinStmtAccount fsa);

	List selectPastFinStmtByDate(SqlSessionTemplate sqlSession, FinStmtAccount fsa);

	ArrayList<FinStmtAccount> selectSlipByDateWithArr(SqlSessionTemplate sqlSession, FinStmtAccount fsa);

	int updateLastIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt is);

	int insertLastIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt is);

	ArrayList selectSlipByDate(SqlSessionTemplate sqlSession, FinStmtAccount fsa);

}
