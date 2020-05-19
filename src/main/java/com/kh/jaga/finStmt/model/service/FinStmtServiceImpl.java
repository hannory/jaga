package com.kh.jaga.finStmt.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.jaga.finStmt.model.dao.FinStmtDao;
import com.kh.jaga.finStmt.model.dao.FinStmtDaoImpl;
import com.kh.jaga.finStmt.model.vo.FinStmtAccount;
import com.kh.jaga.finStmt.model.vo.IncomeStmt;
import com.kh.jaga.finStmt.model.vo.FinStmtAccount;
import com.kh.jaga.finStmt.model.vo.MfrgStmt;

@Service
public class FinStmtServiceImpl implements FinStmtService {
	@Autowired
	private FinStmtDao fsd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public int insertIncomeStmt(IncomeStmt is) {
		
		//전기 입력
		int selectLastResult = fsd.countSavedIncomeStmt(sqlSession, is);
		
		if(selectLastResult > 0) {
			
			fsd.updateLastIncomeStmt(sqlSession, is);
		} else {

			fsd.insertLastIncomeStmt(sqlSession, is);
		}
		
		//당기 입력
		int selectCurrentResult = fsd.countSavedIncomeStmt(sqlSession, is);

		if(selectCurrentResult > 0) {
			
			return fsd.updateIncomeStmt(sqlSession, is);
		} else {
			
			return fsd.insertIncomeStmt(sqlSession, is);
		}
		
	}

	@Override
	public HashMap selectIncomeStmt(FinStmtAccount fsa) {
		//당기
		List cList = fsd.selectCurFinStmt(sqlSession, fsa);
		
		long cSum14600 = 0;		//당기상품매입액
		long cSum40100 = 0;		//상품매출
		long cSum40400 = 0;		//제품매출
		long cSum80200 = 0;		//급여
		long cSum80300 = 0;		//상여금
		long cSum81100 = 0;		//복리후생비
		long cSum81300 = 0;		//접대비
		long cSum83000 = 0;		//소모품비
		long cSum83100 = 0;		//수수료비용
		
		for(int i = 0; i < cList.size(); i++) {
			int accountCode = ((FinStmtAccount) cList.get(i)).getAccountCode();
			long price = ((FinStmtAccount) cList.get(i)).getPrice();
			
			if(accountCode == 14600) {
				cSum14600 += price;
			} else if(accountCode == 40100) {
				cSum40100 += price;
			} else if(accountCode == 40400) {
				cSum40400 += price;
			} else if(accountCode == 80200) {
				cSum80200 += price;
			} else if(accountCode == 80300) {
				cSum80300 += price;
			} else if(accountCode == 81100) {
				cSum81100 += price;
			} else if(accountCode == 81300) {
				cSum81300 += price;
			} else if(accountCode == 83000) {
				cSum83000 += price;
			} else if(accountCode == 83100) {
				cSum83100 += price;
			}
		}
		
		int cVal222 = fsd.selectMfrgSum90(sqlSession, fsa);		//당기제품제조원가
		
		
		//전기
		List pList = fsd.selectPastFinStmt(sqlSession, fsa);
		
		long pSum14600 = 0;		//당기상품매입액
		long pSum40100 = 0;		//상품매출
		long pSum40400 = 0;		//제품매출
		long pSum80200 = 0;		//급여
		long pSum80300 = 0;		//상여금
		long pSum81100 = 0;		//복리후생비
		long pSum81300 = 0;		//접대비
		long pSum83000 = 0;		//소모품비
		long pSum83100 = 0;		//수수료비용
		
		for(int i = 0; i < pList.size(); i++) {
			int accountCode = ((FinStmtAccount) pList.get(i)).getAccountCode();
			long price = ((FinStmtAccount) pList.get(i)).getPrice();
			
			if(accountCode == 14600) {
				pSum14600 += price;
			} else if(accountCode == 40100) {
				pSum40100 += price;
			} else if(accountCode == 40400) {
				pSum40400 += price;
			} else if(accountCode == 80200) {
				pSum80200 += price;
			} else if(accountCode == 80300) {
				pSum80300 += price;
			} else if(accountCode == 81100) {
				pSum81100 += price;
			} else if(accountCode == 81300) {
				pSum81300 += price;
			} else if(accountCode == 83000) {
				pSum83000 += price;
			} else if(accountCode == 83100) {
				pSum83100 += price;
			}
		}
		
		
		fsa.setYear(fsa.getYear() - 1);									
		int pVal222 = fsd.selectMfrgSum90(sqlSession, fsa);		//전기제품제조원가
		
		HashMap hmap = new HashMap();
		hmap.put("c14600", cSum14600);
		hmap.put("c40100", cSum40100);
		hmap.put("c40400", cSum40400);
		hmap.put("c80200", cSum80200);
		hmap.put("c80300", cSum80300);
		hmap.put("c81100", cSum81100);
		hmap.put("c81300", cSum81300);
		hmap.put("c83000", cSum83000);
		hmap.put("c83100", cSum83100);
		hmap.put("cVal222", cVal222);
		
		hmap.put("p14600", pSum14600);
		hmap.put("p40100", pSum40100);
		hmap.put("p40400", pSum40400);
		hmap.put("p80200", pSum80200);
		hmap.put("p80300", pSum80300);
		hmap.put("p81100", pSum81100);
		hmap.put("p81300", pSum81300);
		hmap.put("p83000", pSum83000);
		hmap.put("p83100", pSum83100);
		hmap.put("pVal222", pVal222);
		
		return hmap;
	}

