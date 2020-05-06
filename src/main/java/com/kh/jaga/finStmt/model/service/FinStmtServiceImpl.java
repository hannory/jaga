package com.kh.jaga.finStmt.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.jaga.finStmt.model.dao.FinStmtDao;
import com.kh.jaga.finStmt.model.dao.FinStmtDaoImpl;
import com.kh.jaga.finStmt.model.vo.IncomeStmt;
import com.kh.jaga.finStmt.model.vo.IncomeStmtAccount;
import com.kh.jaga.finStmt.model.vo.MfrgStmt;

@Service
public class FinStmtServiceImpl implements FinStmtService {
	@Autowired
	private FinStmtDao fsd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertIncomeStmt(IncomeStmt is) {
		
		int selectResult = fsd.countSavedIncomeStmt(sqlSession, is);
		
		if(selectResult > 0) {
			return fsd.updateIncomeStmt(sqlSession, is);
		} else {
			return fsd.insertIncomeStmt(sqlSession, is);
		}
		
	}

	@Override
	public HashMap selectIncomeStmt(IncomeStmtAccount isa) {
		//당기
		List cList = fsd.selectCurFinStmt(sqlSession, isa);
		
		long cSum14600 = 0;		//당기상품매입액
		long cSum40100 = 0;		//상품매출
		long cSum40400 = 0;		//제품매출
		long cSum81100 = 0;		//복리후생비
		long cSum83000 = 0;		//소모품비
		long cSum83100 = 0;		//수수료비용
		
		for(int i = 0; i < cList.size(); i++) {
			int accountCode = ((IncomeStmtAccount) cList.get(i)).getAccountCode();
			long price = ((IncomeStmtAccount) cList.get(i)).getPrice();
			
			if(accountCode == 14600) {
				cSum14600 += price;
			} else if(accountCode == 40100) {
				cSum40100 += price;
			} else if(accountCode == 40400) {
				cSum40400 += price;
			} else if(accountCode == 81100) {
				cSum81100 += price;
			} else if(accountCode == 83000) {
				cSum83000 += price;
			} else if(accountCode == 83100) {
				cSum83100 += price;
			}
		}
		
		int cVal222 = fsd.selectMfrgSum90(sqlSession, isa);		//당기제품제조원가
		
		
		//전기
		List pList = fsd.selectPastFinStmt(sqlSession, isa);
		
		long pSum14600 = 0;		//당기상품매입액
		long pSum40100 = 0;		//상품매출
		long pSum40400 = 0;		//제품매출
		long pSum81100 = 0;		//복리후생비
		long pSum83000 = 0;		//소모품비
		long pSum83100 = 0;		//수수료비용
		
		for(int i = 0; i < pList.size(); i++) {
			int accountCode = ((IncomeStmtAccount) pList.get(i)).getAccountCode();
			long price = ((IncomeStmtAccount) pList.get(i)).getPrice();
			
			if(accountCode == 14600) {
				pSum14600 += price;
			} else if(accountCode == 40100) {
				pSum40100 += price;
			} else if(accountCode == 40400) {
				pSum40400 += price;
			} else if(accountCode == 81100) {
				pSum81100 += price;
			} else if(accountCode == 83000) {
				pSum83000 += price;
			} else if(accountCode == 83100) {
				pSum83100 += price;
			}
		}
		
		HashMap hmap = new HashMap();
		hmap.put("c14600", cSum14600);
		hmap.put("c40100", cSum40100);
		hmap.put("c40400", cSum40400);
		hmap.put("c81100", cSum81100);
		hmap.put("c83000", cSum83000);
		hmap.put("c83100", cSum83100);
		hmap.put("cVal222", cVal222);
		
		hmap.put("p14600", pSum14600);
		hmap.put("p40100", pSum40100);
		hmap.put("p40400", pSum40400);
		hmap.put("p81100", pSum81100);
		hmap.put("p83000", pSum83000);
		hmap.put("p83100", pSum83100);
		
		return hmap;
	}

