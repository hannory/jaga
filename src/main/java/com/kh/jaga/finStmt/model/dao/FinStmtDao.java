package com.kh.jaga.finStmt.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.finStmt.model.vo.IncomeStmt;
import com.kh.jaga.finStmt.model.vo.IncomeStmtAccount;
import com.kh.jaga.finStmt.model.vo.MfrgStmt;

public interface FinStmtDao {

	int insertIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt i);

	ArrayList selectSlip(SqlSessionTemplate sqlSession, IncomeStmtAccount isa);

	List selectCurFinStmt(SqlSessionTemplate sqlSession, IncomeStmtAccount isa);

	List selectPastFinStmt(SqlSessionTemplate sqlSession, IncomeStmtAccount isa);

	int insertMfrgStmt(SqlSessionTemplate sqlSession, MfrgStmt ms);

	int countMfrgStmt(SqlSessionTemplate sqlSession, MfrgStmt ms);

	int updateMfrgStmt(SqlSessionTemplate sqlSession, MfrgStmt ms);

	MfrgStmt searchMfrg(SqlSessionTemplate sqlSession, MfrgStmt ms);

	int selectMfrgSum90(SqlSessionTemplate sqlSession, IncomeStmtAccount isa);

}
