package com.kh.jaga.vender.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.vender.model.vo.Vender;
@Repository
public class VenderDaoImpl implements VenderDao{

	@Override
	public int insertVender(SqlSessionTemplate sqlSession, Vender v) {

		return sqlSession.insert("Vender.insertVender",v);
	}
  
}
