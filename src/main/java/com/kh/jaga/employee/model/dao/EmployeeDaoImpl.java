package com.kh.jaga.employee.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.employee.model.vo.Attachment;
import com.kh.jaga.employee.model.vo.EarnIncome;
import com.kh.jaga.employee.model.vo.Employee;
import com.kh.jaga.employee.model.vo.incomeTax;
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

	@Override
	public List<Employee> selectEmpList(SqlSessionTemplate sqlSession) {

		List<Employee> list = sqlSession.selectList("Employee.selectEmpList");
		
		
		return list;
	}

	@Override
	public List<Employee> selectEmpList2(SqlSessionTemplate sqlSession) {
		List<Employee> list = sqlSession.selectList("Employee.selectEmpList2");
		return list;
	}

	@Override
	public int insertEarnEmp(SqlSessionTemplate sqlSession, EarnIncome ei, String employeeCode) {
		
		return sqlSession.insert("EarnIncome.insertEarnEmp",ei);
	}

	@Override
	public incomeTax selectIncomeTax(SqlSessionTemplate sqlSession, int taxableIncome2) {
		System.out.println("dao 값 2:"+taxableIncome2);
		return sqlSession.selectOne("incomeTax.selectIncomeTax",taxableIncome2);
	}

	@Override
	public String selectEmpBuseo(SqlSessionTemplate sqlSession, String employeeCode) {
		return sqlSession.selectOne("Employee.selectEmpBuseo", employeeCode);
	}


}
