package com.kh.jaga.slip.model.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.slip.model.vo.Journalize;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Receiption2;

@Repository
public class TransectionHistoryDaoImpl implements TransectionHistoryDao{
	

	@Override
	public List<Receiption> selectTListAll(SqlSessionTemplate sqlSession) {
		List<Receiption> list = sqlSession.selectList("TransectionHistory.selectTListAll");
		
		return list;
	}

	@Override
	public List<Receiption2> selectDateList(SqlSessionTemplate sqlSession, HashMap<String, Date> hm) {
		List<Receiption2> list = sqlSession.selectList("TransectionHistory.selectDateList", hm);
		
		
		return list;
	}

	@Override
	public List<Journalize> selectDetailJournal(SqlSessionTemplate sqlSession, String slipCode) {
		List<Journalize> list = sqlSession.selectList("TransectionHistory.selectDetailJournal", slipCode);
		
		return list;
	}

}
