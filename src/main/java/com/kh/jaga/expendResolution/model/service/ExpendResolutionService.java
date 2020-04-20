package com.kh.jaga.expendResolution.model.service;

import java.util.List;

import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;
import com.kh.jaga.expendResolution.model.vo.DepartmentVo;

public interface ExpendResolutionService {

	int insertExpendResolution(ExpendResolutionDto dto);

	List<DepartmentVo> selectDeptList();

}
