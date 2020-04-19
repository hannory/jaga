package com.kh.jaga.accountTitle.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import com.kh.jaga.accountTitle.model.dao.AccountDao;
import com.kh.jaga.accountTitle.model.vo.AccountTitle;
@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AccountDao ad;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public List<AccountTitle> selectAccountTitle() {
		List<AccountTitle> list = ad.selectAccountTitle(sqlSession);
		
		if(list ==null) {
			System.out.println("리스트가 널이다");
		}
		return list;
	}

		
	}



	


