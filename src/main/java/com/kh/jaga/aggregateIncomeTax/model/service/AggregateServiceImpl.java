package com.kh.jaga.aggregateIncomeTax.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.aggregateIncomeTax.model.dao.AggregateDao;
import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.vo.BizCodeVo;

@Service
public class AggregateServiceImpl implements AggregateService{
	
	@Autowired
	AggregateDao dao;
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertAddedTaxStmt(AddedTaxStmtDto dto) {

		int result = dao.insertAddedTaxStmt(sqlSession, dto);
		
		return result;
	}

	@Override
	public List<BizCodeVo> selectBizCodeList() {
		
		List<BizCodeVo> list = dao.selectBizCodeList(sqlSession); 
		
		return list;
	}
	
}
