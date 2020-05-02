package com.kh.jaga.accountBook.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.jaga.accountBook.model.vo.GenderLedgerDTO;
import com.kh.jaga.slip.model.vo.AccountTitle;

public interface AccountBookService {

	List<AccountTitle> selectAccountList(String comCode);

	List<GenderLedgerDTO> selectOneAccount(HashMap<String, String> hm);

}
