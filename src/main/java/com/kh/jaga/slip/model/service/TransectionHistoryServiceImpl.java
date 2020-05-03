package com.kh.jaga.slip.model.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.jaga.slip.model.dao.TransectionHistoryDao;
import com.kh.jaga.slip.model.vo.Journalize;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Receiption2;

@Controller
public class TransectionHistoryServiceImpl implements TransectionHistoryService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private TransectionHistoryDao thd;

	@Override
	public List<Receiption> selectTListAll(String comCode) {
		
		return thd.selectTListAll(sqlSession, comCode);
	}

	@Override
	public List<Receiption2> selectDateList(HashMap<String, Object> hm) {
		return thd.selectDateList(sqlSession, hm);
	}

	@Override
	public List<Journalize> selectDetailJournal(String slipCode) {
		return thd.selectDetailJournal(sqlSession, slipCode);
	}


	
}
