package com.kh.jaga.slip.model.service;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
		return receiptionDao.selectNormalDateList(sqlSession, hm);
	}

	@Override
	public List<Receiption> uploadExcel(MultipartFile excelFile) {
		List<Receiption> list = new ArrayList<Receiption>();
		
		try {
			OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
			XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
			
			XSSFSheet sheet = workbook.getSheetAt(0);
			
			for(int i = 1; i< sheet.getLastRowNum()+1; i++) {
				Receiption r = new Receiption();
				r.setSlipDivision("매입매출");
				XSSFRow row = sheet.getRow(i);
				
				if(row != null) {
					continue;
				}
				
				XSSFCell cell = row.getCell(0);
				
				if(cell != null) {
					r.setDivision(cell.getStringCellValue());
				}
				cell=row.getCell(1);
				
				if(cell != null) {
					
				}
				
			}
		} catch (InvalidFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return null;
	}


}
