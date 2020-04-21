package com.kh.jaga.employee.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.employee.model.dao.BusinessEmpDao;
import com.kh.jaga.employee.model.vo.Bank;
import com.kh.jaga.employee.model.vo.BusinessEmp;
import com.kh.jaga.employee.model.vo.BusinessEmp2;
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
		return bed.selectTOBCList(sqlSession);
	}


	@Override
	public int insertBEmp(BusinessEmp be) {
		return bed.insertBEmp(sqlSession, be);
	}


	@Override
	public List<BusinessEmp> selectBEmpList(String comCode) {
		List<BusinessEmp> list = bed.selectBEmpList(sqlSession, comCode);
		
		
		return list;
	}


	@Override
	public BusinessEmp2 selectOneBEmp(String empCode) {
		return bed.selectOneBEmp(sqlSession, empCode);
	}


	@Override
	public int updateBEmp(BusinessEmp be) {
		return bed.updateBEmp(sqlSession, be);
	}

}
