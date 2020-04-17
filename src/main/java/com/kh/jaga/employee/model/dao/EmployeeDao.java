package com.kh.jaga.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.employee.model.vo.Attachment;
import com.kh.jaga.employee.model.vo.Employee;

public interface EmployeeDao {

	int insertEmployee(SqlSessionTemplate sqlSession, Employee e);

	int insertAttachment(SqlSessionTemplate sqlSession, Attachment at);

}
