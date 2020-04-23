package com.kh.jaga.finStmt.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.finStmt.model.dao.FinStmtDao;
import com.kh.jaga.finStmt.model.dao.FinStmtDaoImpl;
import com.kh.jaga.finStmt.model.vo.IncomeStmt;
import com.kh.jaga.finStmt.model.vo.IncomeStmtAccount;

@Service
public class FinStmtServiceImpl implements FinStmtService {
	@Autowired
	private FinStmtDao fsd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertIncomeStmt(IncomeStmt i) {
		
		return fsd.insertIncomeStmt(sqlSession, i);
	}

	@Override
	public HashMap selectIncomeStmt(IncomeStmtAccount isa) {

		return fsd.selectIncomeStmt(sqlSession, isa);
	}

	@Override
	public ArrayList<IncomeStmtAccount> selectSlip(IncomeStmtAccount isa) {

		ArrayList list = fsd.selectSlip(sqlSession, isa);
		
		return list;
	}

}
