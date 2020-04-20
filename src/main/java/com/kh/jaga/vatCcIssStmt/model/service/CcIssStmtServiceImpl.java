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
				System.out.println("service 전표 계산후: "+cis);
		return cis;
	}


	@Override
	public int insertCcIssStmt(CcIssStmt cis) {
		System.out.println("마감처리후 SERVICE CIS: "+cis);
		return cd.insertCis(sqlSession,cis);
	}


	@Override
	public String selectCurrvalCcIssStmt(CcIssStmt cis) {
		// TODO 커발가지러가기
		return cd.selectCurrvalCcIssStmt(sqlSession,cis);
	}


	@Override
	public int updateCcIssStmt(CcIssStmt cis) {
		// TODO cis update하러 가기
		
		return cd.updateCcIssStmt(sqlSession,cis);
	}

}
