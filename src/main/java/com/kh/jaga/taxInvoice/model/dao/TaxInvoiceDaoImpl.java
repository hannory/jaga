package com.kh.jaga.taxInvoice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.vo.Receiption;

@Repository
public class TaxInvoiceDaoImpl implements TaxInvoiceDao{

	@Override
	public List<Receiption> selectTListAll(SqlSessionTemplate sqlSession, Company com) {
		return sqlSession.selectList("TaxInvoice.selectTList", com);
	}

}
