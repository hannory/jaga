package com.kh.jaga.finStmt.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.finStmt.model.dao.FinStmtDao;
import com.kh.jaga.finStmt.model.dao.FinStmtDaoImpl;
import com.kh.jaga.finStmt.model.vo.IncomeStmt;
import com.kh.jaga.finStmt.model.vo.IncomeStmtAccount;
import com.kh.jaga.finStmt.model.vo.MfrgStmt;

@Service
public class FinStmtServiceImpl implements FinStmtService {
	@Autowired
	private FinStmtDao fsd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertIncomeStmt(IncomeStmt i) {
		
		return fsd.insertIncomeStmt(sqlSession, i);
	}

//	@Override
//	public HashMap selectIncomeStmt(IncomeStmtAccount isa) {
//
//		return fsd.selectIncomeStmt(sqlSession, isa);
//	}
	
	@Override
	public HashMap selectIncomeStmt(IncomeStmtAccount isa) {
		//당기
		List cList = fsd.selectCurFinStmt(sqlSession, isa);
		
		int cSum14600 = 0;		//당기상품매입액
		int cSum40100 = 0;		//상품매출
		int cSum81100 = 0;		//복리후생비
		int cSum83000 = 0;		//소모품비
		int cSum83100 = 0;		//수수료비용
		
		for(int i = 0; i < cList.size(); i++) {
			int accountCode = ((IncomeStmtAccount) cList.get(i)).getAccountCode();
			int price = ((IncomeStmtAccount) cList.get(i)).getPrice();
			
			if(accountCode == 14600) {
				cSum14600 += price;
			} else if(accountCode == 40100) {
				cSum40100 += price;
			} else if(accountCode == 81100) {
				cSum81100 += price;
			} else if(accountCode == 83000) {
				cSum83000 += price;
			} else if(accountCode == 83100) {
				cSum83100 += price;
			}
		}
		
		//전기
		List pList = fsd.selectPastFinStmt(sqlSession, isa);
		
		int pSum14600 = 0;		//당기상품매입액
		int pSum40100 = 0;		//상품매출
		int pSum81100 = 0;		//복리후생비
		int pSum83000 = 0;		//소모품비
		int pSum83100 = 0;		//수수료비용
		
		for(int i = 0; i < pList.size(); i++) {
			int accountCode = ((IncomeStmtAccount) pList.get(i)).getAccountCode();
			int price = ((IncomeStmtAccount) pList.get(i)).getPrice();
			
			if(accountCode == 14600) {
				pSum14600 += price;
			} else if(accountCode == 40100) {
				pSum40100 += price;
			} else if(accountCode == 81100) {
				pSum81100 += price;
			} else if(accountCode == 83000) {
				pSum83000 += price;
			} else if(accountCode == 83100) {
				pSum83100 += price;
			}
		}
		
		HashMap hmap = new HashMap();
		hmap.put("c14600", cSum14600);
		hmap.put("c40100", cSum40100);
		hmap.put("c81100", cSum81100);
		hmap.put("c83000", cSum83000);
		hmap.put("c83100", cSum83100);
		
		hmap.put("p14600", pSum14600);
		hmap.put("p40100", pSum40100);
		hmap.put("p81100", pSum81100);
		hmap.put("p83000", pSum83000);
		hmap.put("p83100", pSum83100);
		
		return hmap;
	}

	@Override
	public ArrayList<IncomeStmtAccount> selectSlip(IncomeStmtAccount isa) {

		ArrayList list = fsd.selectSlip(sqlSession, isa);
		
		return list;
	}

	@Override
	public HashMap selectMfrgStmt(IncomeStmtAccount isa) {
		//당기
		List cList = fsd.selectCurFinStmt(sqlSession, isa);
		
		int cSum15300 = 0;		//원재료
		int cSum51100 = 0;		//복리후생비
		
		for(int i = 0; i < cList.size(); i++) {
			int accountCode = ((IncomeStmtAccount) cList.get(i)).getAccountCode();
			int price = ((IncomeStmtAccount) cList.get(i)).getPrice();
			
			if(accountCode == 15300) {
				cSum15300 += price;
			} else if(accountCode == 51100) {
				cSum51100 += price;
			}
		}
		
		//전기
		List pList = fsd.selectPastFinStmt(sqlSession, isa);
		
		int pSum15300 = 0;		//원재료
		int pSum51100 = 0;		//복리후생비
		
		for(int i = 0; i < pList.size(); i++) {
			int accountCode = ((IncomeStmtAccount) pList.get(i)).getAccountCode();
			int price = ((IncomeStmtAccount) pList.get(i)).getPrice();
			
			if(accountCode == 15300) {
				pSum15300 += price;
			} else if(accountCode == 51100) {
				pSum51100 += price;
			}
		}
		
		HashMap hmap = new HashMap();
		hmap.put("c15300", cSum15300);
		hmap.put("c51100", cSum51100);
		
		hmap.put("p15300", pSum15300);
		hmap.put("p51100", pSum51100);
		
		return hmap;
	}

	@Override
	public int insertMfrgStmt(MfrgStmt ms) {
		
		//selectMfrgStmt하여 result 값이 1이면 update, 0이면 insert
		
		//int selectResult = fsd.selectMfrgStmt(sqlSession, ms);
		
		return fsd.insertMfrgStmt(sqlSession, ms);
	}

}






