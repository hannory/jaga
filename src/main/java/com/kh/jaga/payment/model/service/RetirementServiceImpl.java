package com.kh.jaga.payment.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.employee.model.vo.Employee;
import com.kh.jaga.payment.model.dao.RetirementDao;
import com.kh.jaga.payment.model.vo.Retirement;
import com.kh.jaga.payment.model.vo.RetirementDTO;
import com.kh.jaga.payment.model.vo.RetirementDTO2;

@Service
public class RetirementServiceImpl implements RetirementService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private RetirementDao rd;

	@Override
	public List<Employee> selectRetireEmp(String comCode) {
		return rd.selectRetireEmp(sqlSession, comCode);
	}

	@Override
	public RetirementDTO selectRetireInfo(String empCode) {
		return rd.selectRetireInfo(sqlSession, empCode);
	}

	@Override
	public List<RetirementDTO2> selectRetireBonus(String empCode) {
		return rd.selectRetireBonus(sqlSession, empCode);
	}

	@Override
	public int insertRetirement(Retirement r) {
		int result1 = rd.insertRetirement(sqlSession, r);
		
		int result2 = 0;
		int result3 = 0;
		
		if(result1 > 0) {
			result2 = rd.insertRetirementTax(sqlSession, r);
			if(result3 > 0) {
				result3 = rd.insertRetirementTaxAf(sqlSession, r.getRtaList());
			}
		}
		
		return result3;
	}

}
