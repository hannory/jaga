package com.kh.jaga.employee.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.employee.model.vo.Attachment;
import com.kh.jaga.employee.model.vo.Bank;
import com.kh.jaga.employee.model.vo.BusinessEmp;
import com.kh.jaga.employee.model.vo.BusinessEmp2;
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

	@Override
	public int insertBEmp(SqlSessionTemplate sqlSession, BusinessEmp be) {
		int result = sqlSession.insert("BusinessEmp.insertBEmp", be);
		
		return result;
	}

	@Override
	public List<BusinessEmp> selectBEmpList(SqlSessionTemplate sqlSession, String comCode) {
		List<BusinessEmp> list = sqlSession.selectList("BusinessEmp.selectBEmp", comCode);
		
		return list;
	}

	@Override
	public BusinessEmp2 selectOneBEmp(SqlSessionTemplate sqlSession, String empCode) {
		BusinessEmp2 be = sqlSession.selectOne("BusinessEmp.selectDetailBEmp", empCode);
		
		return be;
	}

	@Override
	public int updateBEmp(SqlSessionTemplate sqlSession, BusinessEmp be) {
		int result = sqlSession.update("BusinessEmp.updateBEmp", be);
		
		return result;
	}

	@Override
	public int insertAttachBEmp(SqlSessionTemplate sqlSession, ArrayList<Attachment> attList) {
		int result = 0;
		for(int i = 0; i < attList.size(); i++) {
			result = sqlSession.insert("BusinessEmp.insertAttBEmp", attList.get(i));
		}
		
		return result;
	}

}
