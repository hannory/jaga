package com.kh.jaga.slip.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.slip.model.exception.receiptionException;
import com.kh.jaga.slip.model.vo.AccountTitle;
import com.kh.jaga.slip.model.vo.Journalize;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Vender;

public interface ReceiptionDao {

	List<Vender> selectVenderList(SqlSessionTemplate sqlSession) throws receiptionException;

	int insertReceiption(SqlSessionTemplate sqlSession, Receiption receiption);

	int insertJournalize(SqlSessionTemplate sqlSession, List<Journalize> journalizeList)  throws Exception ;

	List<AccountTitle> selectAccountTitleList(SqlSessionTemplate sqlSession);

}