	@Override
	public ArrayList<IncomeStmtAccount> selectSlip(IncomeStmtAccount isa) {

		ArrayList list;
		
		if(isa.getCurPast().equals("c")) {
			//당기일 경우
			list = fsd.selectSlip(sqlSession, isa);
		} else {
			//전기일 경우
			int curYear = isa.getYear();
			isa.setYear(curYear - 1);
			isa.setMonth(12);
			isa.setDate(31);
			list = fsd.selectSlip(sqlSession, isa);
		}
		
		return list;
	}
	
	//재무상태표일 경우 원장조회
	@Override
	public ArrayList selectSlipByDate(IncomeStmtAccount isa, String accountClass) {

		ArrayList<Integer> accountArr = new ArrayList<Integer>();
		
		//재무상태표
		if(accountClass.equals("Cash")) {
			accountArr.add(10100);
			accountArr.add(10200);
			accountArr.add(10300);
			accountArr.add(10400);
		} else if(accountClass.equals("ShortTermInv")) {
			accountArr.add(10500);
			accountArr.add(10600);
			accountArr.add(10700);
		} else if(accountClass.equals("AccountRecievable")) {
			accountArr.add(10800);
			accountArr.add(11000);
			accountArr.add(11200);
		} else if(accountClass.equals("NonTradeRecievable")) {
			accountArr.add(12000);
		} else if(accountClass.equals("VatPayment")) {
			accountArr.add(13500);
		} else if(accountClass.equals("Merchandises")) {
			accountArr.add(14600);
		} else if(accountClass.equals("FinishedGoods")) {
			accountArr.add(15000);
		} else if(accountClass.equals("RawMaterials")) {
			accountArr.add(15300);
		} else if(accountClass.equals("WorkInProcess")) {
			accountArr.add(16900);
		} else if(accountClass.equals("LongInvSecurities")) {
			accountArr.add(17800);
		} else if(accountClass.equals("OfficeEquipment")) {
			accountArr.add(21200);
		} else if(accountClass.equals("AccountPayables")) {
			accountArr.add(25100);
			accountArr.add(25200);
		} else if(accountClass.equals("NonTradePayables")) {
			accountArr.add(25300);
		} else if(accountClass.equals("Witholdings")) {
			accountArr.add(25400);
		} else if(accountClass.equals("VatDeposit")) {
			accountArr.add(25500);
		} else if(accountClass.equals("LongBorrowings")) {
			accountArr.add(29300);
		} else if(accountClass.equals("RetirementLiabilities")) {
			accountArr.add(29500);
			accountArr.add(29600);
		} else if(accountClass.equals("CapitalStock")) {
			accountArr.add(33100);
		} 
		
		isa.setAccountArr(accountArr);
		
		ArrayList list;
		
		if(isa.getCurPast().equals("c")) {
			//당기일 경우
			list = fsd.selectSlipByDate(sqlSession, isa);
		} else {
			//전기일 경우
			int curYear = isa.getYear();
			isa.setYear(curYear - 1);
			isa.setMonth(12);
			isa.setDate(31);
			list = fsd.selectSlipByDate(sqlSession, isa);
		}
		
		return list;
	}

