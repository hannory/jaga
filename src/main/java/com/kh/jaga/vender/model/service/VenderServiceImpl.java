package com.kh.jaga.vender.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.vender.model.dao.VenderDao;
import com.kh.jaga.vender.model.vo.Vender;

@Service
public class VenderServiceImpl implements VenderService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private VenderDao vd;
	
	@Override
	public int insertVender(Vender v) {
		
		return vd.insertVender(sqlSession,v);
	}

}
