package com.kh.jaga.aggregateIncomeTax.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.aggregateIncomeTax.model.dao.AggregateDao;
import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.AggregateCalculatedDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.AmountDataDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.DeductStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.IncomeAmountStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.vo.BizCodeVo;
import com.kh.jaga.finStmt.model.vo.IncomeStmt;

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

	@Override
	public AmountDataDto getData40(Map<String, String> info) {
		
		AmountDataDto is = dao.selectData40(sqlSession, info);
		
		return is;
	}

	@Override
	public int insertIncomeAmount(IncomeAmountStmtDto dto) {
		
		int result = dao.insertIncomeAmount(sqlSession, dto);
		
		return result;
	}

	@Override
	public AggregateCalculatedDto selectAggregateCalculated(Map<String, String> map) {
		
		AggregateCalculatedDto dto = dao.selectAggregateCalculated(sqlSession, map);
		
		return dto;
	}

	@Override
	public AggregateCalculatedDto selectExistingData(HashMap<String, String> map) {
		
		AggregateCalculatedDto dto = dao.selectExistingData(sqlSession, map);
		
		return dto;
	}

	@Override
	public int insertDeduct(DeductStmtDto dto) {
		
		int result = dao.insertDeductOk(sqlSession, dto);
		
		return result;
	}
	
}
