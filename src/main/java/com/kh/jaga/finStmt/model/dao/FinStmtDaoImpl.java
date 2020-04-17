package com.kh.jaga.finStmt.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.jaga.finStmt.model.vo.IncomeStmt;
import com.kh.jaga.finStmt.model.vo.IncomeStmtAccount;
import com.kh.jaga.finStmt.model.vo.StmtDate;

@Repository
public class FinStmtDaoImpl implements FinStmtDao {

	@Override
	public int insertIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt i) {
		
		
		return sqlSession.insert("FinStmt.insertIncomeStmt", i);
	}

	@Override
	public IncomeStmtAccount selectIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmtAccount isa) {

		List list = new ArrayList();
		list = sqlSession.selectList("FinStmt.selectIncomeStmt", isa);		
		
		return isa;
	}

	
	
}
