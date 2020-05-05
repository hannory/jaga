package com.kh.jaga.vat.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.jaga.bugagachi.model.vo.CcSalesSlip;
import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vat.model.vo.Vat;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;
import com.kh.jaga.vatDeem.model.vo.Deem;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;

@Service
public interface VatService {

	Vat selectVat(Vat vat);

	SumOfTaxInv selectSumOfTaxInv(SumOfTaxInv soti);

	SumOfTaxInvDiv selectSumOfTaxInvDiv(SumOfTaxInvDiv sotiDiv);

	CcIssStmt selectCcIssStmt(CcIssStmt cis);

	List<Receiption> selectCcIssStmtRe(Receiption re, Date eD);

	Receiption selectSumOfTAxInvPur(Receiption reTaxPur, Date eD);

	Receiption selectRe14(Receiption rePur14, Date eD);

	Company selectComTypeOfBizCode(Company com);

	Receiption selectRe19(Receiption re19, Date eD);

	Deem selectDeem(Deem deem);

	Receiption selectRe43(Receiption reDeem, Date eD);

	CcSalesSlip selectCcSalesSlip(CcSalesSlip css);

	int insertVat(Vat vatRe);


}
