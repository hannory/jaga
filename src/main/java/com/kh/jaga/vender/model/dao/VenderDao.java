package com.kh.jaga.vender.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.vender.model.vo.Vender;

public interface VenderDao {

	int insertVender(SqlSessionTemplate sqlSession, Vender v);

}
