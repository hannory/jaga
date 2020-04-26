package com.kh.jaga.taxInvoice.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.taxInvoice.model.dao.TaxInvoiceDao;
import com.kh.jaga.taxInvoice.model.vo.TaxInvoicePrintDTO;

@Service
public class TaxInvoiceServiceImpl implements TaxInvoiceService{
	@Autowired
	private TaxInvoiceDao tid;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Receiption> selectTListAll(Company com) {
		return tid.selectTListAll(sqlSession, com);
	}

	@Override
	public TaxInvoicePrintDTO selectTaxInvoice(String slipCode) {
		return tid.selectTaxInvoice(sqlSession, slipCode);
	}

	@Override
	public int updatePrintStatus(String slipCode) {
		return tid.updatePrintStatus(sqlSession, slipCode);
	}

}
