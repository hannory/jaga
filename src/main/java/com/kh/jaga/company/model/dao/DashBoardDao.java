package com.kh.jaga.company.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.accountBook.model.vo.GenderLedgerDTO;
import com.kh.jaga.company.model.vo.DashBoard;

public interface DashBoardDao {

	DashBoard selectProfit(SqlSessionTemplate sqlSession, String comCode);

	List<DashBoard> selectCreditS(SqlSessionTemplate sqlSession, String comCode);

	List<DashBoard> selectCreditB(SqlSessionTemplate sqlSession, String comCode);

	List<GenderLedgerDTO> selectChart1(SqlSessionTemplate sqlSession, String comCode);



}
