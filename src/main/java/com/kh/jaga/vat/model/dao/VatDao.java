package com.kh.jaga.vat.model.dao;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vat.model.vo.Vat;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;

@Repository
public interface VatDao {

	Vat selectVat(SqlSessionTemplate sqlSession, Vat vat);

	SumOfTaxInv selectSumOfTaxInv(SqlSessionTemplate sqlSession, SumOfTaxInv soti);

	SumOfTaxInvDiv selectSumOfTaxInvDiv(SqlSessionTemplate sqlSession, SumOfTaxInvDiv sotiDiv);

	CcIssStmt selectCcIssStmt(SqlSessionTemplate sqlSession, CcIssStmt cis);

	List<Receiption> selectCcIssStmtRe(SqlSessionTemplate sqlSession, Receiption re, Date eD);


}
