package com.kh.jaga.payment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.payment.model.vo.BusinessPayment;

/**
 * @author EunJin
 * @comment 사업소득자료입력 관련 daoImpl
 * @createDate 2020. 4. 24.
 */
@Repository
public class BusinessPaymentDaoImpl implements BusinessPaymentDao{

	@Override
	public int insertBPay(SqlSessionTemplate sqlSession, List<BusinessPayment> list) {
		int result = 0;
		
		for(int i = 0; i < list.size(); i++) {
			result = sqlSession.insert("BusinessPayment.insertBPay", list.get(i));
					
		}
		
		return result;
	}

	@Override
	public List<BusinessPayment> selectBPay(SqlSessionTemplate sqlSession, String empCode) {
		List<BusinessPayment> list = sqlSession.selectList("BusinessPayment.selectBPay", empCode);
		
		System.out.println("dao -----------" + list);
		
		return list;
	}

}
