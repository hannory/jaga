package com.kh.jaga.slip.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.exception.receiptionException;
import com.kh.jaga.slip.model.vo.AccountTitle;
import com.kh.jaga.slip.model.vo.NormalReceiptionDTO;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Receiption2;
import com.kh.jaga.slip.model.vo.Vender;
import com.kh.jaga.taxInvoice.model.vo.TaxInvoice;

@Service
public interface ReceiptionService {
	List<Vender> selectVenderList(String comCode) throws receiptionException 	;

	int insertReceiption(Receiption receiption);

	List<AccountTitle> selectAccountTitleList(String comCode);

	List<NormalReceiptionDTO> selectNormalList(String comCode);

	String selectDateSlipCode(Receiption rp);

	List<NormalReceiptionDTO> selectNormalDateList(HashMap<String, Object> hm);

	List<Receiption2> uploadExcel(MultipartFile excelFile, String comCode);


}
