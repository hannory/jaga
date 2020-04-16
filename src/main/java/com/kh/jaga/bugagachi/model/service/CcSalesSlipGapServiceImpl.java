package com.kh.jaga.bugagachi.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.bugagachi.model.dao.CcSalesSlipGapDao;
import com.kh.jaga.bugagachi.model.vo.CcSalesSlipGap;
import com.kh.jaga.slip.model.vo.Receiption;

@Service
public class CcSalesSlipGapServiceImpl implements CcSalesSlipGapService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CcSalesSlipGapDao cd;
	
	//신용카드 등 수령명세서 테이블에 값있었으면 불러오기
	@Override 
	public List<CcSalesSlipGap> selectCssg(CcSalesSlipGap cssg) {
		
		List<CcSalesSlipGap> cssg2=null;
		cssg2=cd.selectCssg(sqlSession,cssg);
		return cssg2;
	}

	//신용카드 등 수령명세서 테이블에 값없었으면 전표테이블에서 전표들 불러오기
	@Override
	public List<Receiption> selectReceiCssg(CcSalesSlipGap cssg) {
		
		//List<Receiption> re=cd.selectReceiCssg(sqlSession,)
		
		
		
		return null;
	}

}
