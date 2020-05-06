package com.kh.jaga.expendResolution.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.jaga.companyInnerId.model.vo.ComInIdVo;
import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;
import com.kh.jaga.expendResolution.model.vo.AccountTitleVo;
import com.kh.jaga.expendResolution.model.vo.DepartmentVo;
import com.kh.jaga.expendResolution.model.vo.ExpendResolutionDetailVo;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vender.model.vo.Vender;

@Repository
public class ExpendResolutionDaoImpl implements ExpendResolutionDao{
	

	@Override
	public int insertExpendResoltion(ExpendResolutionDto dto, SqlSessionTemplate sqlSession) {
//		System.out.println("지출결의서 dao 진입");
		System.out.println("DAO > 받아온 지출결의서 데이터 (dto): " + dto);
		
//		String date = sqlSession.selectOne("ExpendResolution.selectTest");
//		System.out.println("!!!!!!!!!! sql date ? " + date);
		
		return sqlSession.insert("ExpendResolution.insertExpendResolution", dto);
	}

	@Override
	public List<DepartmentVo> selectDeptList(SqlSessionTemplate sqlSession) {
		List<DepartmentVo> deptList = sqlSession.selectList("ExpendResolution.selectDeptList");
		
		return deptList;
	}

	@Override
	public List<AccountTitleVo> selectAccountTitleList(SqlSessionTemplate sqlSession) {
		System.out.println("selectAccountTitleList dao 진입 ㅎㅎ");
		
		List<AccountTitleVo> accountTitleList = sqlSession.selectList("ExpendResolution.selectAccountTitleList");

		return accountTitleList;
	}

	@Override
	public List<ComInIdVo> selectComInIdListList(SqlSessionTemplate sqlSession, String comCome) {
		
		List<ComInIdVo> ComInIdList = sqlSession.selectList("ExpendResolution.selectComInIdList", comCome);
		
		return ComInIdList;
	}


	@Override
	public List<ExpendResolutionDto> selectExpendResolutionList(SqlSessionTemplate sqlSession, String comCode) {
		
		List<ExpendResolutionDto> dtoList = sqlSession.selectList("ExpendResolution.selectExpendResolutionList",comCode);
		
		return dtoList;
	}

	@Override
	public ExpendResolutionDto selectExpendResolutionOne(SqlSessionTemplate sqlSession, String expendResolutionNo) {
		
		ExpendResolutionDto dto = sqlSession.selectOne("ExpendResolution.selectExpendResolutionOne", expendResolutionNo);
		
		return dto;
	}

	@Override
	public List<ExpendResolutionDetailVo> selectDetailList(SqlSessionTemplate sqlSession, String expendResolutionNo) {
		
		List<ExpendResolutionDetailVo> list = sqlSession.selectList("ExpendResolution.selectDetailList", expendResolutionNo);
		
		return list;
	}

	@Override
	public List<Vender> selectVenderList(SqlSessionTemplate sqlSession, String comCode) {
		
		List<Vender> list = sqlSession.selectList("ExpendResolution.selectVenderList", comCode);
		
		return list;
	}

	@Override
	public int updateResolution(SqlSessionTemplate sqlSession, String expendResolutionNo) {
		
		int result = sqlSession.update("ExpendResolution.updateResolution", expendResolutionNo);
		
		return result;
	}

	@Override
	public String selectDateSlipCode(SqlSessionTemplate sqlSession, ExpendResolutionDto resolutionDto) {
		
		String dateSlipCode = sqlSession.selectOne("ExpendResolution.selectDateSlipCode", resolutionDto);
		
		return dateSlipCode;
	}

	
}
