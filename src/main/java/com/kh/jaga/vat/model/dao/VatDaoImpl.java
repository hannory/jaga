package com.kh.jaga.vat.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
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
		System.out.println("Dao: selectCcIssStmtRe: re: 확인해보자 0"+re1);
		Receiption re0=sqlSession.selectOne("Vat.selectCcIssStmtRe0",map);
		System.out.println("Dao: selectCcIssStmtRe: re: 확인해보자 "+re0);
		if(re1 !=null) {
		reResult.add(re1);
		}else if(re0 !=null) {
		reResult.add(re0);
		}
		System.out.println("Dao: selectCcIssStmtRe: re: 확인해보자 2"+re);
		System.out.println("Dao: selectCcIssStmtRe: re1: "+re1);
		return reResult;
	}

	@Override
	public Receiption selectSumOfTaxInvPur(SqlSessionTemplate sqlSession, Receiption reTaxPur, Date eD) {
		// TODO Auto-generated method stub
		System.out.println("Dao: selectSumOfTaxInvPur: reTaxPur: "+reTaxPur);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("Receiption",reTaxPur);
		map.put("endDate",eD);
		
		Receiption re=sqlSession.selectOne("Vat.selectSumOfTaxInvPur",map);
		System.out.println("Dao: selectSumOfTaxInvPur: re: "+re);
		return re;
	}

	@Override
	public Receiption selectRe14(SqlSessionTemplate sqlSession, Receiption rePur14, Date eD) {
		// TODO Auto-generated method stub
		System.out.println("Dao: selectRe14: rePur14: "+rePur14);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("Receiption",rePur14);
		map.put("endDate",eD);
		Receiption re=sqlSession.selectOne("Vat.selectRe14",map);
		return re;
	}

	@Override
	public Company selectComTypeOfBizCode(SqlSessionTemplate sqlSession, Company com) {
		// TODO Auto-generated method stub
		System.out.println("comDao: "+com);
		com=sqlSession.selectOne("Vat.selectComTypeOfBizCode",com);
		System.out.println("com1: "+com);
		
		List<String> bizCode=sqlSession.selectList("Vat.selectBizCode");
		System.out.println("bizCode: "+bizCode);
		System.out.println("bizType=null1:"+ com);
		if(com==null) {
			//아무것도 안해도 됨
		}else {
			for(int i=0;i<bizCode.size(); i++) {
				String biz=bizCode.get(i);
				if(com.getBizType().equals(biz)) {
					com.setBizType(biz);
				}
			}
		}
		return com;
		
	}

	@Override
	public Receiption selectRe19(SqlSessionTemplate sqlSession, Receiption re19, Date eD) {
		// TODO Auto-generated method stub
		
		System.out.println("Dao: selectRe19: re19: "+re19);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("Receiption",re19);
		map.put("endDate",eD);
		Receiption re=sqlSession.selectOne("Vat.selectRe19",map);
		return re;
	}

	@Override
	public Deem selectDeem(SqlSessionTemplate sqlSession, Deem deem) {
		// TODO Auto-generated method stub
		System.out.println("Dao: selectDeem: deem: "+deem);
		Deem de=sqlSession.selectOne("Vat.selectDeem",deem);
		System.out.println("Dao: selectDeem: de: "+de);
		return de;
	}

	@Override
	public Receiption selectRe43(SqlSessionTemplate sqlSession, Receiption reDeem, Date eD) {
		// TODO Auto-generated method stub
		System.out.println("Dao: selectRe19: re19: "+reDeem);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("Receiption",reDeem);
		map.put("endDate",eD);
		Receiption re=sqlSession.selectOne("Vat.selectRe43",map);
		return re;
	}

	@Override
	public CcSalesSlip selectCcSalseSlip(SqlSessionTemplate sqlSession, CcSalesSlip css) {
		// TODO Auto-generated method stub
		
		CcSalesSlip css2=sqlSession.selectOne("Vat.selectCcSalesSlip",css);
		System.out.println("Dao: selectCcSalesSlip: css2: "+css2);
		
		return css2;
	}

	@Override
	public int insertVat(SqlSessionTemplate sqlSession, Vat vatRe) {
		// TODO Auto-generated method stub
		int vat2=sqlSession.insert("Vat.insertVat",vatRe);
		System.out.println("Dao: insertVat: vat2"+vat2);
		return vat2;
	}

	@Override
	public int updateVat(SqlSessionTemplate sqlSession, Vat vat) {
		// TODO Auto-generated method stub
		System.out.println("Dao: updateVat: "+vat);
		int vat2=sqlSession.update("Vat.updateDeadLine",vat);
		return vat2;
	}

	@Override
	public String selectVatCode(SqlSessionTemplate sqlSession, Vat vatRe) {
		// TODO Auto-generated method stub
		String vatCode=sqlSession.selectOne("Vat.selectVatCode",vatRe);
		System.out.println("Dao: selectVateCode: "+vatCode);
		return vatCode;
	}

	@Override
	public int updateDeadCenVat(SqlSessionTemplate sqlSession, Vat vat) {
		// TODO Auto-generated method stub
		int vat2=sqlSession.update("Vat.updateDeadCenVat",vat);
		return vat2;
	}

	@Override
	public Receiption selectRe1(SqlSessionTemplate sqlSession, Receiption sumRe, Date eD) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("Receiption",sumRe);
		map.put("endDate",eD);
		
		Receiption reP1=sqlSession.selectOne("Vat.selectRe1",map);
		return reP1;
	}

}
