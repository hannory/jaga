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
		
		int updateResult = dao.updateAddedTaxStmt(sqlSession, dto);
		System.out.println("updateResult ::: " + updateResult);
		int insertResult = 99;
		if(updateResult == 0) {
			System.out.println("if 문 진입,, ");
			insertResult = dao.insertAddedTaxStmt(sqlSession, dto);
			System.out.println("insertResult ::: " + insertResult);
			return insertResult;
		}
		return updateResult;
	}

	@Override
	public List<BizCodeVo> selectBizCodeList() {
		
		List<BizCodeVo> list = dao.selectBizCodeList(sqlSession);
		
		return list;
	}
	
}
