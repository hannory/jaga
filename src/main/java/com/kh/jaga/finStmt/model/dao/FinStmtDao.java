package com.kh.jaga.finStmt.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.finStmt.model.vo.IncomeStmt;
import com.kh.jaga.finStmt.model.vo.IncomeStmtAccount;

public interface FinStmtDao {

	int insertIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt i);

	//HashMap selectIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmtAccount isa);

	ArrayList selectSlip(SqlSessionTemplate sqlSession, IncomeStmtAccount isa);

	//HashMap selectMfrgCostStmt(SqlSessionTemplate sqlSession, IncomeStmtAccount isa);

	List selectCurFinStmt(SqlSessionTemplate sqlSession, IncomeStmtAccount isa);

	List selectPastFinStmt(SqlSessionTemplate sqlSession, IncomeStmtAccount isa);

}
