package com.kh.jaga.payment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.payment.model.vo.BusinessPayment;

/**
 * @author EunJin
 * @comment 사업소득자료입력 관련 DAO
 * @createDate 2020. 4. 24.
 */
public interface BusinessPaymentDao {

	int insertBPay(SqlSessionTemplate sqlSession, List<BusinessPayment> list);

	List<BusinessPayment> selectBPay(SqlSessionTemplate sqlSession, String empCode);

}
