package com.kh.jaga.companyInnerId.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.companyInnerId.model.dao.CompanyInnerIdDao;
import com.kh.jaga.companyInnerId.model.dto.CreateCompanyInnerIdDto;
import com.kh.jaga.companyInnerId.model.exception.ComInIdException;
import com.kh.jaga.companyInnerId.model.vo.SelectCompanyIdVo;

@Service
public class CompanyInnerIdServiceImpl implements CompanyInnerIdService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	CompanyInnerIdDao dao;

	@Override
	public int insertComInnerId(CreateCompanyInnerIdDto data) throws ComInIdException {
		System.out.println("서비스 호출됨,, data출력해보자");
		System.out.println(data);
		
		int result = dao.insertComInnerId(data, sqlSession);
		
		//트랜잭션 테스트 //삭제할것
//		int temp = -77;
//		try {
//			temp = dao.insertTest(data, sqlSession);		//txTest
//			System.out.println("서비스 > test메소드 실행 후 다음 줄 ,,");
//		} catch (ComInIdException e) {
//			e.printStackTrace();
//			System.out.println("=====서비스 > 익셉션 캐치=====");
//			System.out.println("서비스 > 기존 쿼리 실행 결과 : " + result);
//			System.out.println("서비스 > 테스트 쿼리 실행 결과 : " + temp);
//		}
//		System.out.println("=====서비스 > 정상=====");
//		System.out.println("서비스 > 기존 쿼리 실행 결과 : " + result);
//		System.out.println("서비스 > 테스트 쿼리 실행 결과 : " + temp);
		//트랜잭션 테스트 end
		
		return result;
	}

	@Override
	public List<SelectCompanyIdVo> selectComInIdList() {
		
		System.out.println("service 진입 ...");
		
		List<SelectCompanyIdVo> list = dao.selectComInIdList(sqlSession);
		
		System.out.println("service > return list : " + list);
		
		return list;
	}

	@Override
	public int selectComIdListCount() {
		//페이징
		int listCount = dao.selectComIdListCount(sqlSession);
		
		return listCount;
	}

}
