package com.kh.jaga.vatSumTaxInv.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDto;
import com.kh.jaga.vatSumTaxInv.model.vo.SumTaxInvDetail;

@Repository
public class SumOfTaxInvDaoImpl implements SumOfTaxInvDao {

	@Override
	public SumOfTaxInvDto selectSotiDto(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto) {
		// TODO 기존 soti Dao에서 select해오기
		
		System.out.println("Dao: selectSotiDto: sDto: "+sDto);
		SumOfTaxInvDto sDto2=sqlSession.selectOne("SumOfTaxInv.selectSoti",sDto);
		System.out.println("Dao: selectSotiDto: sDto2: "+sDto2);
		return sDto2;
	}

	@Override
	public List<SumOfTaxInvDiv> selectSotiDiv(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto2) {
		// TODO 기존 soti div 매출 dao에서 select해오기
		System.out.println("Dao: selectSotiDiv: sDto2: "+sDto2);
		
		//매출 리스트 가져오기
		List<SumOfTaxInvDiv> sDivList=sqlSession.selectList("SumOfTaxInv.selectSotiDivSales",sDto2);
		System.out.println("Dao: selectSotiDiv: sDivList: "+sDivList);
		
		return sDivList;
	}

	@Override
	public List<SumOfTaxInvDiv> selectSotiDivPur(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto2) {
		// TODO 기존 soti div 매입 dao에서 select해오기
		System.out.println("Dao: selectSotiDiv: sDto2: "+sDto2);
				
		//매입 리스트 가져오기
		List<SumOfTaxInvDiv> sDivList=sqlSession.selectList("SumOfTaxInv.selectSotiDivPur",sDto2);
		System.out.println("Dao: selectSotiDiv: sDivList: "+sDivList);
				
		return sDivList;
	}

	@Override
	public List<SumTaxInvDetail> selectSotiDetailSales(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto2) {
		// TODO 기존 soti detail 매출 dao에서 select해오기
		
		//매출 상세리스트 가져오기
		System.out.println("Dao: selectSotiDetailSales: sDto2: "+sDto2);
		List<SumTaxInvDetail> sDetailSales= sqlSession.selectList("SumOfTaxInv.selectDetailSales",sDto2);
		System.out.println("Dao: selectSotiDetailSales: sDetailSales: "+sDetailSales);
		return sDetailSales;
	}

	@Override
	public List<SumTaxInvDetail> selectSotiDetailPur(SqlSessionTemplate sqlSession, SumOfTaxInvDto sDto2) {
		// TODO 기존 soti detail 매입 dao에서 select해오기
		
		//매출 상세리스트 가져오기
		System.out.println("Dao: selectSotiDetailPur: sDto2: "+sDto2);
		List<SumTaxInvDetail> sDetailPur= sqlSession.selectList("SumOfTaxInv.selectDetailPur",sDto2);
		System.out.println("Dao: selectSotiDetailPur: sDetailSales: "+sDetailPur);
		return sDetailPur;
	}

}
