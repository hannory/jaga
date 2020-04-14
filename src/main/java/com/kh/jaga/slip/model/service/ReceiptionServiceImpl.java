package com.kh.jaga.slip.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.slip.model.dao.ReceiptionDao;
import com.kh.jaga.slip.model.exception.receiptionException;
import com.kh.jaga.slip.model.vo.Vender;

@Service
public class ReceiptionServiceImpl implements ReceiptionService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReceiptionDao receiptionDao;
	
	@Override
	public List<Vender> selectVenderList() {
		List<Vender> list = null;
		
		list = receiptionDao.selectVenderList(sqlSession);
		
		if(list == null) {
			new receiptionException("거래처 불러오기 실패!");
		}
		
		return list;
	}

}
