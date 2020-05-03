package com.kh.jaga.company.model.service;

import java.util.HashMap;

import com.kh.jaga.company.model.exception.LoginException;
import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.companyInnerId.model.vo.ComInIdVo;

public interface CompanyService {
	
	Company loginCompany(Company c) throws LoginException;

	int insertCompany(Company c);

	int doubleCheckId(String userId);

	ComInIdVo loginEmp(HashMap<String, String> empData);
 
}
