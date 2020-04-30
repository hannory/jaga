package com.kh.jaga.slip.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.exception.receiptionException;
import com.kh.jaga.slip.model.vo.AccountTitle;
import com.kh.jaga.slip.model.vo.Journalize;
import com.kh.jaga.slip.model.vo.NormalReceiptionDTO;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Receiption2;
import com.kh.jaga.slip.model.vo.Vender;
import com.kh.jaga.taxInvoice.model.vo.TaxInvoice;

@Repository
public class ReceiptionDaoImpl implements ReceiptionDao {

	@Override
	public List<Vender> selectVenderList(SqlSessionTemplate sqlSession, String comCode) throws receiptionException {
		List<Vender> list = sqlSession.selectList("Receiption.selectVenderList", comCode);
		
		if(list == null) {
			throw new receiptionException("거래처리스트출력실패!!");
		}
		
		return list;
	}

	@Override
	public int insertReceiption(SqlSessionTemplate sqlSession, Receiption receiption) {
		
			
		return sqlSession.insert("Receiption.insertReceiption", receiption);
	}

	@Override
	public int insertJournalize(SqlSessionTemplate sqlSession, List<Journalize> journalizeList) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("daoList 출력 --------- : " + journalizeList);
		
		
		int result = 0;
		for(int i = 0; i < journalizeList.size(); i++) {
			result = sqlSession.insert("Receiption.insertJournalize", journalizeList.get(i));
		}
		
		return result;
	}

	@Override
	public List<AccountTitle> selectAccountTitleList(SqlSessionTemplate sqlSession, String comCode) {
		List<AccountTitle> list = sqlSession.selectList("Receiption.selectAccountTitleList", comCode);
		
		
		return list;
	}

	@Override
	public String selectSlipCode(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("Receiption.selectSlipCode");
	}

	@Override
	public int insertTaxInvoice(SqlSessionTemplate sqlSession, TaxInvoice ti) {
		return sqlSession.insert("Receiption.insertTaxInvoice", ti);
	}

	@Override
	public List<NormalReceiptionDTO> selectNormalList(SqlSessionTemplate sqlSession, String comCode) {
		return sqlSession.selectList("Receiption.selectNomalSlip", comCode);
	}

	@Override
	public String selectDateSlipCode(SqlSessionTemplate sqlSession, Receiption rp) {
		
		
		return sqlSession.selectOne("Receiption.selectDSCode", rp);
	}
	
}
