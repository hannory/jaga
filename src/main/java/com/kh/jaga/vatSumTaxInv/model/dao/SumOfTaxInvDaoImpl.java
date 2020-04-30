package com.kh.jaga.vatSumTaxInv.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDto;
import com.kh.jaga.vatSumTaxInv.model.vo.SumTaxInvDetail;

@Repository
public class SumOfTaxInvDaoImpl implements SumOfTaxInvDao {

	@Override
	public SumOfTaxInvDto selectSotiDto(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto) {
		// TODO 기존 soti Dao에서 select해오기
		
		System.out.println("Dao: selectSotiDto: sDto: "+sDto);
		SumOfTaxInvDto sDto2=new SumOfTaxInvDto();
		if(sDto.getTabletaxDiv().equals("계산서")) {
			System.out.println("계산서일때 Dao: selectSotiDto: sDto:");
			sDto2=sqlSession.selectOne("BillTotal.selectSoti",sDto);
		}else {
			sDto2=sqlSession.selectOne("SumOfTaxInv.selectSoti",sDto);
		}
		System.out.println("Dao: selectSotiDto: sDto2: "+sDto2);
		return sDto2;
	}

	@Override
	public List<SumOfTaxInvDiv> selectSotiDiv(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto2) {
		// TODO 기존 soti div 매출 dao에서 select해오기
		System.out.println("Dao: selectSotiDiv: sDto2: "+sDto2);
		List<SumOfTaxInvDiv> sDivList=new ArrayList<SumOfTaxInvDiv>();
		if(sDto2.getTabletaxDiv().equals("계산서")) {
			System.out.println("계산서일때 Dao: selectSotiDiv: sDto:"+sDto2);
			sDivList=sqlSession.selectList("BillTotal.selectSotiDivSales",sDto2);
		}else {
		//매출 리스트 가져오기
			sDivList=sqlSession.selectList("SumOfTaxInv.selectSotiDivSales",sDto2);
			System.out.println("Dao: selectSotiDiv: sDivList: "+sDivList);
		}
		return sDivList;
	}

	@Override
	public List<SumOfTaxInvDiv> selectSotiDivPur(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto2) {
		// TODO 기존 soti div 매입 dao에서 select해오기
		System.out.println("Dao: selectSotiDiv: sDto2: "+sDto2);
		List<SumOfTaxInvDiv> sDivList=new ArrayList<SumOfTaxInvDiv>();
		if(sDto2.getTabletaxDiv().equals("계산서")) {
			System.out.println("계산서일때 Dao: selectSotiDivPur: sDto:"+ sDto2);
			sDivList=sqlSession.selectList("BillTotal.selectSotiDivPur",sDto2);
		}else {	
			//매입 리스트 가져오기
			sDivList=sqlSession.selectList("SumOfTaxInv.selectSotiDivPur",sDto2);
			System.out.println("Dao: selectSotiDiv: sDivList: "+sDivList);
		}
				
		return sDivList;
	}

	@Override
	public List<SumTaxInvDetail> selectSotiDetailSales(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto2) {
		// TODO 기존 soti detail 매출 dao에서 select해오기
		
		//매출 상세리스트 가져오기
		System.out.println("Dao: selectSotiDetailSales: sDto2: "+sDto2);
		List<SumTaxInvDetail> sDetailSales= new ArrayList<SumTaxInvDetail>(); 
		if(sDto2.getTabletaxDiv().equals("계산서")) {
			System.out.println("계산서일때 Dao: selectDetailSales: sDto:");
			sDetailSales=sqlSession.selectList("BillTotal.selectDetailSales",sDto2);
		}else {		
				
			sDetailSales=sqlSession.selectList("SumOfTaxInv.selectDetailSales",sDto2);
		}
		System.out.println("Dao: selectSotiDetailSales: sDetailSales: "+sDetailSales);
		return sDetailSales;
	}

