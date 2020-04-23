package com.kh.jaga.company.model.service;

import com.kh.jaga.company.model.exception.LoginException;
import com.kh.jaga.company.model.vo.Company;

public interface CompanyService {
	
	Company loginCompany(Company c) throws LoginException;

	int insertCompany(Company c);

	int doubleCheckId(String userId);

}