	@Override
	public HashMap selectMfrgStmt(IncomeStmtAccount isa) {
		//당기
		List cList = fsd.selectCurFinStmt(sqlSession, isa);
		
		long cSum15300 = 0;		//원재료
		long cSum51100 = 0;		//복리후생비
		long cSum53000 = 0;		//소모품비
		
		for(int i = 0; i < cList.size(); i++) {
			int accountCode = ((IncomeStmtAccount) cList.get(i)).getAccountCode();
			long price = ((IncomeStmtAccount) cList.get(i)).getPrice();
			
			if(accountCode == 15300) {
				cSum15300 += price;
			} else if(accountCode == 51100) {
				cSum51100 += price;
			} else if(accountCode == 53000) {
				cSum53000 += price;
			}
		}
		
		//전기
		List pList = fsd.selectPastFinStmt(sqlSession, isa);
		
		long pSum15300 = 0;		//원재료
		long pSum51100 = 0;		//복리후생비
		long pSum53000 = 0;		//소모품비
		
		for(int i = 0; i < pList.size(); i++) {
			int accountCode = ((IncomeStmtAccount) pList.get(i)).getAccountCode();
			long price = ((IncomeStmtAccount) pList.get(i)).getPrice();
			
			if(accountCode == 15300) {
				pSum15300 += price;
			} else if(accountCode == 51100) {
				pSum51100 += price;
			} else if(accountCode == 53000) {
				pSum53000 += price;
			}
		}
		
		HashMap hmap = new HashMap();
		hmap.put("c15300", cSum15300);
		hmap.put("c51100", cSum51100);
		hmap.put("c53000", cSum53000);
		
		hmap.put("p15300", pSum15300);
		hmap.put("p51100", pSum51100);
		hmap.put("p53000", pSum53000);
		
		return hmap;
	}

	@Override
	public int insertMfrgStmt(MfrgStmt ms) {
		
		//기존 저장값 확인
		int selectResult = fsd.countSavedMfrgStmt(sqlSession, ms);
		
		if(selectResult > 0) {
			//기존 저장 값이 있으면
			return fsd.updateMfrgStmt(sqlSession, ms);
		} else {
			//기존 저장 값이 없거나 마감을 하려면
			return fsd.insertMfrgStmt(sqlSession, ms);
		}
		
	}

	@Override
	public MfrgStmt searchMfrg(MfrgStmt ms) {
		
		int count = fsd.countMfrgStmt(sqlSession, ms);
		
		System.out.println("count Service : " + count);
		
		if(count > 0) {
			return fsd.searchMfrg(sqlSession, ms);
		} else {
			return null;
		}
		
	}

	@Override
	public int countMfrgStmt(MfrgStmt ms) {
		//기존 저장값이나 마감값이 있는지 확인
		return fsd.countMfrgStmt(sqlSession, ms);
	}

