package com.kh.jaga.vatSumTaxInv.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.vatSumTaxInv.model.dao.SumOfTaxInvDao;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDto;
import com.kh.jaga.vatSumTaxInv.model.vo.SumTaxInvDetail;

@Service
public class SumOfTaxInvServiceImpl implements SumOfTaxInvService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private SumOfTaxInvDao sd;
	
	@Override
	public SumOfTaxInvDto selectSotiDto(SumOfTaxInvDto sDto) {
		// TODO 기존에 있는 soti select해오기
		System.out.println("Service : selectSotiDto: Dto: "+sDto);
		return sd.selectSotiDto(sqlSession,sDto);
	}

	@Override
	public List<SumOfTaxInvDiv> selectSotiDiv(SumOfTaxInvDto sDto2) {
		// TODO 기존에 있는 sotiDiv select해오기
		System.out.println("Service: selectSotiDiv: sDto2: "+sDto2);
		return sd.selectSotiDiv(sqlSession,sDto2);
	}

	@Override
	public List<SumOfTaxInvDiv> selectSotiDivPur(SumOfTaxInvDto sDto2) {
		// TODO 기존에 있는 sotiDivPur select해오기
		System.out.println("Service: selectSotiDivPur: sDto2: "+sDto2);
		return sd.selectSotiDivPur(sqlSession,sDto2);
	}

	@Override
	public List<SumTaxInvDetail> selectSotiDetail(SumOfTaxInvDto sDto2) {
		// TODO 기존에 있는 sotiDetailSales select 해오기
		System.out.println("Service: selectSotiDetail: sDto2: "+sDto2);
		return sd.selectSotiDetailSales(sqlSession,sDto2);
	}

	@Override
	public List<SumTaxInvDetail> selectSotiDetailPur(SumOfTaxInvDto sDto2) {
		// TODO 기존에 있는 sotiDetailPur select 해오기
		System.out.println("Service: selectSotiDetailPur: sDto2: "+sDto2);
		return sd.selectSotiDetailPur(sqlSession, sDto2);
	}

}
