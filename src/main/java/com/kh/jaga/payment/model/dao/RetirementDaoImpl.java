package com.kh.jaga.payment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.employee.model.vo.Employee;
import com.kh.jaga.payment.model.vo.Retirement;
import com.kh.jaga.payment.model.vo.RetirementDTO;
import com.kh.jaga.payment.model.vo.RetirementDTO2;
import com.kh.jaga.payment.model.vo.RetirementTaxAf;

@Repository
public class RetirementDaoImpl implements RetirementDao{

	@Override
	public List<Employee> selectRetireEmp(SqlSessionTemplate sqlSession, String comCode) {
		List<Employee> list = sqlSession.selectList("Retirement.selectRetireEmp", comCode);
		
		return list;
	}

	@Override
	public RetirementDTO selectRetireInfo(SqlSessionTemplate sqlSession, String empCode) {
		RetirementDTO r = sqlSession.selectOne("Retirement.selectRetireInfo", empCode);
		
		return r;
	}

	@Override
	public List<RetirementDTO2> selectRetireBonus(SqlSessionTemplate sqlSession, String empCode) {
		List<RetirementDTO2> list = sqlSession.selectList("Retirement.selectRetireBonus", empCode);
		
		return list;
	}

	@Override
	public int insertRetirement(SqlSessionTemplate sqlSession, Retirement r) {
		return sqlSession.insert("Retirement.insertRetiremnet", r);
	}

	@Override
	public int insertRetirementTaxAf(SqlSessionTemplate sqlSession, List<RetirementTaxAf> rtaList) {
		
		int result = 0;
		for(int i = 0; i < rtaList.size(); i++) {
			result = sqlSession.insert("Retirement.insertRetirementTaxAf", rtaList.get(i));
					
		}
		
		return result;
	}

	@Override
	public int insertRetirementTax(SqlSessionTemplate sqlSession, Retirement r) {
		int result = sqlSession.insert("Retirement.insertRetirementTax", r);
		
		return result;
	}

}
