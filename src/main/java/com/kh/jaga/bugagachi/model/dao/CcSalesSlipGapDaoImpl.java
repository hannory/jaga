package com.kh.jaga.bugagachi.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.bugagachi.model.vo.CcSalesSlipGap;

@Repository
public class CcSalesSlipGapDaoImpl implements CcSalesSlipGapDao{

	@Override
	public List<CcSalesSlipGap> selectCssg(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg) {
		List<CcSalesSlipGap> cssg2=sqlSession.selectList("CcSalesSlipGap.selectCcSalesSlipGap", cssg);
		System.out.println("출력후 작업 CcSalesSlipGapDaoImpl: "+cssg2);
		System.err.println(cssg.getTermDiv());
		System.err.println(cssg.getYearOfAttr());
		System.out.println("값:"+cssg);
		System.out.println("출력후 작업 CcSalesSlipGapDaoImpl: "+cssg2);
		return cssg2;
	}

}
