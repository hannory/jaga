package com.kh.jaga.vat.model.service;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.bugagachi.model.vo.CcSalesSlip;
import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vat.model.dao.VatDao;
import com.kh.jaga.vat.model.vo.Vat;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;
import com.kh.jaga.vatDeem.model.vo.Deem;
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

	@Override
	public Receiption selectSumOfTAxInvPur(Receiption reTaxPur, Date eD) {
		// TODO Auto-generated method stub
		return vd.selectSumOfTaxInvPur(sqlSession,reTaxPur,eD);
	}

	@Override
	public Receiption selectRe14(Receiption rePur14, Date eD) {
		// TODO Auto-generated method stub
		return vd.selectRe14(sqlSession, rePur14,eD); 
	}

	@Override
	public Company selectComTypeOfBizCode(Company com) {
		// TODO Auto-generated method stub
		return vd.selectComTypeOfBizCode(sqlSession,com);
	}

	@Override
	public Receiption selectRe19(Receiption re19, Date eD) {
		// TODO Auto-generated method stub
		return vd.selectRe19(sqlSession,re19,eD);
	}

	@Override
	public Deem selectDeem(Deem deem) {
		// TODO Auto-generated method stub
		return vd.selectDeem(sqlSession,deem);
	}

	@Override
	public Receiption selectRe43(Receiption reDeem, Date eD) {
		// TODO Auto-generated method stub
		return vd.selectRe43(sqlSession,reDeem,eD);
	}

	@Override
	public CcSalesSlip selectCcSalesSlip(CcSalesSlip css) {
		// TODO Auto-generated method stub
		return vd.selectCcSalseSlip(sqlSession,css);
	}

	@Override
	public int insertVat(Vat vatRe) {
		// TODO Auto-generated method stub
		return vd.insertVat(sqlSession, vatRe);
	}

	@Override
	public int updateVat(Vat vat) {
		// TODO Auto-generated method stub
		return vd.updateVat(sqlSession,vat);
	}

	@Override
	public String selectVatCode(Vat vatRe) {
		// TODO Auto-generated method stub
		return vd.selectVatCode(sqlSession,vatRe);
	}

	@Override
	public int updateDeadCenVat(Vat vat) {
		// TODO Auto-generated method stub
		return vd.updateDeadCenVat(sqlSession,vat);
	}

	@Override
	public Receiption selectRe1(Receiption sumRe, Date eD) {
		// TODO Auto-generated method stub
		return vd.selectRe1(sqlSession, sumRe, eD);
	}

	

}
