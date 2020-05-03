package com.kh.jaga.expendResolution.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.companyInnerId.model.vo.ComInIdVo;
import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;
import com.kh.jaga.expendResolution.model.vo.AccountTitleVo;
import com.kh.jaga.expendResolution.model.vo.DepartmentVo;

@Repository
public class ExpendResolutionDaoImpl implements ExpendResolutionDao{

	@Override
	public int insertExpendResoltion(ExpendResolutionDto dto, SqlSessionTemplate sqlSession) {
//		System.out.println("지출결의서 dao 진입");
		System.out.println("DAO > 받아온 데이터 (dto): " + dto);
		
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
	public List<ExpendResolutionDto> selectExpendResolutionList(SqlSessionTemplate sqlSession) {
		
		List<ExpendResolutionDto> dtoList = sqlSession.selectList("ExpendResolution.selectExpendResolutionList");
		
		return dtoList;
	}

}
