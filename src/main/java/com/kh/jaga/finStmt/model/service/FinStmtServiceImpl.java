package com.kh.jaga.finStmt.model.service;

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
		//log 출력
		final Logger logger = LoggerFactory.getLogger(FinStmtDaoImpl.class);
		
		System.out.println("IncomeStmt at Service : " + i);
		
		System.out.println("Log4j 동작 테스트");
		logger.info(fsd.toString());
		
		return fsd.insertIncomeStmt(sqlSession, i);
	}

	@Override
	public IncomeStmtAccount selectIncomeStmt(IncomeStmtAccount isa) {

		return fsd.selectIncomeStmt(sqlSession, isa);
	}

}
