package com.kh.jaga.slip.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.slip.model.dao.ReceiptionDao;
import com.kh.jaga.slip.model.exception.receiptionException;
import com.kh.jaga.slip.model.vo.AccountTitle;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Vender;

@Service
public class ReceiptionServiceImpl implements ReceiptionService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReceiptionDao receiptionDao;
	
	@Override
	public List<Vender> selectVenderList() throws receiptionException {
		List<Vender> list = null;
		
		list = receiptionDao.selectVenderList(sqlSession);
		
		if(list == null) {
			throw new receiptionException("거래처 불러오기 실패!");
			
		}
		
		return list;
	}

	@Override
	public int insertReceiption(Receiption receiption) {
		int result = receiptionDao.insertReceiption(sqlSession, receiption);
		
		int result2 = 0;
		if(result > 0) {
			try {
				result2 = receiptionDao.insertJournalize(sqlSession, receiption.getJournalizeList());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					
		}
		
		
		
		
		return result2;
	}

	@Override
	public List<AccountTitle> selectAccountTitleList() {
		List<AccountTitle> list = null;
		
		list = receiptionDao.selectAccountTitleList(sqlSession);
		
		
		return list;
	}

}
