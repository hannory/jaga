package com.kh.jaga.accountTitle.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.accountTitle.model.vo.AccountTitle;

public interface AccountDao {

	List<AccountTitle> selectAccountTitle(SqlSessionTemplate sqlSession);

	int insertAccountTitle(SqlSessionTemplate sqlSession, AccountTitle at);



}
