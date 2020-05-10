package com.kh.jaga.payment.model.service;

import java.util.List;

import com.kh.jaga.employee.model.vo.Employee;
import com.kh.jaga.payment.model.vo.RetirementDTO;
import com.kh.jaga.payment.model.vo.RetirementDTO2;

public interface RetirementService {

	List<Employee> selectRetireEmp(String comCode);

	RetirementDTO selectRetireInfo(String empCode);

	List<RetirementDTO2> selectRetireBonus(String empCode);

}
