package com.kh.jaga.vat.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.vat.model.dao.VatDao;
import com.kh.jaga.vat.model.vo.Vat;

@Service
public class VatServiceImpl implements VatService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private VatDao vd;
	
	@Override
	public Vat selectVat(Vat vat) {
		System.out.println("Service: selectVat: vat: "+vat );
		Vat vat2=vd.selectVat(sqlSession,vat);
		return vat2;
	}

}
