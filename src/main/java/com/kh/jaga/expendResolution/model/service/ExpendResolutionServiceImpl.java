package com.kh.jaga.expendResolution.model.service;

import java.sql.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.expendResolution.model.dao.ExpendResolutionDao;
import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;

@Service
public class ExpendResolutionServiceImpl implements ExpendResolutionService{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	ExpendResolutionDao dao;
	
	@Override
	public int insertExpendResolution(ExpendResolutionDto dto) {

		System.out.println("지출결의서 인설트 서비스 진입");
		
		int result = dao.insertExpendResoltion(dto, sqlSession);
		System.out.println("지출결의서 서비스 > 쿼리문 실행결과 result ::: " + result);
		
		return result;
	}
	
	
}
