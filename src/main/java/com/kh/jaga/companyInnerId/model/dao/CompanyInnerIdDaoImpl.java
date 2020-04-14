package com.kh.jaga.companyInnerId.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;
@Repository
public class CompanyInnerIdDaoImpl implements CompanyInnerIdDao {

	@Override
	public int insertComInnerId(
			CreateCompanyInnerIdDto data, SqlSessionTemplate sqlSession) {
		
		System.out.println("dao 호출됨 ㅎ");

		int result = sqlSession.insert("", data);
		
		System.out.println("쿼리문 실행 직후 result : " + result);
		
		return result;
	}

}
