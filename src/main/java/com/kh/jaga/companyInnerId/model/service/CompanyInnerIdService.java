package com.kh.jaga.companyInnerId.model.service;

import java.util.List;

import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;
import com.kh.jaga.companyInnerId.model.exception.ComInIdException;

public interface CompanyInnerIdService {

	public abstract int insertComInnerId(CreateCompanyInnerIdDto data) throws ComInIdException;

	public abstract List selectComInIdList();

	public abstract int selectComIdListCount();
	
}
