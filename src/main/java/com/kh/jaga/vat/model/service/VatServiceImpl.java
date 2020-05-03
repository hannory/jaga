package com.kh.jaga.vat.model.service;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vat.model.dao.VatDao;
import com.kh.jaga.vat.model.vo.Vat;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;

@Service
public class VatServiceImpl implements VatService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private VatDao vd;
	
	@Override
	public Vat selectVat(Vat vat) {
		System.out.println("Service: selectVat: vat: "+vat );
		Vat vat2=vd.selectVat(sqlSession,vat);
		return vat2;
	}

	@Override
	public SumOfTaxInv selectSumOfTaxInv(SumOfTaxInv soti) {
		System.out.println("Service: selectSumOfTaxInv: soit: "+soti);
		return vd.selectSumOfTaxInv(sqlSession,soti);
	}

	@Override
	public SumOfTaxInvDiv selectSumOfTaxInvDiv(SumOfTaxInvDiv sotiDiv) {
		System.out.println("Service: selectSumOfTaxInv: soitDiv: "+sotiDiv);
		return vd.selectSumOfTaxInvDiv(sqlSession, sotiDiv);
	}

	@Override
	public CcIssStmt selectCcIssStmt(CcIssStmt cis) {
		// TODO Auto-generated method stub
		System.out.println("Service: selectCcIssStmt: cis: "+cis);
		return vd.selectCcIssStmt(sqlSession,cis);
	}

	@Override
	public List<Receiption> selectCcIssStmtRe(Receiption re,Date eD) {
		// TODO Auto-generated method stub
		System.out.println("Service: selectCcIssStmtRe: re: "+re);
		return vd.selectCcIssStmtRe(sqlSession,re,eD);
	}

}
