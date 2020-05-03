package com.kh.jaga.taxInvoice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.taxInvoice.model.vo.TaxInvoicePrintDTO;

@Repository
public class TaxInvoiceDaoImpl implements TaxInvoiceDao{

	@Override
	public List<Receiption> selectTListAll(SqlSessionTemplate sqlSession, Company com) {
		String comCode = com.getCompanyCode();
		return sqlSession.selectList("TaxInvoice.selectTList", comCode);
	}

	@Override
	public TaxInvoicePrintDTO selectTaxInvoice(SqlSessionTemplate sqlSession, String slipCode) {
		return sqlSession.selectOne("TaxInvoice.selectTaxInvoice", slipCode);
	}

	@Override
	public int updatePrintStatus(SqlSessionTemplate sqlSession, String slipCode) {
		return sqlSession.update("TaxInvoice.updatePrintStatus", slipCode);
	}


}
