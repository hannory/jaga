package com.kh.jaga.vender.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.vender.model.vo.Vender;

public interface VenderDao {

	int insertVender(SqlSessionTemplate sqlSession, Vender v);

	List<Vender> selectVender(String comCode,SqlSessionTemplate sqlSession);


	List<Vender> selectOne(String venderCode, SqlSessionTemplate sqlSession);

	int modifyOne(SqlSessionTemplate sqlSession, Vender v);

	List<Vender> selectBankList(SqlSessionTemplate sqlSession);



}
