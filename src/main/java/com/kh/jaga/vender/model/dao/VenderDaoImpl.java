package com.kh.jaga.vender.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.vender.model.vo.Vender;

public class VenderDaoImpl implements VenderDao{

	@Override
	public int insertVender(SqlSessionTemplate sqlSession, Vender v) {

		return sqlSession.insert("Company.insertVender",v);
	}

}
