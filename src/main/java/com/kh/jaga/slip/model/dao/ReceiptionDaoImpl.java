package com.kh.jaga.slip.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.slip.model.vo.Vender;

@Repository
public class ReceiptionDaoImpl implements ReceiptionDao {

	@Override
	public List<Vender> selectVenderList(SqlSessionTemplate sqlSession) {
		List<Vender> list = sqlSession.selectList("Receiption.selectVenderList");
		
		System.out.println(list);
		
		return null;
	}
	
}