	@Override
	public ArrayList<FinStmtAccount> selectSlip(FinStmtAccount fsa) {

		ArrayList list;
		
		if(fsa.getCurPast().equals("c")) {
			//당기일 경우
			list = fsd.selectSlip(sqlSession, fsa);
		} else {
			//전기일 경우
			int curYear = fsa.getYear();
			fsa.setYear(curYear - 1);
			fsa.setMonth(12);
			fsa.setDate(31);
			list = fsd.selectSlip(sqlSession, fsa);
		}
		
		return list;
	}
	
	//합계잔액시산표일 경우 원장조회
	@Override
	public ArrayList<FinStmtAccount> selectSlipByDate(FinStmtAccount fsa) {

		ArrayList<Integer> accountArr = new ArrayList<Integer>();
		
		if(fsa.getAccountCode() != 10100) {
			accountArr.add(fsa.getAccountCode());
		//현금과현금성자산
		} else {
			accountArr.add(10100);
			accountArr.add(10200);
			accountArr.add(10300);
			accountArr.add(10400);
		}
		
		fsa.setAccountArr(accountArr);
		
		ArrayList list = fsd.selectSlipByDateWithArr(sqlSession, fsa);
		
		return list;
	}
	
	//재무상태표일 경우 원장조회
	@Override
	public ArrayList selectSlipByDateWithArr(FinStmtAccount fsa, String accountClass) {

		ArrayList<Integer> accountArr = new ArrayList<Integer>();
		
		//재무상태표 ------------------자산
		//현금과 현금성 자산
		if(accountClass.equals("Cash")) {
			accountArr.add(10100);		//현금
			accountArr.add(10200);		//당좌예금
			accountArr.add(10300);		//보통예끔
			accountArr.add(10400);		//기타제예금
		//단기투자자산
		} else if(accountClass.equals("ShortTermInv")) {
			accountArr.add(10500);		//정기예적금
			accountArr.add(10600);		//기타단기금융상품
			accountArr.add(10700);		//유가증권
		//매출채권
		} else if(accountClass.equals("AccountRecievable")) {
			accountArr.add(10800);		//외상매출금
			accountArr.add(11000);		//받을어음
			accountArr.add(11200);		//공사미수금
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
		//재무상태표 ------------------부채와 자본
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
		
		fsa.setAccountArr(accountArr);
		
		ArrayList list;
		
		if(fsa.getCurPast().equals("c")) {
			//당기일 경우
			list = fsd.selectSlipByDateWithArr(sqlSession, fsa);
		} else {
			//전기일 경우
			int curYear = fsa.getYear();
			fsa.setYear(curYear - 1);
			fsa.setMonth(12);
			fsa.setDate(31);
			list = fsd.selectSlipByDateWithArr(sqlSession, fsa);
		}
		
		return list;
	}

	@Override
	public HashMap selectMfrgStmt(FinStmtAccount fsa) {
		//당기
		List cList = fsd.selectCurFinStmt(sqlSession, fsa);
		
		long cSum15300 = 0;		//원재료
		long cSum50400 = 0;		//임금
		long cSum50500 = 0;		//상여금
		long cSum51100 = 0;		//복리후생비
		long cSum51200 = 0;		//여비교통비
		long cSum53000 = 0;		//소모품비
		
		for(int i = 0; i < cList.size(); i++) {
			int accountCode = ((FinStmtAccount) cList.get(i)).getAccountCode();
			long price = ((FinStmtAccount) cList.get(i)).getPrice();
			
			if(accountCode == 15300) {
				cSum15300 += price;
			} else if(accountCode == 50400) {
				cSum50400 += price;
			} else if(accountCode == 50500) {
				cSum50500 += price;
			} else if(accountCode == 51100) {
				cSum51100 += price;
			} else if(accountCode == 51200) {
				cSum51200 += price;
			} else if(accountCode == 53000) {
				cSum53000 += price;
			}
		}
		
		//전기
		List pList = fsd.selectPastFinStmt(sqlSession, fsa);
		
		long pSum15300 = 0;		//원재료
		long pSum50400 = 0;		//급여
		long pSum50500 = 0;		//상여금
		long pSum51100 = 0;		//복리후생비
		long pSum51200 = 0;		//여비교통비
		long pSum53000 = 0;		//소모품비
		
		for(int i = 0; i < pList.size(); i++) {
			int accountCode = ((FinStmtAccount) pList.get(i)).getAccountCode();
			long price = ((FinStmtAccount) pList.get(i)).getPrice();
			
			if(accountCode == 15300) {
				pSum15300 += price;
			} else if(accountCode == 50400) {
				pSum50400 += price;
			} else if(accountCode == 50500) {
				pSum50500 += price;
			} else if(accountCode == 51100) {
				pSum51100 += price;
			} else if(accountCode == 51200) {
				pSum51200 += price;
			} else if(accountCode == 53000) {
				pSum53000 += price;
			}
		}
		
		HashMap hmap = new HashMap();
		hmap.put("c15300", cSum15300);
		hmap.put("c50400", cSum50400);
		hmap.put("c50500", cSum50500);
		hmap.put("c51100", cSum51100);
		hmap.put("c51200", cSum51200);
		hmap.put("c53000", cSum53000);
		
		hmap.put("p15300", pSum15300);
		hmap.put("p50400", pSum50400);
		hmap.put("p50500", pSum50500);
		hmap.put("p51100", pSum51100);
		hmap.put("p51200", pSum51200);
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
	public HashMap selectFinPos(FinStmtAccount fsa) {
		//당기
		List<FinStmtAccount> cList = fsd.selectCurFinStmtByDate(sqlSession, fsa);
		
		long cCash = 0;						//현금및현금성자산
		long cShortTermInv = 0;				//단기투자자산
		long cAccountRecievable = 0;		//매출채권
		long cNonTradeRecievable = 0;		//미수금
		long cVatPayment = 0;				//부가세대급금
		long cMerchandises = 0;				//상품
		long cFinishedGoods = 0;			//제품
		long cRawMaterials = 0;				//원재료
		long cWorkInProcess = 0;			//재공품
		long cLongInvSecurities = 0;		//장기투자증권
		long cOfficeEquipment = 0;			//비품
		long cAccountPayables = 0;			//매입채무
		long cNonTradePayables = 0;			//미지급금
		long cWitholdings = 0;				//예수금
		long cVatDeposit = 0;				//부가세예수금
		long cLongBorrowings = 0	;		//장기차입금
		long cRetirementLiabilities = 0;	//퇴직급여충당부채
		long cCapitalStock = 0;				//자본금
		
		for(int i = 0; i < cList.size(); i++) {
			int accountCode = ((FinStmtAccount) cList.get(i)).getAccountCode();
			String debitCredit = ((FinStmtAccount) cList.get(i)).getDebitCredit();
			long price = ((FinStmtAccount) cList.get(i)).getPrice();
			
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
				
			}
			
		}
		
		//전기
		List pList = fsd.selectPastFinStmtByDate(sqlSession, fsa);
		
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
			int accountCode = ((FinStmtAccount) pList.get(i)).getAccountCode();
			String debitCredit = ((FinStmtAccount) pList.get(i)).getDebitCredit();
			long price = ((FinStmtAccount) pList.get(i)).getPrice();
			
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

	@Override
	public HashMap selectCompTrialBal(FinStmtAccount fsa) {
		
		List<FinStmtAccount> list = fsd.selectCurFinStmtByDate(sqlSession, fsa);
		
		long debit10100 = 0;					//현금및현금성자산
		long credit10100 = 0;				
		long debit10800 = 0;		//매출채권
		long credit10800 = 0;				
		long debit13500 = 0;				//부가세대급금
		long credit13500 = 0;				
		long debit14600 = 0;				//상품
		long credit14600 = 0;				
		long debit15000 = 0;				//제품
		long credit15000 = 0;				
		long debit15300 = 0;				//원재료
		long credit15300 = 0;				
		long debit16900 = 0;				//재공품
		long credit16900 = 0;				
		long debit25100 = 0;				//매입채권
		long credit25100 = 0;				
		long debit25300 = 0;				//미지급금
		long credit25300 = 0;				
		long debit25400 = 0;				//예수금
		long credit25400 = 0;				
		long debit25500 = 0;				//부가세예수금
		long credit25500 = 0;				
		long debit33100 = 0;				//자본금
		long credit33100 = 0;				
		long debit40100 = 0;				//상품매출
		long credit40100 = 0;				
		long debit40400 = 0;				//제품매출
		long credit40400 = 0;
		//제조원가
		long debit50400 = 0;				//임금
		long credit50400 = 0;				
		long debit50500 = 0;				//상여금
		long credit50500 = 0;				
		long debit50800 = 0;				//퇴직급여
		long credit50800 = 0;				
		long debit51100 = 0;				//복리후생비
		long credit51100 = 0;				
		long debit51200 = 0;				//여비교통비
		long credit51200 = 0;				
		long debit53000 = 0;				//소모품비
		long credit53000 = 0;				
		//판매비와관리비
		long debit80200 = 0;				//급여
		long credit80200 = 0;				
		long debit80300 = 0;				//상여금
		long credit80300 = 0;				
		long debit81100 = 0;				//복리후생비
		long credit81100 = 0;				
		long debit81300 = 0;				//접대비
		long credit81300 = 0;				
		long debit83000 = 0;				//소모품비
		long credit83000 = 0;				
		long debit83100 = 0;				//수수료비용
		long credit83100 = 0;				
		
		for(int i = 0; i < list.size(); i++) {
			int accountCode = ((FinStmtAccount) list.get(i)).getAccountCode();
			String debitCredit = ((FinStmtAccount) list.get(i)).getDebitCredit();
			long price = ((FinStmtAccount) list.get(i)).getPrice();
			
			//현금및현금성자산
			if(accountCode == 10100 || accountCode == 10200 || accountCode == 10300 || accountCode == 10400) {
				if(debitCredit.equals("차변")) {
					debit10100 += price;
				} else {
					credit10100 += price;
				}
			//매출채권
			} else if(accountCode == 10800) {
				if(debitCredit.equals("차변")) {
					debit10800 += price;
				} else {
					credit10800 += price;
				}
			//부가세대급금
			} else if(accountCode == 13500) {
				if(debitCredit.equals("차변")) {
					debit13500 += price;
				} else {
					credit13500 += price;
				}
			//상품
			} else if(accountCode == 14600) {
				if(debitCredit.equals("차변")) {
					debit14600 += price;
				} else {
					credit14600 += price;
				}
			//제품
			} else if(accountCode == 15000) {
				if(debitCredit.equals("차변")) {
					debit15000 += price;
				} else {
					credit15000 += price;
				}
			//원재료
			} else if(accountCode == 15300) {
				if(debitCredit.equals("차변")) {
					debit15300 += price;
				} else {
					credit15300 += price;
				}
			//재공품
			} else if(accountCode == 16900) {
				if(debitCredit.equals("차변")) {
					debit16900 += price;
				} else {
					credit16900 += price;
				}
			//외상매입금
			} else if(accountCode == 25100) {
				if(debitCredit.equals("차변")) {
					debit25100 += price;
				} else {
					credit25100 += price;
				}
			//미지급금
			} else if(accountCode == 25300) {
				if(debitCredit.equals("차변")) {
					debit25300 += price;
				} else {
					credit25300 += price;
				}
			//예수금
			} else if(accountCode == 25400) {
				if(debitCredit.equals("차변")) {
					debit25400 += price;
				} else {
					credit25400 += price;
				}
			//부가세예수금
			} else if(accountCode == 25500) {
				if(debitCredit.equals("차변")) {
					debit25500 += price;
				} else {
					credit25500 += price;
				}
			//자본금
			} else if(accountCode == 33100) {
				if(debitCredit.equals("차변")) {
					debit33100 += price;
				} else {
					credit33100 += price;
				}
			//상품매출
			} else if(accountCode == 40100) {
				if(debitCredit.equals("차변")) {
					debit40100 += price;
				} else {
					credit40100 += price;
				}
			//제품매출
			} else if(accountCode == 40400) {
				if(debitCredit.equals("차변")) {
					debit40400 += price;
				} else {
					credit40400 += price;
				}
			//임금
			} else if(accountCode == 50400) {
				if(debitCredit.equals("차변")) {
					debit50400 += price;
				} else {
					credit50400 += price;
				}
			//상여금
			} else if(accountCode == 50500) {
				if(debitCredit.equals("차변")) {
					debit50500 += price;
				} else {
					credit50500 += price;
				}
			//퇴직급여
			} else if(accountCode == 50800) {
				if(debitCredit.equals("차변")) {
					debit50800 += price;
				} else {
					credit50800 += price;
				}
			//복리후생비
			} else if(accountCode == 51100) {
				if(debitCredit.equals("차변")) {
					debit51100 += price;
				} else {
					credit51100 += price;
				}
			//여비교통비
			} else if(accountCode == 51200) {
				if(debitCredit.equals("차변")) {
					debit51200 += price;
				} else {
					credit51200 += price;
				}
			//소모품비
			} else if(accountCode == 53000) {
				if(debitCredit.equals("차변")) {
					debit53000 += price;
				} else {
					credit53000 += price;
				}
			//급여
			} else if(accountCode == 80200) {
				if(debitCredit.equals("차변")) {
					debit80200 += price;
				} else {
					credit80200 += price;
				}
				//상여금
			} else if(accountCode == 80300) {
				if(debitCredit.equals("차변")) {
					debit80300 += price;
				} else {
					credit80300 += price;
				}
			//복리후생비
			} else if(accountCode == 81100) {
				if(debitCredit.equals("차변")) {
					debit81100 += price;
				} else {
					credit81100 += price;
				}
			//접대비
			} else if(accountCode == 81300) {
				if(debitCredit.equals("차변")) {
					debit81300 += price;
				} else {
					credit81300 += price;
				}
			//소모품비
			} else if(accountCode == 83000) {
				if(debitCredit.equals("차변")) {
					debit83000 += price;
				} else {
					credit83000 += price;
				}
			//수수료비용
			} else if(accountCode == 83100) {
				if(debitCredit.equals("차변")) {
					debit83100 += price;
				} else {
					credit83100 += price;
				}
			}
			
		}

		HashMap<String, Long> hmap = new HashMap<String, Long>();
		hmap.put("debit10100", debit10100);
		hmap.put("credit10100", credit10100);
		hmap.put("debit10800", debit10800);
		hmap.put("credit10800", credit10800);
		hmap.put("debit13500", debit13500);
		hmap.put("credit13500", credit13500);
		hmap.put("debit14600", debit14600);
		hmap.put("credit14600", credit14600);
		hmap.put("debit15000", debit15000);
		hmap.put("credit15000", credit15000);
		hmap.put("debit15300", debit15300);
		hmap.put("credit15300", credit15300);
		hmap.put("debit16900", debit16900);
		hmap.put("credit16900", credit16900);
		hmap.put("debit25100", debit25100);
		hmap.put("credit25100", credit25100);
		hmap.put("debit25300", debit25300);
		hmap.put("credit25300", credit25300);
		hmap.put("debit25400", debit25400);
		hmap.put("credit25400", credit25400);
		hmap.put("debit25500", debit25500);
		hmap.put("credit25500", credit25500);
		hmap.put("debit33100", debit33100);
		hmap.put("credit33100", credit33100);
		hmap.put("debit40100", debit40100);
		hmap.put("credit40100", credit40100);
		hmap.put("debit40400", debit40400);
		hmap.put("credit40400", credit40400);
		hmap.put("debit50400", debit50400);
		hmap.put("credit50400", credit50400);
		hmap.put("debit50500", debit50500);
		hmap.put("credit50500", credit50500);
		hmap.put("debit50800", debit50800);
		hmap.put("credit50800", credit50800);
		hmap.put("debit51100", debit51100);
		hmap.put("credit51100", credit51100);
		hmap.put("debit51200", debit51200);
		hmap.put("credit51200", credit51200);
		hmap.put("debit53000", debit53000);
		hmap.put("credit50300", credit53000);
		//판매비와관리비
		hmap.put("debit80200", debit80200);
		hmap.put("credit80200", credit80200);
		hmap.put("debit80300", debit80300);
		hmap.put("credit80300", credit80300);
		hmap.put("debit81100", debit81100);
		hmap.put("credit81100", credit81100);
		hmap.put("debit81300", debit81300);
		hmap.put("credit81300", credit81300);
		hmap.put("debit83000", debit83000);
		hmap.put("credit83000", credit83000);
		hmap.put("debit83100", debit83100);
		hmap.put("credit83100", credit83100);
				
		return hmap;
	}

	@Override
	public ArrayList selectSlipByJournal(FinStmtAccount fsa) {
		
		return fsd.selectSlipByJournal(sqlSession, fsa);
	}


}






