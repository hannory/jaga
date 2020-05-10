package com.kh.jaga.employee.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.jaga.employee.model.vo.Attachment;
import com.kh.jaga.employee.model.vo.EarnIncome;
import com.kh.jaga.employee.model.vo.Employee;
import com.kh.jaga.employee.model.vo.incomeTax;

public interface EmployeeService {

	int insertEmployee(Employee e);

	int insertAttachment(Attachment at);

	int insertAttachment2(Attachment at2);

	List<Employee> selectEmpList();

	List<Employee> selectEmpList2();

	int insertEarnEmp(EarnIncome ei, String employeeCode);

	incomeTax seletcIncomeTax(int taxableIncome2);

	String selectEmpBuseo(String employeeCode);

	/*
	 * int insertEarnEmp(EarnIncome ei, String employeeCode);
	 */
}
