package com.kh.jaga.expendResolution.model.service;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.kh.jaga.companyInnerId.model.vo.ComInIdVo;
import com.kh.jaga.expendResolution.model.dao.ExpendResolutionDao;
import com.kh.jaga.expendResolution.model.dao.ExpendResolutionDaoImpl;
import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;
import com.kh.jaga.expendResolution.model.vo.AccountTitleVo;
import com.kh.jaga.expendResolution.model.vo.DepartmentVo;
import com.kh.jaga.expendResolution.model.vo.ExpendResolutionDetailVo;
import com.kh.jaga.slip.model.dao.ReceiptionDao;
import com.kh.jaga.slip.model.dao.ReceiptionDaoImpl;
import com.kh.jaga.slip.model.vo.Journalize;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vender.model.vo.Vender;

@Service
public class ExpendResolutionServiceImpl implements ExpendResolutionService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ExpendResolutionDaoImpl dao;
	
	@Autowired
	private ReceiptionDao receiptionDao;
	
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
		
		//상태를 Y로 바꿔주자
		int result = dao.updateResolution(sqlSession, expendResolutionNo);
		
		//해당 지출결의서를 가져오자
		ExpendResolutionDto resolutionDto = dao.selectExpendResolutionOne(sqlSession, expendResolutionNo);
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println("인설트 후 해당 문서(지출결의서) 가져 온 결과 :");
		System.out.println(resolutionDto);
		
		Receiption receiption = new Receiption();
		
		String comCode = receiption.getComCode();
		String dateSlipCode = dao.selectDateSlipCode(sqlSession, comCode);
		if(dateSlipCode == null) {
			dateSlipCode = "10001";
		}else {
			dateSlipCode = String.valueOf((Integer.parseInt(dateSlipCode) + 1));
		}
		
		//slip 테이블
		receiption.setBrief(resolutionDto.getBrief());
		receiption.setComCode(resolutionDto.getComCode());
		receiption.setDateSlipCode(dateSlipCode);
		receiption.setDeemedStatus("N");
//		receiption.setDivision(division);
//		receiption.setEvidence(evidence);
//		receiption.setEvidenceCode(evidenceCode);
//		receiption.setIssueStatus(issueStatus);
//		receiption.setItem(item);
		
		Journalize journalize1 = new Journalize();
		journalize1.setAccountCode(resolutionDto.getAccountTitleCode());
//		journalize1.setAccountTitle(accountTitle);
		journalize1.setDebitCredit("차변");
//		journalize1.setJournalCode(journalCode);
		journalize1.setPrice(new BigDecimal(resolutionDto.getExpendSummary()));
//		journalize1.setSlipCode(slipCode);
		journalize1.setVenderCode(resolutionDto.getDetailVenderCode());
//		journalize1.setVenderName(venderName);
		
		Journalize journalize2 = new Journalize();
		journalize2.setAccountCode(resolutionDto.getPaymentTypeCode());
//		journalize2.setAccountTitle(accountTitle);
		journalize2.setDebitCredit("대변");
//		journalize2.setJournalCode(journalCode);
		journalize2.setPrice(new BigDecimal(resolutionDto.getExpendSummary()));
//		journalize2.setSlipCode(slipCode);
		journalize2.setVenderCode(resolutionDto.getDetailVenderCode());
//		journalize2.setVenderName(venderName);
		
		List<Journalize> jourList = new ArrayList<Journalize>();
		jourList.add(journalize1);
		jourList.add(journalize2);
		
		
		String expendDate = resolutionDto.getExpendDate();
		int year = Integer.parseInt(expendDate.substring(2,4));
		int month = Integer.parseInt(expendDate.substring(5,7));
		int dayOfMonth = Integer.parseInt(expendDate.substring(8,10));

		Date date = Date.valueOf(expendDate.substring(0,4) + "-" + expendDate.substring(5,7) + "-" + expendDate.substring(8,10));
		
		//저널라이즈 테이블
		receiption.setJournalizeList(jourList);
		receiption.setResolutionCode(resolutionDto.getResolutionNo());
//		receiption.setSlipCode(slipCode);	//시퀀스
		receiption.setSlipDate(date);
		receiption.setSlipDivision("일반");
//		receiption.setSupplyDeaga(supplyDeaga);
		receiption.setSupplyValue(new BigDecimal(resolutionDto.getExpendSummary()));
		receiption.setValueTax(new BigDecimal("0"));
		
		if(result > 0) {
			//일반전표 입력 로직 수행
			System.out.println("일반전표 입력 서비스로직 수행하러 들어옴 ㅎ (이프문 통과)");
			int insertReceiptionResult = receiptionDao.insertReceiption(sqlSession, receiption);
			System.out.println("insertReceptionResult ::::::::::\n" + insertReceiptionResult);
		}
		
		return result;
	}
	
	
}
