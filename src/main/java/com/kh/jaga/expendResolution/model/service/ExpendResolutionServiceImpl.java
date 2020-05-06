package com.kh.jaga.expendResolution.model.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.companyInnerId.model.vo.ComInIdVo;
import com.kh.jaga.expendResolution.model.dao.ExpendResolutionDao;
import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;
import com.kh.jaga.expendResolution.model.vo.AccountTitleVo;
import com.kh.jaga.expendResolution.model.vo.DepartmentVo;
import com.kh.jaga.expendResolution.model.vo.ExpendResolutionDetailVo;
import com.kh.jaga.slip.model.dao.ReceiptionDao;
import com.kh.jaga.slip.model.dao.ReceiptionDaoImpl;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vender.model.vo.Vender;

@Service
public class ExpendResolutionServiceImpl implements ExpendResolutionService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ExpendResolutionDao dao;
	
	@Autowired
	private Receiption receiption;
	@Autowired
	private ReceiptionDao rDao;
	
	@Override
	public int insertExpendResolution(ExpendResolutionDto dto) {

//		System.out.println("지출결의서 인설트 서비스 진입");
		
		int result = dao.insertExpendResoltion(dto, sqlSession);
//		System.out.println("지출결의서 서비스 > 쿼리문 실행결과 result ::: " + result);
		
		return result;
	}

	@Override
	public List<DepartmentVo> selectDeptList() {
		
		List<DepartmentVo> deptList = dao.selectDeptList(sqlSession);
		
		return deptList;
	}

	@Override
	public List<AccountTitleVo> selectAccountTitleList() {
		
		List<AccountTitleVo> accountTitleList = dao.selectAccountTitleList(sqlSession);

		return accountTitleList;
	}

	@Override
	public List<ComInIdVo> selectComInIdList(String comCome) {
		
		List<ComInIdVo> ComInIdList = dao.selectComInIdListList(sqlSession, comCome );

		return ComInIdList;
	}

	@Override
	public List<ExpendResolutionDto> selectExpendResolutionList(String comCode) {
		
		List<ExpendResolutionDto> dtoList = dao.selectExpendResolutionList(sqlSession, comCode);
		
		return dtoList;
	}

	@Override
	public ExpendResolutionDto selectExpendResolutionOne(String expendResolutionNo) {
		
		ExpendResolutionDto dto = dao.selectExpendResolutionOne(sqlSession, expendResolutionNo);
		
		return dto;
	}

	@Override
	public List<ExpendResolutionDetailVo> selectDetailList(String expendResolutionNo) {

		List<ExpendResolutionDetailVo> list = dao.selectDetailList(sqlSession, expendResolutionNo);
		
		return list;
	}

	@Override
	public List<Vender> selectVenderList(String comCode) {
		
		List<Vender> list = dao.selectVenderList(sqlSession, comCode);
		
		return list;
	}

	@Override
	public int updateResolution(String expendResolutionNo) {
		
		int result = dao.updateResolution(sqlSession, expendResolutionNo);
		
		ExpendResolutionDto resolutionDto = dao.selectExpendResolutionOne(sqlSession, expendResolutionNo);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("인설트 후 해당 문서(지출결의서) 가져 온 결과 :");
		System.out.println(resolutionDto);
		
		receiption.setBrief();
		receiption.setComCode(comCode);
		receiption.setDateSlipCode(dateSlipCode);
		receiption.setDeemedStatus(deemedStatus);
//		receiption.setDivision(division);
//		receiption.setEvidence(evidence);
//		receiption.setEvidenceCode(evidenceCode);
//		receiption.setIssueStatus(issueStatus);
//		receiption.setItem(item);
		receiption.setJournalizeList(journalizeList);
		receiption.setResolutionCode(resolutionCode);
//		receiption.setSlipCode(slipCode);	//시퀀스
		receiption.setSlipDate(slipDate);
		receiption.setSlipDivision(slipDivision);
//		receiption.setSupplyDeaga(supplyDeaga);
		receiption.setSupplyValue(supplyValue);
		receiption.setValueTax(valueTax);
		
		if(result > 0) {
			//일반전표 입력 로직 수행
			rDao.insertReceiption(sqlSession, receiption);
			
		}
		
		return result;
	}
	
	
}
