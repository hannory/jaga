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

@Service
public class ExpendResolutionServiceImpl implements ExpendResolutionService{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	ExpendResolutionDao dao;
	
	@Override
	public int insertExpendResolution(ExpendResolutionDto dto) {

		System.out.println("지출결의서 인설트 서비스 진입");
		
		int result = dao.insertExpendResoltion(dto, sqlSession);
		System.out.println("지출결의서 서비스 > 쿼리문 실행결과 result ::: " + result);
		
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
	public List<ExpendResolutionDto> selectExpendResolutionList() {
		
		List<ExpendResolutionDto> dtoList = dao.selectExpendResolutionList(sqlSession);
		
		return dtoList;
	}
	
	
}
