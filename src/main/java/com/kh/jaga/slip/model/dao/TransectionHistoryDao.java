package com.kh.jaga.slip.model.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.slip.model.vo.Journalize;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Receiption2;

public interface TransectionHistoryDao {

	List<Receiption> selectTListAll(SqlSessionTemplate sqlSession);

	List<Receiption2> selectDateList(SqlSessionTemplate sqlSession, HashMap<String, Date> hm);

	List<Journalize> selectDetailJournal(SqlSessionTemplate sqlSession, String slipCode);

}
