package com.kh.jaga.bugagachi.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.bugagachi.model.dao.CcSalesSlipGapDao;
import com.kh.jaga.bugagachi.model.vo.CcSalesSlipDetail;
import com.kh.jaga.bugagachi.model.vo.CcSalesSlipGap;
import com.kh.jaga.bugagachi.model.vo.TnxHis;
import com.kh.jaga.slip.model.vo.Receiption;

@Service
public class CcSalesSlipGapServiceImpl implements CcSalesSlipGapService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CcSalesSlipGapDao cd;
	
	//신용카드 등 수령명세서 테이블에 값있었으면 불러오기
	@Override 
	public List<CcSalesSlipDetail> selectCssg(CcSalesSlipGap cssg) {
		
		List<CcSalesSlipDetail> cssg2=null;
		System.out.println("service: selectCssg: cssg "+cssg);
		cssg2=cd.selectCssg(sqlSession,cssg);
		System.out.println("service: selectCssg: cssg2 "+cssg2);
		return cssg2;
	}

	//신용카드 등 수령명세서 테이블에 값없었으면 전표테이블에서 전표들 불러오기
	@Override
	public List<Receiption> selectReceiCssg(CcSalesSlipGap cssg) {
		
		//List<Receiption> re=cd.selectReceiCssg(sqlSession,)
		
		
		
		return null;
	}

	@Override
	public CcSalesSlipGap selectCcGap(CcSalesSlipGap cssg) {
		// TODO main cssg가 있는 지확인
		
		cssg=cd.selectCcGap(sqlSession, cssg);
		
		System.out.println("service:selectCcGap: ccGap: "+cssg);
		
		return cssg;
	}

	@Override
	public List<TnxHis> selectTnxHis(CcSalesSlipGap cssg) {
		// TODO tnxhis에서 상세 거래내역 찾아보기
		
		List<TnxHis> th=null;
		System.out.println("DAO: selectTnxHis: csssg "+cssg);
		th=cd.selectTnxHis(sqlSession,cssg);
		System.out.println("DAO: selectTnxHis: th "+th);
		return th;
	}

	@Override
	public String selectCssgPk(CcSalesSlipGap cssg) {
		// TODO 커발pk가지고 오기
		System.out.println("Service: selectCssgPk: cssg "+cssg);
		
		return cd.selectCssgPk(sqlSession,cssg);
	}

	@Override
	public int updateCcSalesSlipGap(CcSalesSlipGap cssg) {
		// TODO Auto-generated method stub
		return cd.updateCcSalesSlipGap(sqlSession,cssg);
	}

}
