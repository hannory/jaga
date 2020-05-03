package com.kh.jaga.companyInnerId.model.service;

import java.util.List;

import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;
import com.kh.jaga.companyInnerId.model.exception.ComInIdException;
import com.kh.jaga.companyInnerId.model.vo.PageInfo;

public interface CompanyInnerIdService {

	public abstract int insertComInnerId(CreateCompanyInnerIdDto data) throws ComInIdException;

	public abstract List selectComInIdList(PageInfo pi);

	public abstract int selectComIdListCount(String companyCode);
	
}
