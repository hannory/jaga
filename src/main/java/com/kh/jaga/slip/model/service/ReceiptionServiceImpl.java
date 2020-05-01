package com.kh.jaga.slip.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.slip.model.dao.ReceiptionDao;
import com.kh.jaga.slip.model.exception.receiptionException;
import com.kh.jaga.slip.model.vo.AccountTitle;
import com.kh.jaga.slip.model.vo.NormalReceiptionDTO;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Vender;
import com.kh.jaga.taxInvoice.model.vo.TaxInvoice;

@Service
public class ReceiptionServiceImpl implements ReceiptionService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReceiptionDao receiptionDao;
	
	@Override
	public List<Vender> selectVenderList(String comCode) throws receiptionException {
		List<Vender> list = null;
		
		list = receiptionDao.selectVenderList(sqlSession, comCode);
		
		if(list == null) {
			throw new receiptionException("거래처 불러오기 실패!");
			
		}
		
		return list;
	}

	@Override
	public int insertReceiption(Receiption receiption) {
		int result = receiptionDao.insertReceiption(sqlSession, receiption);
		
		int result2 = 0;
		if(result > 0) {
			try {
				result2 = receiptionDao.insertJournalize(sqlSession, receiption.getJournalizeList());
				if(receiption.getEvidenceCode() != null) {
					if(receiption.getEvidenceCode().equals("10")) {
						//String slipCode = receiptionDao.selectSlipCode(sqlSession);
						TaxInvoice ti = new TaxInvoice();
						//ti.setSlipCode(slipCode);
						ti.setDivision(receiption.getDivision());
						ti.setVenderCode(receiption.getJournalizeList().get(0).getVenderCode());
						
						System.out.println("----------" + ti);
						
						int result3 = receiptionDao.insertTaxInvoice(sqlSession, ti);
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
					
		}
		
		
		
		
		return result2;
	}

	@Override
	public List<AccountTitle> selectAccountTitleList(String comCode) {
		List<AccountTitle> list = null;
		
		list = receiptionDao.selectAccountTitleList(sqlSession, comCode);
		
		
		return list;
	}

	@Override
	public List<NormalReceiptionDTO> selectNormalList(String comCode) {
		return receiptionDao.selectNormalList(sqlSession, comCode);
	}

	@Override
	public String selectDateSlipCode(Receiption rp) {
		return receiptionDao.selectDateSlipCode(sqlSession, rp);
	}

	@Override
	public List<NormalReceiptionDTO> selectNormalDateList(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return receiptionDao.selectNormalDateList(sqlSession, hm);
	}


}
