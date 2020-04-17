package com.kh.jaga.slip.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.jaga.slip.model.exception.receiptionException;
import com.kh.jaga.slip.model.vo.AccountTitle;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Vender;

@Service
public interface ReceiptionService {
	List<Vender> selectVenderList() throws receiptionException 	;

	int insertReceiption(Receiption receiption);

	List<AccountTitle> selectAccountTitleList();
}
