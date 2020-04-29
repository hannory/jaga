package com.kh.jaga.employee.model.service;

import java.util.List;

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

	@Override
	public int insertAttachment2(Attachment at2) {
		
		return ed.insertAttachment(sqlSession, at2);
	}

	@Override
	public List<Employee> selectEmpList() {
		List<Employee> list = ed.selectEmpList(sqlSession);
		
		if(list==null) {
			System.out.println("임플로이리스트가널이다널이야");
		}
		
		return list;
	}

	@Override
	public List<Employee> selectEmpList2() {
		List<Employee> list = ed.selectEmpList2(sqlSession);
		
		if(list==null) {
			System.out.println("리스트2 널이다");
		}
		return list;
	}

}
