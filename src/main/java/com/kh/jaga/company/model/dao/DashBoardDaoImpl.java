package com.kh.jaga.company.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.accountBook.model.vo.GenderLedgerDTO;
import com.kh.jaga.company.model.vo.DashBoard;

@Repository
public class DashBoardDaoImpl implements DashBoardDao{

	@Override
	public DashBoard selectProfit(SqlSessionTemplate sqlSession, String comCode) {
		DashBoard db = sqlSession.selectOne("DashBoard.selectProfit", comCode);
		
		return db;
	}

	@Override
	public List<DashBoard> selectCreditS(SqlSessionTemplate sqlSession, String comCode) {
		List<DashBoard> list = sqlSession.selectList("DashBoard.selectCreditS", comCode);
		
		return list;
	}

	@Override
	public List<DashBoard> selectCreditB(SqlSessionTemplate sqlSession, String comCode) {
		List<DashBoard> list = sqlSession.selectList("DashBoard.selectCreditB", comCode);
		
		return list;
	}

	@Override
	public List<GenderLedgerDTO> selectChart1(SqlSessionTemplate sqlSession, String comCode) {
		List<GenderLedgerDTO> chart1 = sqlSession.selectList("DashBoard.selectChart1", comCode);
		
		return chart1;
	}



}
