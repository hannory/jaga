package com.kh.jaga.employee.model.service;

import java.util.List;

import com.kh.jaga.employee.model.vo.Attachment;
import com.kh.jaga.employee.model.vo.Employee;

public interface EmployeeService {

	int insertEmployee(Employee e);

	int insertAttachment(Attachment at);

	int insertAttachment2(Attachment at2);

	List<Employee> selectEmpList();

}
