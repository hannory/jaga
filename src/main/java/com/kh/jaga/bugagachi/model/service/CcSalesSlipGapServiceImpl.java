package com.kh.jaga.bugagachi.model.service;

import java.sql.Date;
import java.util.ArrayList;
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
		
		List<CcSalesSlipDetail> cssg2=new ArrayList<CcSalesSlipDetail>();
		System.out.println("service: selectCssg: cssg "+cssg);
		cssg2=cd.selectCssg(sqlSession,cssg);
		System.out.println("service: selectCssg: cssg2 "+cssg2);
		return cssg2;
	}

	//신용카드 등 수령명세서 테이블에 값없었으면 전표테이블에서 전표들 불러오기


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
		
		List<TnxHis> th=new ArrayList<TnxHis>();
		System.out.println("Service: selectTnxHis: csssg "+cssg);
		th=cd.selectTnxHis(sqlSession,cssg);
		System.out.println("Service: selectTnxHis: th "+th);
		return th;
	}

	@Override
	public String selectCssgPk(CcSalesSlipGap cssg) throws Exception {
		// TODO 커발pk가지고 오기
		System.out.println("Service: selectCssgPk: cssg "+cssg);
		
		return cd.selectCssgPk(sqlSession,cssg);
	}

	@Override
	public int updateCcSalesSlipGap(CcSalesSlipGap cssg) {
		// TODO Auto-generated method stub
		return cd.updateCcSalesSlipGap(sqlSession,cssg);
	}

	@Override
	public List<TnxHis> selectNewRecei(Receiption re,Date eD) {
		// TODO 전표계산하러가기RE
		
		System.out.println("Service: selectNewRecei: re"+re);
		return cd.selectNewRecei(sqlSession,re,eD);
	}

	@Override
	public int insertCssg(CcSalesSlipGap cssg) {
		// TODO Auto-generated method stub
		
		//cssg부터 인설트하고 pk받아오기
		System.out.println("Service: cssg부터 인설트하고 pk받아오기");
		int insertCssg=cd.insertCssg(sqlSession,cssg);
		System.out.println("Service: cssg부터 인설트결과: "+insertCssg);
		
		return insertCssg;
	}

	@Override
	public String selectCssgPk2(CcSalesSlipGap cssg) throws Exception {
		// TODO 커발받기
		return cd.selectCssgPk2(sqlSession,cssg);
	}

	@Override
	public int insertCssgDetail(List<CcSalesSlipDetail> cgDetailList,String pk) {
		// TODO cgDetail insert하기
		return cd.insertCssgDetail(sqlSession,cgDetailList,pk);
	}

	@Override
	public int insertCssgHis(List<TnxHis> cssgHisList, String pk) {
		// TODO cgHis insert하기
		return cd.insertCssgHis(sqlSession,cssgHisList,pk);
	}

	@Override
	public int updateCcSalesSlipGapDead(CcSalesSlipGap cssg) {
		// TODO Auto-generated method stub
		return cd.updateCcSalesSlipGapDead(sqlSession,cssg);
	}

	@Override
	public List<Receiption> selectReceiCssg(CcSalesSlipGap cssg) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
