package com.kh.jaga.employee.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.employee.model.dao.BusinessEmpDao;
import com.kh.jaga.employee.model.vo.Bank;
import com.kh.jaga.employee.model.vo.TypeOfBizCode;

@Service
public class BusinessEmpServiceImpl implements BusinessEmpService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BusinessEmpDao bed;
	

	@Override
	public List<Bank> selectBankList() {
		
		return bed.selectBankList(sqlSession);
	}


	@Override
	public List<TypeOfBizCode> selectTOBList() {
		// TODO Auto-generated method stub
		return bed.selectTOBCList(sqlSession);
	}

}
