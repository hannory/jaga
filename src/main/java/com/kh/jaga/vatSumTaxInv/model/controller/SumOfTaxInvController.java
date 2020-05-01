package com.kh.jaga.vatSumTaxInv.model.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vatSumTaxInv.model.service.SumOfTaxInvService;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDto;
import com.kh.jaga.vatSumTaxInv.model.vo.SumTaxInvDetail;

@Controller
public class SumOfTaxInvController {
	//세금계산서 합계표 조회
	@Autowired
	private SumOfTaxInvService ss;
	
	@Transactional
	@RequestMapping("sumOfTaxInv.soti")
	public @ResponseBody ModelAndView sumOfTaxInvSearch(@RequestParam String search_ye ,
			@RequestParam String search_mon1,@RequestParam String search_mon2 ,@RequestParam String comCode,
			@RequestParam String report_type,ModelAndView mv) {
		
		String term="";
		if(search_mon1.equals("01")&&search_mon2.equals("06")) {
			term="1기확정";
		}else if(search_mon1.equals("07")&&search_mon2.equals("12")) {
			term="2기확정";
		}
		String endDay="31";
		if(search_mon2.equals("06")) {
			endDay="30";
		}
		
		String year=search_ye;
		String date1= year+search_mon1;// 시작날짜 월까지 문자열로 이음
		String date2= year+search_mon2;// 시작날짜 월까지 문자열로 이음
		
		int yearInt=Integer.parseInt(year);
		
		SumOfTaxInvDto sDto=new SumOfTaxInvDto();
		sDto.setReportTerm(term);
		sDto.setComCode(comCode);
		sDto.setYearOfAttr(yearInt);
		sDto.setReportType(report_type);
		sDto.setTabletaxDiv("세금계산서");
		
		System.out.println("Controller: sDto: "+sDto);
		
		SumOfTaxInvDto sDto2=new SumOfTaxInvDto();
		sDto2=ss.selectSotiDto(sDto);
		
		if(sDto2 !=null) {
			System.out.println("Controller: sDto2가 값있을때!!!!!!");
			
			
			//구분표 list형식으로 받아온후 dto엣 setter로 값넣어주기
			//매출
			List<SumOfTaxInvDiv> sDivList=ss.selectSotiDiv(sDto2);
			System.out.println("Controller: sDivList: "+sDivList);
			sDto2.setSumOfTaxInvDivSales(sDivList);
			//매입
			List<SumOfTaxInvDiv> sDivListPur=ss.selectSotiDivPur(sDto2);
			System.out.println("Controller: sDivListPur: "+sDivListPur);
			sDto2.setSumOfTaxInvDivPur(sDivListPur);
			
			//상세정보 select 해오기
			//매출
			List<SumTaxInvDetail> sDetailSales=ss.selectSotiDetail(sDto2);
			System.out.println("Controller: sDetailSales: "+sDetailSales);
			sDto2.setSumTaxInvDetailSales(sDetailSales);
			//매입
			List<SumTaxInvDetail> sDetailPur=ss.selectSotiDetailPur(sDto2);
			System.out.println("Controller: sDetailPur: "+sDetailPur);
			sDto2.setSumTaxInvDetailPur(sDetailPur);
			
			
			System.out.println("sDto2 최종: "+sDto2);
			//List<SumOfTaxInvDiv> list = net.sf.json.JSONArray.fromObject(sDivList);

			//JSONObject jsonO=new JSONObject();
			mv.addObject("sDto", sDto2);
			//mv.addObject("list",list);
			//mv.addObject("jsonList", jsonArray.for );
			mv.setViewName("jsonView");
			
		}else {
			System.out.println("Controller: sDto2 값 없!을때!!!");
			//전표를 가저와서 매입전표 매출전표를 가져와서 계산후 매입/매출 구분 값 넣어주고 매입/매출 상세리스트 값 넣어주기
			//insert도 같이 진행
			
			
			Receiption receiptionPur=new Receiption();
			Receiption receiptionSales=new Receiption();
			
			//전표구분:매입매출, 구분:매입/매출, 증빙종류:50,70,90,100
			
			//매입 리스트 
			receiptionPur.setSlipDivision("매입매출");
			receiptionPur.setDivision("매입");
			receiptionPur.setComCode(comCode);
			receiptionPur.setEvidenceCode("10");
			
			String startD=date1+"01";//전표일 조건중 시작날짜
			String endD=date2+endDay;
			
			//매출 리스트 불러오기
			receiptionSales.setSlipDivision("매입매출");
			receiptionSales.setDivision("매출");
			receiptionSales.setComCode(comCode);
			receiptionSales.setEvidenceCode("10");
			try {
				java.util.Date ed = new java.text.SimpleDateFormat("yyyyMMdd").parse(endD);
				java.util.Date sd = new java.text.SimpleDateFormat("yyyyMMdd").parse(startD);
				//java.util.Date 를 java.sql.Date로 변환함
				Date stD= new Date(sd.getTime());
				Date eD= new Date(ed.getTime());
				
				//각 리스트에 시작날짜 넣어주기
				receiptionPur.setSlipDate(stD);
				receiptionSales.setSlipDate(stD);
				
				
				SumOfTaxInv soti=new SumOfTaxInv();
				soti.setComCode(comCode);
				soti.setTabletaxDiv("세금계산서");
				soti.setYearOfAttr(yearInt);
				soti.setReportTerm(term);
				soti.setReportType(report_type);
				
				//SumOfTaxInv삽입
				int sotiResult=ss.insertSoti(soti);
				//soti currval가져오기
				String sotiCurrval="";
				if(sotiResult > 0) {
					try {
						sotiCurrval=ss.selectTaxinvCode();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					System.out.println("Controller: sotiCurrval: "+sotiCurrval);
				
				
				
				
				//매입리스트 값 가지러가기
				List<SumTaxInvDetail> rePur=ss.selectReceiption(receiptionPur,eD);
				System.out.println("Controller: sumOfTaxInvSearch: rePur"+rePur);
				
				//매입리스트에 soitCurrval 넣어주기
				for(SumTaxInvDetail de:rePur) {
					de.setTaxinvCode(sotiCurrval);
					de.setPurSales("매입");
				}
				//매출리스트 값 가지러 가기
				List<SumTaxInvDetail> reSales=ss.selectReceiption(receiptionSales,eD);
				//매출리스트에 soitCurrval 넣어주기
				System.out.println("Controller: sumofTaxInvSearch: reSales: "+reSales);
				for(SumTaxInvDetail de:reSales) {
					de.setTaxinvCode(sotiCurrval);
					de.setPurSales("매출");
				}
				
				//매입구분표 값 넣기 for안에 if문 으로  민번, 사업자번호로 나누고 소계 계산하기!!!!!!!!!!!!!!!!!!!!!!!!!!!
				int pBizCount=0;							//매입처수 소계
				int pDealCount=0;							//매수소계
				BigDecimal pSupplySum=new BigDecimal(0);	//공급가액소계
				BigDecimal pTaxSum=new BigDecimal(0);		//세액소계
				int pBizCount_Biz=0;						//매입처수 사업자번호
				int pDealCount_Biz=0;						//매수 사업자번호
				BigDecimal pSupplySum_Biz=new BigDecimal(0);//공급가액 사업자번호
				BigDecimal pTaxSum_Biz=new BigDecimal(0);	//세액 사업자번호
				int pBizCount_Per=0;						//매입처수 민번
				int pDealCount_Per=0;						//매수 민번
				BigDecimal pSupplySum_Per=new BigDecimal(0);//공급가액 민번
				BigDecimal pTaxSum_Per=new BigDecimal(0);	//세액 민번
				
				//매입 구분 리스트
				List<SumOfTaxInvDiv> sDivPur=new ArrayList<SumOfTaxInvDiv>();
				SumOfTaxInvDiv sDivSum=new SumOfTaxInvDiv();
				SumOfTaxInvDiv sDiv=new SumOfTaxInvDiv(); 
				for(SumTaxInvDetail rPur: rePur ) {
					//소계 계산
					pBizCount++;
					pDealCount+=rPur.getDealCount();
					pSupplySum=pSupplySum.add(rPur.getValOfSupply());
					pTaxSum=pTaxSum.add(rPur.getTax());
					//주민번호
					if(rPur.getBizRegNum().length()==14) {
						System.out.println("주민번호영역 들어오나?");
						pBizCount_Per++;
						pDealCount_Per+=rPur.getDealCount();
						pSupplySum_Per=pSupplySum_Per.add(rPur.getValOfSupply());
						pTaxSum_Per=pTaxSum_Per.add(rPur.getTax());
						
					}else {//사업자번호
						System.out.println("사업자 번호 영역 들어오나?");
						pBizCount_Biz++;
						pDealCount_Biz+=rPur.getDealCount();
						pSupplySum_Biz=pSupplySum_Biz.add(rPur.getValOfSupply());
						pTaxSum_Biz=pTaxSum_Biz.add(rPur.getTax());
					}
				}
				if(pBizCount_Per>0) {
				sDiv.setAcctCodeCt(pBizCount_Per);
				sDiv.setDealCount(pDealCount_Per);
				sDiv.setValOfSupply(pSupplySum_Per);
				sDiv.setTax(pTaxSum_Per);
				sDiv.setTaxinvCode(sotiCurrval);
				sDiv.setPurSales("매입");
				sDiv.setDivisionCode("22");
				
				sDivPur.add(sDiv);
				}else if(pBizCount_Biz>0) {
				
				sDiv.setAcctCodeCt(pBizCount_Biz);
				sDiv.setDealCount(pDealCount_Biz);
				sDiv.setValOfSupply(pSupplySum_Biz);
				sDiv.setTax(pTaxSum_Biz);
				sDiv.setTaxinvCode(sotiCurrval);
				sDiv.setPurSales("매입");
				sDiv.setDivisionCode("21");
				
				sDivPur.add(sDiv);
				}
				sDivSum.setAcctCodeCt(pBizCount);
				sDivSum.setDealCount(pDealCount);
				sDivSum.setValOfSupply(pSupplySum);
				sDivSum.setTax(pTaxSum);
				sDivSum.setTaxinvCode(sotiCurrval);
				sDivSum.setPurSales("매입");
				sDivSum.setDivisionCode("23");
				sDivPur.add(sDivSum);
				
				//sDivPur insert 하기
				System.out.println("Controller: sDivPur: "+sDivPur);
				
				
				
				
				//매출구분표 값 넣기 for안에 if문 으로  민번, 사업자번호로 나누고 소계 계산하기!!!!!!!!!!!!!!!!!!!!!!!!!!!
				int sBizCount=0;							//매입처수 소계
				int sDealCount=0;							//매수소계
				BigDecimal sSupplySum=new BigDecimal(0);	//공급가액소계
				BigDecimal sTaxSum=new BigDecimal(0);		//세액소계
				int sBizCount_Biz=0;						//매입처수 사업자번호
				int sDealCount_Biz=0;						//매수 사업자번호
				BigDecimal sSupplySum_Biz=new BigDecimal(0);//공급가액 사업자번호
				BigDecimal sTaxSum_Biz=new BigDecimal(0);	//세액 사업자번호
				int sBizCount_Per=0;						//매입처수 민번
				int sDealCount_Per=0;						//매수 민번
				BigDecimal sSupplySum_Per=new BigDecimal(0);//공급가액 민번
				BigDecimal sTaxSum_Per=new BigDecimal(0);	//세액 민번
				
				//매출 구분 리스트
				List<SumOfTaxInvDiv> sDivSales=new ArrayList<SumOfTaxInvDiv>();
				SumOfTaxInvDiv sDivSumSales=new SumOfTaxInvDiv();
				SumOfTaxInvDiv sDivS=new SumOfTaxInvDiv(); 
				for(SumTaxInvDetail rSales: reSales ) {
					//소계 계산
					sBizCount++;
					sDealCount+=rSales.getDealCount();
					sSupplySum=sSupplySum.add(rSales.getValOfSupply());
					sTaxSum=sTaxSum.add(rSales.getTax());
					//주민번호
					if(rSales.getBizRegNum().length()==14) {
						sBizCount_Per++;
						sDealCount_Per+=rSales.getDealCount();
						sSupplySum_Per=sSupplySum_Per.add(rSales.getValOfSupply());
						sTaxSum_Per=sTaxSum_Per.add(rSales.getTax());
						
					}else{//사업자번호
						sBizCount_Biz++;
						sDealCount_Biz+=rSales.getDealCount();
						sSupplySum_Biz=sSupplySum_Biz.add(rSales.getValOfSupply());
						sTaxSum_Biz=sTaxSum_Biz.add(rSales.getTax());
					}
				}
				if(sBizCount_Per>0) {
				sDivS.setAcctCodeCt(sBizCount_Per);
				sDivS.setDealCount(sDealCount_Per);
				sDivS.setValOfSupply(sSupplySum_Per);
				sDivS.setTax(sTaxSum_Per);
				sDivS.setTaxinvCode(sotiCurrval);
				sDivS.setPurSales("매출");
				sDivS.setDivisionCode("22");
				
				sDivSales.add(sDivS);
				}else if(sBizCount_Biz>0) {
				sDivS.setAcctCodeCt(sBizCount_Biz);
				sDivS.setDealCount(sDealCount_Biz);
				sDivS.setValOfSupply(sSupplySum_Biz);
				sDivS.setTax(sTaxSum_Biz);
				sDivS.setTaxinvCode(sotiCurrval);
				sDivS.setPurSales("매출");
				sDivS.setDivisionCode("21");
				
				sDivSales.add(sDivS);
				}
				sDivSumSales.setAcctCodeCt(sBizCount);
				sDivSumSales.setDealCount(sDealCount);
				sDivSumSales.setValOfSupply(sSupplySum);
				sDivSumSales.setTax(sTaxSum);
				sDivSumSales.setTaxinvCode(sotiCurrval);
				sDivSumSales.setPurSales("매출");
				sDivSumSales.setDivisionCode("23");
				
				sDivSales.add(sDivSumSales);
				
				//매출
				
				//detailList , divList insert하기
				int insertDetailPurList= ss.insertDetailList(rePur);
				int insertDetailSalesList= ss.insertDetailList(reSales);
				
				//divList insert하기
				int insertDivPurList=ss.insertDivList(sDivPur);
				int insertDivSalesList=ss.insertDivList(sDivSales);
				System.out.println("Controller: sDto2: insertDivSalesList: "+insertDivSalesList);
				//sDto에 값 넣어주기
				sDto.setTaxinvCode(sotiCurrval);
				sDto.setSumOfTaxInvDivPur(sDivPur);
				System.out.println("Controller: sDto2: 1 "+sDto2);
				sDto.setSumOfTaxInvDivSales(sDivSales);
				System.out.println("Controller: sDto2: 2 "+sDto2);
				sDto.setSumTaxInvDetailPur(rePur);
				System.out.println("Controller: sDto2: 3 "+sDto2);
				sDto.setSumTaxInvDetailSales(reSales);
				
				
				System.out.println("Controller: sDto2: 4 "+sDto);
				
				mv.addObject("sDto", sDto);
				//mv.addObject("list",list);
				//mv.addObject("jsonList", jsonArray.for );
				mv.setViewName("jsonView");
				
				
				}//soti insert가 성공할때 if문
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		
			
		}
		
		
		
		return mv;
		
	}
	@RequestMapping("deadLine.soti")
	public String deadLine(Model model, SumOfTaxInvDto sDto ,HttpServletRequest request) {
		System.out.println("Controller: deadLine: "+sDto);
		int result=ss.insertSdto(sDto);
		return "bugagachi/sumTableOfTaxInvoices";
	}
	
	@RequestMapping("updatdDeadLineCen.soti")
	public String deadlineCen(Model model, SumOfTaxInvDto sDto ,HttpServletRequest request) {
		System.out.println("Controller: deadLine: "+sDto);
		int result=ss.updateSdto(sDto);
		return "bugagachi/sumTableOfTaxInvoices";
	}
	

}
