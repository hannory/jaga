package com.kh.jaga.companyInnerId.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;
@Repository
public class CompanyInnerIdDaoImpl implements CompanyInnerIdDao {

	@Override
	public int insertComInnerId(
			CreateCompanyInnerIdDto data, SqlSessionTemplate sqlSession) {
		
		System.out.println("dao 호출됨 ㅎ,,이제 쿼리문 실행할 거");
		System.out.println("받아온 id, pwd 값  : " + data.getId() + ",,," + data.getPwd());

		int result = sqlSession.insert("comInnerId.insertComInnerId", data);
		
		System.out.println("쿼리문 실행 직후 result : " + result);
		
		return result;
	}

}
