package com.kh.jaga.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.employee.model.vo.Attachment;
import com.kh.jaga.employee.model.vo.Employee;
@Repository
public class EmployeeDaoImpl implements EmployeeDao {

	@Override
	public int insertEmployee(SqlSessionTemplate sqlSession, Employee e) {
		System.out.println(e);
		return sqlSession.insert("Employee.insertEmployee",e);
	}

	@Override
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		
		return sqlSession.insert("Attachment.insertAttachment",at);
	}

	@Override
	public int insertAttachment2(SqlSessionTemplate sqlSession, Attachment at2) {
		return sqlSession.insert("Attachment.insertAttachment2",at2);
	}

}
