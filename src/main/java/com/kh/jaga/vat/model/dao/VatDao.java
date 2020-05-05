package com.kh.jaga.vat.model.dao;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.bugagachi.model.vo.CcSalesSlip;
import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vat.model.vo.Vat;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;
import com.kh.jaga.vatDeem.model.vo.Deem;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;

@Repository
public interface VatDao {

	Vat selectVat(SqlSessionTemplate sqlSession, Vat vat);

	SumOfTaxInv selectSumOfTaxInv(SqlSessionTemplate sqlSession, SumOfTaxInv soti);

	SumOfTaxInvDiv selectSumOfTaxInvDiv(SqlSessionTemplate sqlSession, SumOfTaxInvDiv sotiDiv);

	CcIssStmt selectCcIssStmt(SqlSessionTemplate sqlSession, CcIssStmt cis);

	List<Receiption> selectCcIssStmtRe(SqlSessionTemplate sqlSession, Receiption re, Date eD);

	Receiption selectSumOfTaxInvPur(SqlSessionTemplate sqlSession, Receiption reTaxPur, Date eD);

	Receiption selectRe14(SqlSessionTemplate sqlSession, Receiption rePur14, Date eD);

	Company selectComTypeOfBizCode(SqlSessionTemplate sqlSession, Company com);

	Receiption selectRe19(SqlSessionTemplate sqlSession, Receiption re19, Date eD);

	Deem selectDeem(SqlSessionTemplate sqlSession, Deem deem);

	Receiption selectRe43(SqlSessionTemplate sqlSession, Receiption reDeem, Date eD);

	CcSalesSlip selectCcSalseSlip(SqlSessionTemplate sqlSession, CcSalesSlip css);

	int insertVat(SqlSessionTemplate sqlSession, Vat vatRe);


}
