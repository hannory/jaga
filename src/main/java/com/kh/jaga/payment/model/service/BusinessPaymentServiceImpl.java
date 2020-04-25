package com.kh.jaga.payment.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.payment.model.dao.BusinessPaymentDao;
import com.kh.jaga.payment.model.vo.BusinessPayment;

/**
 * @author EunJin
 * @comment 사업소득자료입력 serviceImpl
 * @createDate 2020. 4. 24.
 */
@Service
public class BusinessPaymentServiceImpl implements BusinessPaymentService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BusinessPaymentDao bpd;
	
	@Override
	public int insertBPay(List<BusinessPayment> list) {
		return bpd.insertBPay(sqlSession, list);
	}

	@Override
	public List<BusinessPayment> selectBPay(String empCode) {
		
		
		return bpd.selectBPay(sqlSession, empCode);
	}

}
