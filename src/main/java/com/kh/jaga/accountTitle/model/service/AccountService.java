package com.kh.jaga.accountTitle.model.service;

import java.util.List;

import com.kh.jaga.accountTitle.model.vo.AccountTitle;

public interface AccountService {

	List<AccountTitle> selectAccountTitle();

	int insertAccountTitle(AccountTitle at);




}
