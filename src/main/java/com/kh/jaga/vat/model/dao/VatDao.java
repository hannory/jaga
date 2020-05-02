package com.kh.jaga.vat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.vat.model.vo.Vat;

@Repository
public interface VatDao {

	Vat selectVat(SqlSessionTemplate sqlSession, Vat vat);


}
