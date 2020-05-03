package com.kh.jaga.vat.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vat.model.vo.Vat;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;

@Service
public interface VatService {

	Vat selectVat(Vat vat);

	SumOfTaxInv selectSumOfTaxInv(SumOfTaxInv soti);

	SumOfTaxInvDiv selectSumOfTaxInvDiv(SumOfTaxInvDiv sotiDiv);

	CcIssStmt selectCcIssStmt(CcIssStmt cis);

	List<Receiption> selectCcIssStmtRe(Receiption re, Date eD);


}
