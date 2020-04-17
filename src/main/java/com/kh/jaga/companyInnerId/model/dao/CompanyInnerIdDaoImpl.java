package com.kh.jaga.companyInnerId.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;
import com.kh.jaga.companyInnerId.model.exception.ComInIdException;
@Repository
public class CompanyInnerIdDaoImpl implements CompanyInnerIdDao {

	@Override
	public int insertComInnerId(
			CreateCompanyInnerIdDto data, SqlSessionTemplate sqlSession) {
		
		System.out.println("dao 호출됨 ㅎ,,이제 쿼리문 실행할 거");
		System.out.println("받아온 data 값  : " + data);

		int result = sqlSession.insert("ComInnerId.insertComInnerId", data);
		System.out.println("쿼리문 실행 직후 result : " + result);
		
		return result;
	}

	@Override
	public List selectComInIdList(SqlSessionTemplate sqlSession) {

		System.out.println("dao 호출됨 ㅎ");
//		List list = sqlSession.selectList("ComInnerId.selectComInIdList"); 
		
		
		return null;
	}

	
	
	//트랜잭션 테스트
	@Override
	public int insertTest(
			CreateCompanyInnerIdDto data, SqlSessionTemplate sqlSession) throws ComInIdException {
		System.out.println("txTest 쿼리 있는 dao 메소드 호출됨");
		int temp = -99;
		
		try {
		temp = sqlSession.insert("ComInnerId.insertTest", data);
		
		System.out.println("dao > txTest 쿼리 실행 결과111 : " + temp);
		} catch(Exception e) {
			System.out.println("쿼리 실행 중 익셉션 잡았음");
			System.out.println("dao > temp : " + temp);
			System.out.println("트랜잭션 처리를 위해 강제로 예외 발생시킬거");
			throw new ComInIdException("DAO 53번라인 강제예외 발생시킴");
		}
		
		
		System.out.println("dao > txTest 쿼리 실행 결과222 : " + temp);
//		if(temp < 1) {
//			System.out.println("temp 1보다 작으니까 익셉션 발생시킬거");
//			throw new ComInIdException("txTest 쿼리 익셉션 ~~~~~");
//		}
		
		return temp;
	}

}
