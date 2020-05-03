package com.kh.jaga.vat.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vat.model.vo.Vat;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;


@Repository
public class VatDaoImpl implements VatDao{


	@Override
	public Vat selectVat(SqlSessionTemplate sqlSession, Vat vat) {
		System.out.println("Dao: selectVat: vat: "+vat);
		Vat vat2=sqlSession.selectOne("Vat.selectVat",vat);
		System.out.println("Dao: selectVat: vat: "+vat2);
		
		return vat2;
	}

	@Override
	public SumOfTaxInv selectSumOfTaxInv(SqlSessionTemplate sqlSession, SumOfTaxInv soti) {
		//세금계산서 합계표 마감처리된거 있나 확인하는 메소드
		System.out.println("Dao: selectSumOfTaxInv:soti: "+soti);
		SumOfTaxInv sotiD=sqlSession.selectOne("Vat.selectSumOfTaxInv",soti);
		System.out.println("Dao: selectSumOfTaxInv:sotiD: "+sotiD);
		return sotiD;
	}

	@Override
	public SumOfTaxInvDiv selectSumOfTaxInvDiv(SqlSessionTemplate sqlSession, SumOfTaxInvDiv sotiDiv) {
		// TODO 세금계산서 합계표 구분표 23번 가지러가기
		System.out.println("Dao: selectSumOfTaxInv:sotiDiv: "+sotiDiv);
		SumOfTaxInvDiv sotiD=sqlSession.selectOne("Vat.selectSumOfTaxInvDiv",sotiDiv);
		System.out.println("Dao: selectSumOfTaxInv:sotiD: "+sotiD);
		return sotiD;
	}

	@Override
	public CcIssStmt selectCcIssStmt(SqlSessionTemplate sqlSession, CcIssStmt cis) {
		// TODO Auto-generated method stub
		System.out.println("Dao: selectCcIssStmt: cis: "+cis);
		
		CcIssStmt cis2=sqlSession.selectOne("Vat.selectCcIssStmt", cis);
		
		System.out.println("Dao: selectCcIssStmt: cis: "+cis);
		return cis2;
	}

	@Override
	public List<Receiption> selectCcIssStmtRe(SqlSessionTemplate sqlSession, Receiption re, Date eD) {
		// TODO Auto-generated method stub
		System.out.println("Dao: selectCcIssStmtRe: re: "+re);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("Receiption",re);
		map.put("endDate",eD);
		List<Receiption> reResult=new ArrayList<Receiption>(); 
		Receiption re1=sqlSession.selectOne("Vat.selectCcIssStmtRe",map);
		System.out.println("Dao: selectCcIssStmtRe: re: 확인해보자 0"+re);
		Receiption re0=sqlSession.selectOne("Vat.selectCcIssStmtRe0",map);
		System.out.println("Dao: selectCcIssStmtRe: re: 확인해보자 "+re);
		reResult.add(re1);
		reResult.add(re0);
		System.out.println("Dao: selectCcIssStmtRe: re: 확인해보자 2"+re);
		System.out.println("Dao: selectCcIssStmtRe: re1: "+re1);
		return reResult;
	}

}
