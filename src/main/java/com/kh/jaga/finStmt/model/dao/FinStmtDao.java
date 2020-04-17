package com.kh.jaga.finStmt.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.finStmt.model.vo.IncomeStmt;
import com.kh.jaga.finStmt.model.vo.IncomeStmtAccount;

public interface FinStmtDao {

	int insertIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt i);

	IncomeStmtAccount selectIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmtAccount isa);

}
