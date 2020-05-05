package com.kh.jaga.expendResolution.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.jaga.companyInnerId.model.vo.ComInIdVo;
import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;
import com.kh.jaga.expendResolution.model.vo.AccountTitleVo;
import com.kh.jaga.expendResolution.model.vo.DepartmentVo;
import com.kh.jaga.expendResolution.model.vo.ExpendResolutionDetailVo;
import com.kh.jaga.vender.model.vo.Vender;

public interface ExpendResolutionService {

	int insertExpendResolution(ExpendResolutionDto dto);

	List<DepartmentVo> selectDeptList();

	List<AccountTitleVo> selectAccountTitleList();

	List<ComInIdVo> selectComInIdList(String comCome);

	List<ExpendResolutionDto> selectExpendResolutionList();

	ExpendResolutionDto selectExpendResolutionOne(String expendResolutionNo);

	List<ExpendResolutionDetailVo> selectDetailList(String expendResolutionNo);

	List<Vender> selectVenderList(String comCode);

}
