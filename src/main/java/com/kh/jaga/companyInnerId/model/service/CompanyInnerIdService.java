package com.kh.jaga.companyInnerId.model.service;

import java.util.List;

import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;

public interface CompanyInnerIdService {

	public abstract int insertComInnerId(CreateCompanyInnerIdDto data);

	public abstract List selectComInIdList();
	
}
