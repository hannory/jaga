package com.kh.jaga.employee.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.employee.model.vo.Bank;
import com.kh.jaga.employee.model.vo.BusinessEmp;
import com.kh.jaga.employee.model.vo.BusinessEmp2;
import com.kh.jaga.employee.model.vo.TypeOfBizCode;

public interface BusinessEmpDao {

	List<Bank> selectBankList(SqlSessionTemplate sqlSession);

	List<TypeOfBizCode> selectTOBCList(SqlSessionTemplate sqlSession);

	int insertBEmp(SqlSessionTemplate sqlSession, BusinessEmp be);

	List<BusinessEmp> selectBEmpList(SqlSessionTemplate sqlSession, String comCode);

	BusinessEmp2 selectOneBEmp(SqlSessionTemplate sqlSession, String empCode);

	int updateBEmp(SqlSessionTemplate sqlSession, BusinessEmp be);

}
