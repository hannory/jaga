package com.kh.jaga.employee.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.employee.model.vo.Bank;
import com.kh.jaga.employee.model.vo.TypeOfBizCode;

public interface BusinessEmpDao {

	List<Bank> selectBankList(SqlSessionTemplate sqlSession);

	List<TypeOfBizCode> selectTOBCList(SqlSessionTemplate sqlSession);

}