	@Override
	public HashMap selectFinPos(IncomeStmtAccount isa) {
		//당기
		List<IncomeStmtAccount> cList = fsd.selectCurFinStmtByDate(sqlSession, isa);
		
		long cCash = 0;					//현금및현금성자산
		long cShortTermInv = 0;			//단기투자자산
		long cAccountRecievable = 0;		//매출채권
		long cNonTradeRecievable = 0;	//미수금
		long cVatPayment = 0;			//부가세대급금
		long cMerchandises = 0;			//상품
		long cFinishedGoods = 0;			//제품
		long cRawMaterials = 0;			//원재료
		long cWorkInProcess = 0;			//재공품
		long cLongInvSecurities = 0;		//장기투자증권
		long cOfficeEquipment = 0;		//비품
		long cAccountPayables = 0;		//매입채무
		long cNonTradePayables = 0;		//미지급금
		long cWitholdings = 0;			//예수금
		long cVatDeposit = 0;			//부가세예수금
		long cLongBorrowings = 0;		//장기차입금
		long cRetirementLiabilities = 0;	//퇴직급여충당부채
		long cCapitalStock = 0;			//자본금
		
		for(int i = 0; i < cList.size(); i++) {
			int accountCode = ((IncomeStmtAccount) cList.get(i)).getAccountCode();
			String debitCredit = ((IncomeStmtAccount) cList.get(i)).getDebitCredit();
			long price = ((IncomeStmtAccount) cList.get(i)).getPrice();
			
			//------------- 자산 --------------
			//현금및현금성자산 = 현금 + 당좌예금 + 보통예금 + 기타제예금
			if(accountCode == 10100 || accountCode == 10200 || accountCode == 10300 || accountCode == 10400) {
				if(debitCredit.equals("차변")) {
					cCash += price;
				} else {
					cCash -= price;
				}
			//단기투자자산 = 정기예적금 + 기타단기금융상품 + 유가증권
			} else if(accountCode == 10500 || accountCode == 10600 || accountCode == 10700) {
				if(debitCredit.equals("차변")) {
					cShortTermInv += price;
				} else {
					cShortTermInv -= price;
				}
			//매출채권 = 외상매출금 + 받을어음 + 공사미수금
			} else if(accountCode == 10800 || accountCode == 11000 || accountCode == 11200) {
				if(debitCredit.equals("차변")) {
					cAccountRecievable += price;
				} else {
					cAccountRecievable -= price;
				}
			//미수금
			} else if(accountCode == 12000) {
				if(debitCredit.equals("차변")) {
					cNonTradeRecievable += price;
				} else {
					cNonTradeRecievable -= price;
				}
			//부가세대급금
			} else if(accountCode == 13500) {
				if(debitCredit.equals("차변")) {
					cVatPayment += price;
				} else {
					cVatPayment -= price;
				}
			//상품
			} else if(accountCode == 14600) {
				if(debitCredit.equals("차변")) {
					cMerchandises += price;
				} else {
					cMerchandises -= price;
				}
			//제품
			} else if(accountCode == 15000) {
				if(debitCredit.equals("차변")) {
					cFinishedGoods += price;
				} else {
					cFinishedGoods -= price;
				}
			//원재료
			} else if(accountCode == 15300) {
				if(debitCredit.equals("차변")) {
					cRawMaterials += price;
				} else {
					cRawMaterials -= price;
				}
			//재공품
			} else if(accountCode == 16900) {
				if(debitCredit.equals("차변")) {
					cWorkInProcess += price;
				} else {
					cWorkInProcess -= price;
				}
			//장기투자증권
			} else if(accountCode == 17800) {
				if(debitCredit.equals("차변")) {
					cLongInvSecurities += price;
				} else {
					cLongInvSecurities -= price;
				}
			//비품
			} else if(accountCode == 21200) {
				if(debitCredit.equals("차변")) {
					cOfficeEquipment += price;
				} else {
					cOfficeEquipment -= price;
				}
			//------------- 부채와 자본 --------------
			//매입채무 = 외상매입금 + 지급어음
			} else if(accountCode == 25100 || accountCode == 25200) {
				if(debitCredit.equals("대변")) {
					cAccountPayables += price;
				} else {
					cAccountPayables -= price;
				}
			//미지급금
			} else if(accountCode == 25300) {
				if(debitCredit.equals("대변")) {
					cNonTradePayables += price;
				} else {
					cNonTradePayables -= price;
				}
			//예수금
			} else if(accountCode == 25400) {
				if(debitCredit.equals("대변")) {
					cWitholdings += price;
				} else {
					cWitholdings -= price;
				}
			//부가세예수금
			} else if(accountCode == 25500) {
				if(debitCredit.equals("대변")) {
					cVatDeposit += price;
				} else {
					cVatDeposit -= price;
				}
			//장기차입금
			} else if(accountCode == 29300) {
				if(debitCredit.equals("대변")) {
					cLongBorrowings += price;
				} else {
					cLongBorrowings -= price;
				}
			//퇴직급여충당부채
			} else if(accountCode == 29500 || accountCode == 29600) {
				if(debitCredit.equals("대변")) {
					cRetirementLiabilities += price;
				} else {
					cRetirementLiabilities -= price;
				}
			//자본금
			} else if(accountCode == 33100) {
				if(debitCredit.equals("대변")) {
					cCapitalStock += price;
				} else {
					cCapitalStock -= price;
				}
				
				System.out.println("CHECK : 33100 = " + cCapitalStock) ;
			}
			
		}
		
		//전기
		List pList = fsd.selectPastFinStmtByDate(sqlSession, isa);
		
		long pCash = 0;					//현금및현금성자산
		long pShortTermInv = 0;			//단기투자자산
		long pAccountRecievable = 0;		//매출채권
		long pNonTradeRecievable = 0;	//미수금
		long pVatPayment = 0;			//부가세대급금
		long pMerchandises = 0;			//상품
		long pFinishedGoods = 0;			//제품
		long pRawMaterials = 0;			//원재료
		long pWorkInProcess = 0;			//재공품
		long pLongInvSecurities = 0;		//장기투자증권
		long pOfficeEquipment = 0;		//비품
		long pAccountPayables = 0;		//매입채무
		long pNonTradePayables = 0;		//미지급금
		long pWitholdings = 0;			//예수금
		long pVatDeposit = 0;			//부가세예수금
		long pLongBorrowings = 0;		//장기차입금
		long pRetirementLiabilities = 0;	//퇴직급여충당부채
		long pCapitalStock = 0;			//자본금

		for(int i = 0; i < pList.size(); i++) {
			int accountCode = ((IncomeStmtAccount) pList.get(i)).getAccountCode();
			String debitCredit = ((IncomeStmtAccount) pList.get(i)).getDebitCredit();
			long price = ((IncomeStmtAccount) pList.get(i)).getPrice();
			
			//-------------자산--------------
			//현금및현금성자산 == 현금 + 당좌예금 + 보통예금 + 기타제예금
			if(accountCode == 10100 || accountCode == 10200 || accountCode == 10300 || accountCode == 10400) {
				if(debitCredit.equals("차변")) {
					pCash += price;
				} else {
					pCash -= price;
				}
			//단기투자자산 == 정기예적금 + 기타단기금융상품 + 유가증권
			} else if(accountCode == 10500 || accountCode == 10600 || accountCode == 10700) {
				if(debitCredit.equals("차변")) {
					pShortTermInv += price;
				} else {
					pShortTermInv -= price;
				}
			//매출채권 == 외상매출금 + 받을어음 + 공사미수금
			} else if(accountCode == 10800 || accountCode == 11000 || accountCode == 11200) {
				if(debitCredit.equals("차변")) {
					pAccountRecievable += price;
				} else {
					pAccountRecievable -= price;
				}
			//미수금
			} else if(accountCode == 12000) {
				if(debitCredit.equals("차변")) {
					pNonTradeRecievable += price;
				} else {
					pNonTradeRecievable -= price;
				}
			//부가세대급금
			} else if(accountCode == 13500) {
				if(debitCredit.equals("차변")) {
					pVatPayment += price;
				} else {
					pVatPayment -= price;
				}
			//상품
			} else if(accountCode == 14600) {
				if(debitCredit.equals("차변")) {
					pMerchandises += price;
				} else {
					pMerchandises -= price;
				}
			//제품
			} else if(accountCode == 15000) {
				if(debitCredit.equals("차변")) {
					pFinishedGoods += price;
				} else {
					pFinishedGoods -= price;
				}
			//원재료
			} else if(accountCode == 15300) {
				if(debitCredit.equals("차변")) {
					pRawMaterials += price;
				} else {
					pRawMaterials -= price;
				}
			//재공품
			} else if(accountCode == 16900) {
				if(debitCredit.equals("차변")) {
					pWorkInProcess += price;
				} else {
					pWorkInProcess -= price;
				}
			//장기투자증권
			} else if(accountCode == 17800) {
				if(debitCredit.equals("차변")) {
					pLongInvSecurities += price;
				} else {
					pLongInvSecurities -= price;
				}
			//비품
			} else if(accountCode == 21200) {
				if(debitCredit.equals("차변")) {
					pOfficeEquipment += price;
				} else {
					pOfficeEquipment -= price;
				}
			//------------- 부채와 자본 --------------
			//매입채무 = 외상매입금 + 지급어음
			} else if(accountCode == 25100 || accountCode == 25200) {
				if(debitCredit.equals("대변")) {
					pAccountPayables += price;
				} else {
					pAccountPayables -= price;
				}
			//미지급금
			} else if(accountCode == 25300) {
				if(debitCredit.equals("대변")) {
					pNonTradePayables += price;
				} else {
					pNonTradePayables -= price;
				}
			//예수금
			} else if(accountCode == 25400) {
				if(debitCredit.equals("대변")) {
					pWitholdings += price;
				} else {
					pWitholdings -= price;
				}
			//부가세예수금
			} else if(accountCode == 25500) {
				if(debitCredit.equals("대변")) {
					pVatDeposit += price;
				} else {
					pVatDeposit -= price;
				}
			//장기차입금
			} else if(accountCode == 29300) {
				if(debitCredit.equals("대변")) {
					pLongBorrowings += price;
				} else {
					pLongBorrowings -= price;
				}
			//퇴직급여충당부채
			} else if(accountCode == 29500 || accountCode == 29600) {
				if(debitCredit.equals("대변")) {
					pRetirementLiabilities += price;
				} else {
					pRetirementLiabilities -= price;
				}
			//자본금
			} else if(accountCode == 33100) {
				if(debitCredit.equals("대변")) {
					pCapitalStock += price;
				} else {
					pCapitalStock -= price;
				}
			}
		}
		
		HashMap<String, Long> hmap = new HashMap<String, Long>();
		hmap.put("cCash", cCash);
		hmap.put("cShortTermInv", cShortTermInv);
		hmap.put("cAccountRecievable", cAccountRecievable);
		hmap.put("cNonTradeRecievable", cNonTradeRecievable);
		hmap.put("cVatPayment", cVatPayment);
		hmap.put("cMerchandises", cMerchandises);
		hmap.put("cFinishedGoods", cFinishedGoods);
		hmap.put("cRawMaterials", cRawMaterials);
		hmap.put("cWorkInProcess", cWorkInProcess);
		hmap.put("cLongInvSecurities", cLongInvSecurities);
		hmap.put("cOfficeEquipment", cOfficeEquipment);
		hmap.put("cAccountPayables", cAccountPayables);
		hmap.put("cNonTradePayables", cNonTradePayables);
		hmap.put("cWitholdings", cWitholdings);
		hmap.put("cVatDeposit", cVatDeposit);
		hmap.put("cLongBorrowings", cLongBorrowings);
		hmap.put("cRetirementLiabilities", cRetirementLiabilities);
		hmap.put("cCapitalStock", cCapitalStock);
		
		hmap.put("pCash", pCash);
		hmap.put("pShortTermInv", pShortTermInv);
		hmap.put("pAccountRecievable", pAccountRecievable);
		hmap.put("pNonTradeRecievable", pNonTradeRecievable);
		hmap.put("pVatPayment", pVatPayment);
		hmap.put("pMerchandises", pMerchandises);
		hmap.put("pFinishedGoods", pFinishedGoods);
		hmap.put("pRawMaterials", pRawMaterials);
		hmap.put("pWorkInProcess", pWorkInProcess);
		hmap.put("pLongInvSecurities", pLongInvSecurities);
		hmap.put("pOfficeEquipment", pOfficeEquipment);
		hmap.put("pAccountPayables", pAccountPayables);
		hmap.put("pNonTradePayables", pNonTradePayables);
		hmap.put("pWitholdings", pWitholdings);
		hmap.put("pVatDeposit", pVatDeposit);
		hmap.put("pLongBorrowings", pLongBorrowings);
		hmap.put("pRetirementLiabilities", pRetirementLiabilities);
		hmap.put("pCapitalStock", pCapitalStock);
		
		return hmap;
	}

	@Override
	public int countClosedMfrg(MfrgStmt ms) {

		return fsd.countClosedMfrg(sqlSession, ms);
	}

	@Override
	public int countIncomeStmt(IncomeStmt is) {

		return fsd.countIncomeStmt(sqlSession, is);
	}

	@Override
	public IncomeStmt searchIncomeStmt(IncomeStmt is) {
		
		int count = fsd.countIncomeStmt(sqlSession, is);
		
		if(count > 0) {
			return fsd.searchIncomeStmt(sqlSession, is);
		} else {
			return null;
		}

	}

	@Override
	public int countClosedIncomeStmt(IncomeStmt is) {
	
		return fsd.countClosedIncometStmt(sqlSession, is);
	}

	
	

}






