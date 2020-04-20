package com.kh.jaga.accountTitle.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.accountTitle.model.vo.AccountTitle;
@Repository
public class AccountDaoImpl implements AccountDao{
	@Override
	public List<AccountTitle> selectAccountTitle(SqlSessionTemplate sqlSession) {
			
		List<AccountTitle> list = sqlSession.selectList("AccountTitle.selectAccountTitleList");
			
			
		return list;
	}

	@Override
	public int insertAccountTitle(SqlSessionTemplate sqlSession, AccountTitle at) {
		
		return sqlSession.insert("AccountTitle.insertAccountTitle",at);
	}
}
