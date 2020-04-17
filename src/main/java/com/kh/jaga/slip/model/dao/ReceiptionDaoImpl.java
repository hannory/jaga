package com.kh.jaga.slip.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.slip.model.exception.receiptionException;
import com.kh.jaga.slip.model.vo.AccountTitle;
import com.kh.jaga.slip.model.vo.Journalize;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Vender;

@Repository
public class ReceiptionDaoImpl implements ReceiptionDao {

	@Override
	public List<Vender> selectVenderList(SqlSessionTemplate sqlSession) throws receiptionException {
		List<Vender> list = sqlSession.selectList("Receiption.selectVenderList");
		
		if(list == null) {
			throw new receiptionException("거래처리스트출력실패!!");
		}
		
		return list;
	}

	@Override
	public int insertReceiption(SqlSessionTemplate sqlSession, Receiption receiption) {
		
			
		return sqlSession.insert("Receiption.insertReceiption", receiption);
	}

	@Override
	public int insertJournalize(SqlSessionTemplate sqlSession, List<Journalize> journalizeList) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("daoList 출력 --------- : " + journalizeList);
		
		
		int result = 0;
		for(int i = 0; i < journalizeList.size(); i++) {
			result = sqlSession.insert("Receiption.insertJournalize", journalizeList.get(i));
		}
		
		return result;
	}

	@Override
	public List<AccountTitle> selectAccountTitleList(SqlSessionTemplate sqlSession) {
		List<AccountTitle> list = sqlSession.selectList("Receiption.selectAccountTitleList");
		
		
		return list;
	}
	
}
