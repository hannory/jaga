package com.kh.jaga.employee.model.service;

import com.kh.jaga.employee.model.vo.Attachment;
import com.kh.jaga.employee.model.vo.Employee;

public interface EmployeeService {

	int insertEmployee(Employee e);

	int insertAttachment(Attachment at);

}
