package com.kh.jaga.accountBook.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.accountBook.model.dao.AccountBookDao;
import com.kh.jaga.accountBook.model.vo.GenderLedgerDTO;
import com.kh.jaga.slip.model.vo.AccountTitle;

@Service
public class AccountBookServiceImpl implements AccountBookService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AccountBookDao abd;
	
	@Override
	public List<AccountTitle> selectAccountList(String comCode) {
		return abd.selectAccountList(sqlSession, comCode);
	}

	@Override
	public List<GenderLedgerDTO> selectOneAccount(HashMap<String, String> hm) {
		return abd.selectOneAccount(sqlSession, hm);
	}

}
