package com.kh.jaga.payment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.employee.model.vo.Employee;
import com.kh.jaga.payment.model.vo.RetirementDTO;
import com.kh.jaga.payment.model.vo.RetirementDTO2;

public interface RetirementDao {

	List<Employee> selectRetireEmp(SqlSessionTemplate sqlSession, String comCode);

	RetirementDTO selectRetireInfo(SqlSessionTemplate sqlSession, String empCode);

	List<RetirementDTO2> selectRetireBonus(SqlSessionTemplate sqlSession, String empCode);

}
