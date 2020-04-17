package com.kh.jaga.vatCcIssStmt.model.dao;

import java.sql.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;

@Repository
public interface CcIssStmtDao {

	CcIssStmt selectCis(SqlSessionTemplate sqlSession, CcIssStmt cis);

	CcIssStmt selectNewCis(SqlSessionTemplate sqlSession, Receiption re, Date eD);

}
