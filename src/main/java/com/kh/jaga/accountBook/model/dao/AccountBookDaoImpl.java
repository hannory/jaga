package com.kh.jaga.accountBook.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.accountBook.model.vo.GenderLedgerDTO;
import com.kh.jaga.slip.model.vo.AccountTitle;

@Repository
public class AccountBookDaoImpl implements AccountBookDao{

	@Override
	public List<AccountTitle> selectAccountList(SqlSessionTemplate sqlSession, String comCode) {
		List<AccountTitle> list = sqlSession.selectList("AccountBook.selectAccountList", comCode);
		
		return list;
	}

	@Override
	public List<GenderLedgerDTO> selectOneAccount(SqlSessionTemplate sqlSession, HashMap<String, String> hm) {
		List<GenderLedgerDTO> list = sqlSession.selectList("AccountBook.selectOneAccount", hm);
		
		return list;
	}

}