	@Override
	public List<SumTaxInvDetail> selectSotiDetailPur(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto2) {
		// TODO 기존 soti detail 매입 dao에서 select해오기
		
		//매출 상세리스트 가져오기
		System.out.println("Dao: selectSotiDetailPur: sDto2: "+sDto2);
		List<SumTaxInvDetail> sDetailPur= new ArrayList<SumTaxInvDetail>(); 
		if(sDto2.getTabletaxDiv().equals("계산서")) {
			System.out.println("계산서일때 Dao: selectDetailSales: sDto:");
			sDetailPur=sqlSession.selectList("BillTotal.selectDetailPur",sDto2);
		}else {		
				
			sDetailPur= sqlSession.selectList("SumOfTaxInv.selectDetailPur",sDto2);
		}
		System.out.println("Dao: selectSotiDetailPur: sDetailSales: "+sDetailPur);
		return sDetailPur;
	}

	@Override
	public List<SumTaxInvDetail> selectReceition(SqlSessionTemplate sqlSession, Receiption receiptionPur, Date eD) {
		// TODO 전표계산하게 값 가져오기
		
		System.out.println("Dao: selectReceition: receiption: "+ receiptionPur);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("Receiption",receiptionPur);
		map.put("endDate",eD);
		List<SumTaxInvDetail> re=new ArrayList<SumTaxInvDetail>();
		if(receiptionPur.getEvidenceCode().equals("20")) {
			re=sqlSession.selectList("BillTotal.selectReceiption", map);
		}else {
			re=sqlSession.selectList("SumOfTaxInv.selectReceiption", map);
		}
		return re;
	}

	@Override
	public int insertSoti(SqlSessionTemplate sqlSession, SumOfTaxInv soti) {
		// TODO Auto-generated method stub
		
		System.out.println("Dao: insertSoti: soti: "+soti);
		int result=sqlSession.insert("SumOfTaxInv.insertSumOfTaxInv",soti);
		System.out.println("Dao: isnertSoti: result: "+result);
		return result;
	}

	@Override
	public String selectSotiCurrval(SqlSessionTemplate sqlSession) throws Exception{
		// TODO Auto-generated method stub
		String currval=sqlSession.selectOne("SumOfTaxInv.selectSotiCurrval");
		if(currval==null) {
			throw new Exception();
		}
		return currval;
	}

	@Override
	public int insertDetailList(SqlSessionTemplate sqlSession, List<SumTaxInvDetail> rePur) {
		// TODO Auto-generated method stub
		System.out.println("Dao: insertDetailList: rePur: "+rePur);
		int result=0;
		for(SumTaxInvDetail stid: rePur) {
			stid.setSlipDate("2020-01-01");// slipDate에 임의의 데이트
			result=sqlSession.insert("SumOfTaxInv.insertDetailList",stid);
		}
		System.out.println("Dao: insertDetailList리스트 형식으로 insert: result: "+result);
		return result;
	}

	@Override
	public int insertDivList(SqlSessionTemplate sqlSession, List<SumOfTaxInvDiv> sDivPur) {
		// TODO Auto-generated method stub
		System.out.println("Dao: insertDivList: rePur: "+sDivPur);
		int result=0;
		for(SumOfTaxInvDiv stid:sDivPur) {
			
			result=sqlSession.insert("SumOfTaxInv.insertDivList",stid);
		}
		System.out.println("Dao: insertDivList리스트 형식으로 나오는지: result: "+result);
		return result;
	}

	@Override
	public int insertsDtoDeadline(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto) {
		// TODO Auto-generated method stub
		System.out.println("Dao: insertsDtoDeadLine: sDto: "+sDto);
		
		int result=sqlSession.update("SumOfTaxInv.updatesDtoDeadline",sDto);
		
		return result;
	}

	@Override
	public int updatesDtoDeadLineCen(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto) {
		// TODO Auto-generated method stub
		int result=sqlSession.update("SumOfTaxInv.updatesDtoDeadlineCen",sDto);
		return result;
	}


	

}
