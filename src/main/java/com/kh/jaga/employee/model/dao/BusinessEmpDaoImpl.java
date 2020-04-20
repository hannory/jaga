package com.kh.jaga.employee.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.employee.model.vo.Bank;
import com.kh.jaga.employee.model.vo.TypeOfBizCode;

@Repository
public class BusinessEmpDaoImpl implements BusinessEmpDao {

	@Override
	public List<Bank> selectBankList(SqlSessionTemplate sqlSession) {
		List<Bank> list = sqlSession.selectList("BusinessEmp.selectBank");
		
		return list;
	}

	@Override
	public List<TypeOfBizCode> selectTOBCList(SqlSessionTemplate sqlSession) {
		List<TypeOfBizCode> list = sqlSession.selectList("BusinessEmp.selectTOBC");
		
		return list;
	}

}
