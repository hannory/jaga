package com.kh.jaga.payment.model.service;

import java.util.List;

import com.kh.jaga.payment.model.vo.BusinessPayment;


/**
 * @author EunJin
 * @comment 사업소득자료입력 서비스
 * @createDate 2020. 4. 24.
 */
public interface BusinessPaymentService {

	
	int insertBPay(List<BusinessPayment> list);

	List<BusinessPayment> selectBPay(String empCode);

}
