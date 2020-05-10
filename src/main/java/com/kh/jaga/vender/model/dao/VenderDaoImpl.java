package com.kh.jaga.vender.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.vender.model.vo.Vender;
@Repository
public class VenderDaoImpl implements VenderDao{

	@Override
	public int insertVender(SqlSessionTemplate sqlSession, Vender v) {

		return sqlSession.insert("Vender.insertVender",v);
	}

	@Override
	public List<Vender> selectVender(String comCode,SqlSessionTemplate sqlSession) {
		List<Vender> list = sqlSession.selectList("Vender.selectVenderList",comCode);
		System.out.println(list+"dao리스트다.");
		return list;
	}

	@Override
	public List<Vender> selectOne(String venderCode, SqlSessionTemplate sqlSession) {
		List<Vender> list = sqlSession.selectList("Vender.selectOne",venderCode);
		
		return list;
	}

	@Override
	public int modifyOne(SqlSessionTemplate sqlSession, Vender v) {
		
		return sqlSession.update("Vender.modifyOne",v);
	}

	@Override
	public List<Vender> selectBankList(SqlSessionTemplate sqlSession) {
		List<Vender> list = sqlSession.selectList("Vender.selectBankList");
		System.out.println("DAO은행코드는요"+list);
		return list;
	}


  
}
