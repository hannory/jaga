package com.kh.jaga.vat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.vat.model.vo.Vat;


@Repository
public class VatDaoImpl implements VatDao{


	@Override
	public Vat selectVat(SqlSessionTemplate sqlSession, Vat vat) {
		System.out.println("Dao: selectVat: vat: "+vat);
		Vat vat2=sqlSession.selectOne("Vat.selectVat",vat);
		System.out.println("Dao: selectVat: vat: "+vat2);
		
		return vat2;
	}

}
