package com.kh.jaga.employee.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.jaga.employee.model.dao.EmployeeDao;
import com.kh.jaga.employee.model.vo.Attachment;
import com.kh.jaga.employee.model.vo.Employee;
@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EmployeeDao ed;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public int insertEmployee(Employee e) {
		System.out.println("직원정보:"+e);
		return ed.insertEmployee(sqlSession,e);
	}

	@Override
	public int insertAttachment(Attachment at) {
		
		System.out.println("첨부파일정보:"+at);
		return ed.insertAttachment(sqlSession,at);
		
	}

}
