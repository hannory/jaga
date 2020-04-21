package com.kh.jaga.bugagachi.model.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.bugagachi.model.vo.CcSalesSlipDetail;
import com.kh.jaga.bugagachi.model.vo.CcSalesSlipGap;
import com.kh.jaga.bugagachi.model.vo.TnxHis;
import com.kh.jaga.slip.model.vo.Receiption;

@Repository
public class CcSalesSlipGapDaoImpl implements CcSalesSlipGapDao{

	@Override  
	public List<CcSalesSlipDetail> selectCssg(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg) {
		List<CcSalesSlipDetail> cssg2=sqlSession.selectList("CcSalesSlipGap.selectCcSalesSlipGap", cssg);
		System.out.println("출력후 작업 CcSalesSlipGapDaoImpl: "+cssg2);
		System.err.println(cssg.getTermDiv());
		System.err.println(cssg.getYearOfAttr());
		System.out.println("값:"+cssg);
		System.out.println("출력후 작업 CcSalesSlipGapDaoImpl: "+cssg2);
		return cssg2;
	}

	@Override
	public CcSalesSlipGap selectCcGap(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg) {
		// TODO main cssg찾으로 디비감
		
		cssg=sqlSession.selectOne("CcSalesSlipGap.selectCcGap",cssg);
		
		System.out.println("DAO ccGap 값있을때 "+cssg);
		
		return cssg;
	}

	@Override
	public List<TnxHis> selectTnxHis(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg) {
		// TODO tnxhis 디비가기전
		
		List<TnxHis> th=sqlSession.selectList("CcSalesSlipGap.selectTnxHis", cssg);
		System.out.println("DAO: selectTnxHis : th"+th);
		
		return th;
	}

	@Override
	public String selectCssgPk(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg) {
		// TODO pk cssg db 가기
		System.out.println("Dao: cssg: "+ cssg);
		String cssgCode=sqlSession.selectOne("CcSalesSlipGap.selectCssgCode",cssg);
		
		System.out.println("Dao: cssgCode: "+ cssgCode);
		
		return cssgCode;
	}

	@Override
	public int updateCcSalesSlipGap(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg) {
		// TODO dao cssg deadline y->n
		
		int result= sqlSession.update("CcSalesSlipGap.updateCssgDeadline", cssg);
		System.out.println("Dao: updateCcSalesSlipGap :result :"+result);
		return result;
	}

	@Override
	public List<TnxHis> selectNewRecei(SqlSessionTemplate sqlSession, Receiption re,Date eD) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("Receiption",re);
		map.put("endDate",eD);
		//List<Receiption> recei=sqlSession.selectList("CcSalesSlipGap.selectNewRecei", map);
		
		//System.out.println("Dao:selectNewRecei: recei"+recei);
		
		
		
		
		return null;
	}

}
