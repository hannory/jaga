package com.kh.jaga.bugagachi.model.dao;

import java.sql.Date;
import java.util.ArrayList;
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
	public String selectCssgPk(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg) throws Exception {
		// TODO pk cssg db 가기
		System.out.println("Dao: cssg: "+ cssg);
		String cssgCode=sqlSession.selectOne("CcSalesSlipGap.selectCssgCode",cssg);
		if(cssgCode==null) {
			throw new Exception();
		}
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
		
		//대변==카드번호
		List<TnxHis> recei2=sqlSession.selectList("CcSalesSlipGap.selectCardCode", map);
		
		System.out.println("Dao:selectNewRecei: recei2"+recei2);

		//차변==공급자
		List<TnxHis> recei=sqlSession.selectList("CcSalesSlipGap.selectNewRecei", map);
		
		System.out.println("Dao:selectNewRecei: recei"+recei);
		
		//return할 list
		List<TnxHis> tnxhis=new ArrayList<TnxHis>();
		for( TnxHis th :recei2) {//대변
			
			System.out.println("Dao: th: recei2 : "+th);
			for(TnxHis th2: recei) {//차변
				if(th.getSlipCode().equals(th2.getSlipCode())){
					th.setProducer(th2.getProducer());
					th.setProNum(th2.getProNum());
					if(th.getDivision().equals("50")||th.getDivision().equals("60")||th.getDivision().equals("70")) {
						th.setDivision("신용");
					}else {
						th.setDivision("현금");
					}
					
					//아직 거래내역을 어떻게 합쳐야할지 감이 안잡힘
					th.setNumOfTxn(1);
					th.setSilpDate(th.getSilpDate().substring(0,10));
				}
				
			}
			tnxhis.add(th);
		}
		
		return tnxhis;
	}

	@Override
	public int insertCssg(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg) {
		// TODO cssginsert하기
		
		int result=sqlSession.insert("CcSalesSlipGap.insertCssg", cssg);
		
		System.out.println("Dao: insertCssg result"+result);
		return result;
	}

	@Override
	public String selectCssgPk2(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg) throws Exception  {
		// TODO Auto-generated method stub
		
		String pk=sqlSession.selectOne("CcSalesSlipGap.selectCssgCurval",cssg);
		if(pk==null) {
			throw new Exception();
		}
		System.out.println("Dao: selectCssgPk2: currval:"+pk);
		return pk;
	}

	@Override
	public int insertCssgDetail(SqlSessionTemplate sqlSession, List<CcSalesSlipDetail> cgDetailList, String pk) {
		// TODO cssgDetail insert
		int result=0;
		for(CcSalesSlipDetail cssgD: cgDetailList) {
			System.out.println("Dao: insertCssgDetail:pk: "+pk);
			cssgD.setRcptstmtCode(pk);
			System.out.println("Dao: insertCssgDetail: cssgD: "+cssgD);
			result=sqlSession.insert("CcSalesSlipGap.insertCssgDetail",cssgD);
		}
		return result;
	}

	@Override
	public int insertCssgHis(SqlSessionTemplate sqlSession, List<TnxHis> cssgHisList, String pk) {
		// TODO insert cssgHis
		int result=0;
		for(TnxHis cssH: cssgHisList) {
			cssH.setRcptstmtCode(pk);
			System.out.println("Dao: insertCssHis: cssH: "+cssH );
			result=sqlSession.insert("CcSalesSlipGap.insertCssHis",cssH);
		}
		return result;
	}

	@Override
	public int updateCcSalesSlipGapDead(SqlSessionTemplate sqlSession, CcSalesSlipGap cssg) {
		// TODO Auto-generated method stub
		int result= sqlSession.update("CcSalesSlipGap.updateCssgDead", cssg);
		System.out.println("Dao: updateCcSalesSlipGapDead :result :"+result);
		return result;
	}

}
