package com.kh.jaga.accountBook.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.accountBook.model.vo.GenderLedgerDTO;
import com.kh.jaga.slip.model.vo.AccountTitle;

public interface AccountBookDao {

	List<AccountTitle> selectAccountList(SqlSessionTemplate sqlSession, String comCode);

	List<GenderLedgerDTO> selectOneAccount(SqlSessionTemplate sqlSession, HashMap<String, String> hm);

}
