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
import com.kh.jaga.finStmt.model.vo.FinStmtAccount;
import com.kh.jaga.finStmt.model.vo.MfrgStmt;

@Repository
public class FinStmtDaoImpl implements FinStmtDao {

	@Override
	public int insertIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt i) {
		
		return sqlSession.insert("FinStmt.insertIncomeStmt", i);
	}

	@Override
	public ArrayList selectSlip(SqlSessionTemplate sqlSession, FinStmtAccount fsa) {
		
		ArrayList list = (ArrayList) sqlSession.selectList("FinStmt.selectSlip", fsa);
		
		return list;
	}
	
	@Override
	public ArrayList selectSlipByDate(SqlSessionTemplate sqlSession, FinStmtAccount fsa) {

		return (ArrayList) sqlSession.selectList("FinStmt.selectSlipByDate", fsa);
	}
	
	@Override
	public ArrayList<FinStmtAccount> selectSlipByDateWithArr(SqlSessionTemplate sqlSession, FinStmtAccount fsa) {
		
		return (ArrayList) sqlSession.selectList("FinStmt.selectSlipByDateWithArr", fsa);
	}

	@Override
	public List selectCurFinStmt(SqlSessionTemplate sqlSession, FinStmtAccount fsa) {

		return sqlSession.selectList("FinStmt.selectCurFinStmt", fsa);	
	}

	@Override
	public List<FinStmtAccount> selectCurFinStmtByDate(SqlSessionTemplate sqlSession, FinStmtAccount fsa) {
		
		return sqlSession.selectList("FinStmt.selectCurFinStmtByDate", fsa);
	}

	@Override
	public List selectPastFinStmt(SqlSessionTemplate sqlSession, FinStmtAccount fsa) {

		return sqlSession.selectList("FinStmt.selectPastFinStmt", fsa);
	}
	
	@Override
	public List selectPastFinStmtByDate(SqlSessionTemplate sqlSession, FinStmtAccount fsa) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("FinStmt.selectPastFinStmtByDate", fsa);
	}

	@Override
	public int insertMfrgStmt(SqlSessionTemplate sqlSession, MfrgStmt ms) {

		return sqlSession.insert("FinStmt.insertMfrgStmt", ms);
	}

	@Override
	public int countMfrgStmt(SqlSessionTemplate sqlSession, MfrgStmt ms) {
		
		System.out.println("ms dao : " + ms);
		
		return sqlSession.selectOne("FinStmt.countMfrgStmt", ms);
	}

	
	@Override
	public int countSavedMfrgStmt(SqlSessionTemplate sqlSession, MfrgStmt ms) {
		
		return sqlSession.selectOne("FinStmt.countSavedMfrgStmt", ms);
	}

	@Override
	public int updateMfrgStmt(SqlSessionTemplate sqlSession, MfrgStmt ms) {
		
		return sqlSession.update("FinStmt.updateMfrgStmt", ms);
	}

	@Override
	public MfrgStmt searchMfrg(SqlSessionTemplate sqlSession, MfrgStmt ms) {
		
		return sqlSession.selectOne("FinStmt.searchMfrg", ms);
	}

	@Override
	public int selectMfrgSum90(SqlSessionTemplate sqlSession, FinStmtAccount fsa) {

		if(sqlSession.selectOne("FinStmt.selectMfrgSum90", fsa) != null) {
			return sqlSession.selectOne("FinStmt.selectMfrgSum90", fsa);
		} else {
			return 0;
		}
		
	}

	@Override
	public int countClosedMfrg(SqlSessionTemplate sqlSession, MfrgStmt ms) {

		return sqlSession.selectOne("FinStmt.countClosedMfrg", ms);
	}

	@Override
	public int countIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt is) {

		return sqlSession.selectOne("FinStmt.countIncomeStmt", is);
	}

	@Override
	public IncomeStmt searchIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt is) {
		
		return sqlSession.selectOne("FinStmt.searchIncomeStmt", is);
	}

	@Override
	public int countSavedIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt is) {

		return sqlSession.selectOne("FinStmt.countSavedIncomeStmt", is);
	}

	@Override
	public int updateIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt is) {
		
		return sqlSession.update("FinStmt.updateIncomeStmt", is);
	}

	@Override
	public int countClosedIncometStmt(SqlSessionTemplate sqlSession, IncomeStmt is) {

		return sqlSession.selectOne("FinStmt.countClosedIncomeStmt", is);
	}

	@Override
	public int updateLastIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt is) {

		return sqlSession.update("FinStmt.updateLastIncomeStmt", is);
	}

	@Override
	public int insertLastIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt is) {

		return sqlSession.update("FinStmt.insertLastIncomeStmt", is);
	}


}








