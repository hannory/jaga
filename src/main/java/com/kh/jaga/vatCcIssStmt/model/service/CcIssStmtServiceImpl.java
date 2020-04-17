package com.kh.jaga.vatCcIssStmt.model.service;

import java.sql.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vatCcIssStmt.model.dao.CcIssStmtDao;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;

@Service
public class CcIssStmtServiceImpl implements CcIssStmtService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CcIssStmtDao cd;
	
	
	
	@Override
	public CcIssStmt selectCis(CcIssStmt cis) {
		// TODO 신용카드매출전표등 발행금액 집계표 값있는지 확인하기
		
		CcIssStmt cis2=null;
		cis2=cd.selectCis(sqlSession,cis);
		
		return cis2;
	}


	@Override
	public CcIssStmt selectNewCis(Receiption re, Date eD) {
		// TODO 전표들을 받아와서 계산해야함
				CcIssStmt cis=null;
				cis=cd.selectNewCis(sqlSession,re,eD);
		return null;
	}

}
