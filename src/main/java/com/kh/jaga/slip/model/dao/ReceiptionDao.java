package com.kh.jaga.slip.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.exception.receiptionException;
import com.kh.jaga.slip.model.vo.AccountTitle;
import com.kh.jaga.slip.model.vo.Journalize;
import com.kh.jaga.slip.model.vo.NormalReceiptionDTO;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Receiption2;
import com.kh.jaga.slip.model.vo.Vender;
import com.kh.jaga.taxInvoice.model.vo.TaxInvoice;

public interface ReceiptionDao {

	List<Vender> selectVenderList(SqlSessionTemplate sqlSession, String comCode) throws receiptionException;

	int insertReceiption(SqlSessionTemplate sqlSession, Receiption receiption);

	int insertJournalize(SqlSessionTemplate sqlSession, List<Journalize> journalizeList)  throws Exception ;

	List<AccountTitle> selectAccountTitleList(SqlSessionTemplate sqlSession, String comCode);

	String selectSlipCode(SqlSessionTemplate sqlSession);

	int insertTaxInvoice(SqlSessionTemplate sqlSession, TaxInvoice ti);

	List<NormalReceiptionDTO> selectNormalList(SqlSessionTemplate sqlSession, String comCode);

	String selectDateSlipCode(SqlSessionTemplate sqlSession, Receiption rp);

}
