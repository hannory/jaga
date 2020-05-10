package com.kh.jaga.slip.model.service;

import java.io.IOException;
import java.math.BigDecimal;
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
import com.kh.jaga.slip.model.vo.Journalize;
import com.kh.jaga.slip.model.vo.NormalReceiptionDTO;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Receiption2;
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

	/**
	 *@comment 매출용이라고 합시다
	 */
	@Override
	public List<Receiption2> uploadExcel(MultipartFile excelFile, String comCode) {
		List<Receiption2> list = new ArrayList<Receiption2>();
		
		try {
			OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
			XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
			
			XSSFSheet sheet = workbook.getSheetAt(0);
			
			for(int i = 1; i< sheet.getLastRowNum()+1; i++) {
				Receiption2 r = new Receiption2();
				Journalize j = new Journalize();
				
				Journalize j2 = new Journalize();
				List<Journalize> listJ = new ArrayList<Journalize>();
				
				
				r.setSlipDivision("매입매출");
				XSSFRow row = sheet.getRow(i);
				
				if(row != null) {
					continue;
				}
				
				XSSFCell cell = row.getCell(0); /* 날짜 */
				if(cell != null) {
					r.setSlipDate(cell.getStringCellValue());
					System.out.println(cell.getStringCellValue());
				}
				
				cell = row.getCell(1); /* 구분 */
				if(cell != null) {
					r.setDivision(cell.getStringCellValue());
				}
				
				cell = row.getCell(2); /* 증빙종류 */
				if(cell != null) {
					r.setEvidenceCode(cell.getStringCellValue());
				}
				
				cell = row.getCell(3); /* 거래처코드 */
				if(cell != null) {
					j.setVenderCode(cell.getStringCellValue());
					j2.setVenderCode(cell.getStringCellValue());
					
					String venderName = receiptionDao.selectVenderName(sqlSession, cell.getStringCellValue());
					j.setVenderName(venderName);
					j2.setVenderName(venderName);
				}
				
				BigDecimal supplyValue = null;
				cell = row.getCell(4); /* 공급가액 */
				if(cell != null) {
					supplyValue = new BigDecimal(cell.getStringCellValue());
					r.setSupplyValue(supplyValue);
					j2.setPrice(supplyValue);
				}
				
				BigDecimal taxValue = null;
				cell = row.getCell(5); /* 부가세 */
				if(cell != null) {
					taxValue = new BigDecimal(cell.getStringCellValue());
					r.setValueTax(taxValue);
					
					BigDecimal deaga = supplyValue.add(taxValue);
					
					j.setPrice(deaga);
					
					if(!cell.getStringCellValue().equals("0")) {
						Journalize j3 = new Journalize();
						j3.setDebitCredit("대변");
						j3.setAccountCode("25500");
						j3.setVenderCode(row.getCell(3).getStringCellValue());
						j3.setVenderName(j.getVenderName());
						j3.setPrice(taxValue);
						listJ.add(j3);
					}
				}
				
				cell = row.getCell(6);
				if(cell != null) {
					j.setAccountCode(cell.getStringCellValue());
					j.setDebitCredit("차변");
				}
				
				cell = row.getCell(7);
				if(cell != null) {
					j2.setAccountCode(cell.getStringCellValue());
					j2.setDebitCredit("대변");
				}
				
				cell = row.getCell(8);
				if(cell != null) {
					r.setItem(cell.getStringCellValue());
				}
				
				cell = row.getCell(9);
				if(cell != null) {
					r.setDeemedStatus(cell.getStringCellValue());
				}
				
				
				String dateSlipCode = receiptionDao.selectDateSlipCode(sqlSession, r);
				if(dateSlipCode == null) {
					dateSlipCode = "50001";
				}else {
					dateSlipCode = (Integer.parseInt(dateSlipCode)+1) + "";
				}
				r.setDateSlipCode(dateSlipCode);
				
				listJ.add(j);
				listJ.add(j2);
				
				list.add(r);
				
			}
		} catch (InvalidFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return list;
	}


}
