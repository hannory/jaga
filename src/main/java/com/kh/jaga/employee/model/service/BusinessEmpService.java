package com.kh.jaga.employee.model.service;

import java.util.List;

import com.kh.jaga.employee.model.vo.Bank;
import com.kh.jaga.employee.model.vo.TypeOfBizCode;

public interface BusinessEmpService {

	List<Bank> selectBankList();

	List<TypeOfBizCode> selectTOBList();

}
