package com.kh.jaga.finStmt.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.jaga.finStmt.model.vo.IncomeStmt;
import com.kh.jaga.finStmt.model.vo.IncomeStmtAccount;

@Repository
public class FinStmtDaoImpl implements FinStmtDao {

	@Override
	public int insertIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt i) {
		
		return sqlSession.insert("FinStmt.insertIncomeStmt", i);
	}

//	@Override
//	public HashMap selectIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmtAccount isa) {
//		//당기 
//		List cList = new ArrayList();
//		cList = sqlSession.selectList("FinStmt.selectCurFinStmt", isa);		
//		
//		int cSum14600 = 0;		//당기상품매입액
//		int cSum40100 = 0;		//상품매출
//		int cSum81100 = 0;		//복리후생비
//		int cSum83000 = 0;		//소모품비
//		
//		for(int i = 0; i < cList.size(); i++) {
//			int accountCode = ((IncomeStmtAccount) cList.get(i)).getAccountCode();
//			int price = ((IncomeStmtAccount) cList.get(i)).getPrice();
//			
//			if(accountCode == 14600) {
//				cSum14600 += ((IncomeStmtAccount) cList.get(i)).getPrice();
//			} else if(((IncomeStmtAccount) cList.get(i)).getAccountCode() == 40100) {
//				cSum40100 += ((IncomeStmtAccount) cList.get(i)).getPrice();
//			} else if(((IncomeStmtAccount) cList.get(i)).getAccountCode() == 81100) {
//				cSum81100 += ((IncomeStmtAccount) cList.get(i)).getPrice();
//			} else if(((IncomeStmtAccount) cList.get(i)).getAccountCode() == 83000) {
//				cSum83000 += ((IncomeStmtAccount) cList.get(i)).getPrice();
//			}
//		}
//		
//		//전기
//		List pList = new ArrayList();
//		pList = sqlSession.selectList("FinStmt.selectPastFinStmt", isa);
//		
//		int pSum14600 = 0;		//당기상품매입액
//		int pSum40100 = 0;		//상품매출
//		int pSum81100 = 0;		//복리후생비
//		int pSum83000 = 0;		//소모품비
//		
//		for(int i = 0; i < pList.size(); i++) {
//			int accountCode = ((IncomeStmtAccount) pList.get(i)).getAccountCode();
//			int price = ((IncomeStmtAccount) pList.get(i)).getPrice();
//			
//			if(accountCode == 14600) {
//				pSum14600 += price;
//			} else if(accountCode == 40100) {
//				pSum40100 += price;
//			} else if(accountCode == 81100) {
//				pSum81100 += price;
//			} else if(accountCode == 83000) {
//				pSum83000 += price;
//			}
//		}
//		
//		HashMap hmap = new HashMap();
//		hmap.put("c14600", cSum14600);
//		hmap.put("c40100", cSum40100);
//		hmap.put("c81100", cSum81100);
//		hmap.put("c83000", cSum83000);
//		
//		hmap.put("p14600", pSum14600);
//		hmap.put("p40100", pSum40100);
//		hmap.put("p81100", pSum81100);
//		hmap.put("p83000", pSum83000);
//		
//		return hmap;
//	}
	
	

	@Override
	public ArrayList selectSlip(SqlSessionTemplate sqlSession, IncomeStmtAccount isa) {
		
		ArrayList list = (ArrayList) sqlSession.selectList("FinStmt.selectSlip", isa);
		
		//System.out.println("slip list : " + list);
		
		return list;
	}

//	@Override
//	public HashMap selectMfrgCostStmt(SqlSessionTemplate sqlSession, IncomeStmtAccount isa) {
//		//당기
//		List cList = new ArrayList();
//		cList = sqlSession.selectList("FinStmt.selectCurFinStmt", isa);
//		
//		int cSum15300 = 0;		//원재료
//		int cSum51100 = 0;		//복리후생비
//		
//		for(int i = 0; i < cList.size(); i++) {
//			int accountCode = ((IncomeStmtAccount) cList.get(i)).getAccountCode();
//			int price = ((IncomeStmtAccount) cList.get(i)).getPrice();
//			
//			if(accountCode == 15300) {
//				cSum15300 += price;
//			} else if(accountCode == 51100) {
//				cSum51100 += price;
//			}
//		}
//		
//		//전기
//		List pList = new ArrayList();
//		pList = sqlSession.selectList("FinStmt.selectPastFinStmt", isa);
//		
//		int pSum15300 = 0;		//원재료
//		int pSum51100 = 0;		//복리후생비
//		
//		for(int i = 0; i < pList.size(); i++) {
//			int accountCode = ((IncomeStmtAccount) pList.get(i)).getAccountCode();
//			int price = ((IncomeStmtAccount) pList.get(i)).getPrice();
//			
//			if(accountCode == 15300) {
//				pSum15300 += price;
//			} else if(accountCode == 51100) {
//				pSum51100 += price;
//			}
//		}
//		
//		HashMap hmap = new HashMap();
//		hmap.put("c15300", cSum15300);
//		hmap.put("c51100", cSum51100);
//		
//		hmap.put("p15300", pSum15300);
//		hmap.put("p51100", pSum51100);
//		
//		return hmap;
//	}

	@Override
	public List selectCurFinStmt(SqlSessionTemplate sqlSession, IncomeStmtAccount isa) {

		return sqlSession.selectList("FinStmt.selectCurFinStmt", isa);	
	}

	@Override
	public List selectPastFinStmt(SqlSessionTemplate sqlSession, IncomeStmtAccount isa) {

		return sqlSession.selectList("FinStmt.selectPastFinStmt", isa);
	}

}








