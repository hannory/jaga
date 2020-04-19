package com.kh.jaga.expendResolution.model.dao;

import java.sql.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;

@Repository
public class ExpendResolutionDaoImpl implements ExpendResolutionDao{

	@Override
	public int insertExpendResoltion(ExpendResolutionDto dto, SqlSessionTemplate sqlSession) {
		System.out.println("지출결의서 dao 진입");
		System.out.println("DAO > 받아온 데이터 (dto): " + dto);
		
		String date = sqlSession.selectOne("ExpendResolution.selectTest");
		System.out.println("!!!!!!!!!! sql date ? " + date);
		
		return sqlSession.insert("ExpendResolution.insertExpendResolution", dto);
	}

}
