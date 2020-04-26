package com.kh.jaga.taxInvoice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.taxInvoice.model.vo.TaxInvoicePrintDTO;

public interface TaxInvoiceDao {

	List<Receiption> selectTListAll(SqlSessionTemplate sqlSession, Company com);

	TaxInvoicePrintDTO selectTaxInvoice(SqlSessionTemplate sqlSession, String slipCode);

	int updatePrintStatus(SqlSessionTemplate sqlSession, String slipCode);


}
