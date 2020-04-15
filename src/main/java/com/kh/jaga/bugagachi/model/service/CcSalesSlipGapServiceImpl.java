package com.kh.jaga.bugagachi.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.bugagachi.model.dao.CcSalesSlipGapDao;
import com.kh.jaga.bugagachi.model.vo.CcSalesSlipGap;

@Service
public class CcSalesSlipGapServiceImpl implements CcSalesSlipGapService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CcSalesSlipGapDao cd;
	
	//신용카드 등 수령명세서 id받아오기
	@Override
	public List<CcSalesSlipGap> selectCssg(CcSalesSlipGap cssg) {
		
		List<CcSalesSlipGap> cssg2=null;
		cssg2=cd.selectCssg(sqlSession,cssg);
		return cssg2;
	}

}
