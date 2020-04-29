package com.kh.jaga.employee.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.employee.model.vo.Attachment;
import com.kh.jaga.employee.model.vo.Employee;

public interface EmployeeDao {

	int insertEmployee(SqlSessionTemplate sqlSession, Employee e);

	int insertAttachment(SqlSessionTemplate sqlSession, Attachment at);
	
	int insertAttachment2(SqlSessionTemplate sqlSession, Attachment at2);

	List<Employee> selectEmpList(SqlSessionTemplate sqlSession);

	List<Employee> selectEmpList2(SqlSessionTemplate sqlSession);
}
