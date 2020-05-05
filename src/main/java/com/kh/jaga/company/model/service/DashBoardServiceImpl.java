package com.kh.jaga.company.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.accountBook.model.vo.GenderLedgerDTO;
import com.kh.jaga.company.model.dao.DashBoardDao;
import com.kh.jaga.company.model.vo.DashBoard;

@Service
public class DashBoardServiceImpl implements DashBoardService{
	@Autowired
	private DashBoardDao dbd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public HashMap<String, Object> selectDashBoard(String comCode) {
		DashBoard db = dbd.selectProfit(sqlSession, comCode);
				
		List<DashBoard> creditS = dbd.selectCreditS(sqlSession, comCode);
		
		List<DashBoard> creditB = dbd.selectCreditB(sqlSession, comCode);
		
		List<GenderLedgerDTO> chart1 = dbd.selectChart1(sqlSession, comCode);
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		
		
		hm.put("profit", db);
		hm.put("creditS", creditS);
		hm.put("creditB", creditB);
		hm.put("chart1", chart1);
		
		return hm;
	}


	
	
	
}
