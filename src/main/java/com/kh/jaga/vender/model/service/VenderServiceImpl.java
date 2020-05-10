package com.kh.jaga.vender.model.service;

import java.util.List;

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

	@Override
	public List<Vender> selectVender(String comCode) {
		List<Vender> list = vd.selectVender(comCode,sqlSession);
		
		return list;
	}

	@Override
	public List<Vender> selectOne(String venderCode) {
		List<Vender> list = vd.selectOne(venderCode,sqlSession);
		return list;
	}

	@Override
	public int modifyOne(Vender v) {

		return vd.modifyOne(sqlSession,v);
	}

	@Override
	public List<Vender> selectBankList() {

		List<Vender> list =null;
		
		list = vd.selectBankList(sqlSession);
		
		/*
		 * if(list ==null) {
		 * 
		 * }
		 */
		return list;
	}



}
