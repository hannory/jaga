package com.kh.jaga.vat.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vat.model.service.VatService;
import com.kh.jaga.vat.model.vo.Vat;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;

/**
 * @author 조지연
 * @comment 부가가체세 신고서
 * @createDate 2020. 5. 2.
 */
@Controller
public class VatController {
	
	@Autowired
	private VatService vs;
	
	@RequestMapping("vatReport.vat")
	public ModelAndView vatSearch(@RequestParam String search_ye ,
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
		
		Vat vat=new Vat();
		vat.setComCode(comCode);
		vat.setReportTerm(term);
		vat.setReportType(report_type);
		vat.setYearOfAttr(yearInt);
		
		Vat vat2= new Vat();
		vat2=vs.selectVat(vat);
		
		
		//마감된 항목들 확인할 hashMap
		Map<String, String> deadCk= new HashMap<String,String>();
		
		if(vat2!=null) {
			System.out.println("vat2에 값있을때 !!!!!");
			mv.addObject("vat", vat2);
			mv.setViewName("jsonView");
			
		}else{
			System.out.println("vat2에 값 없!!을때");
			
			Vat vatRe=new Vat();
			//마감 처리된 4개 항목을 조회해와야함(세금계산서 합계표 /계산서 합계표/신용카드 수령명세서/ 신용카드 발행명세서)
//			세금계산서 합계표의 영세5와 과세1이다.
//			2는 우리가 할 수없음
//			4는 할수없음
//			5는 세금계산서합계표 페이제에서  공급가액-(세액*10)⇒영세
			
			SumOfTaxInv soti=new SumOfTaxInv();
			soti.setComCode(comCode);
			soti.setReportTerm(term);
			soti.setYearOfAttr(yearInt);
			soti.setReportType(report_type);
			
			soti=vs.selectSumOfTaxInv(soti);
			//soti가 null이 아닐때 div 23번 값을 가지고 와서 1,랑 5번 채우기
			if(soti != null) {
				//마감된 여부 체크
				
				deadCk.put("세금계산서", "Y");
				
				SumOfTaxInvDiv sotiDiv=new SumOfTaxInvDiv();
				sotiDiv.setTaxinvCode(soti.getTaxinvCode());
				sotiDiv=vs.selectSumOfTaxInvDiv(sotiDiv);
				//1: 과세
				if(sotiDiv.getValOfSupply().subtract(sotiDiv.getTax().multiply(new BigDecimal("10"))).equals(new BigDecimal("0"))) {
					vatRe.setP1(sotiDiv.getValOfSupply());
					vatRe.setP1T(sotiDiv.getTax());
					System.out.println("soit 영세 없을때 : p1: "+vatRe.getP1());
					System.out.println("soit 영세 없을때 : p1T: "+vatRe.getP1T());
				}else {
				//5: 영세 구분하기
				    vatRe.setP1(sotiDiv.getValOfSupply().subtract(sotiDiv.getTax().multiply(new BigDecimal("10"))));
				    vatRe.setP1T(sotiDiv.getTax());
				    vatRe.setP5(sotiDiv.getTax().multiply(new BigDecimal("10")));
				    System.out.println("soit 영세 있을때 : p1: "+vatRe.getP1());
					System.out.println("soit 영세 있을때 : p1T: "+vatRe.getP1T());
					System.out.println("soit 영세 있을때 : p1T: "+vatRe.getP5());
					
				}
			}else {
				//soti가 마감처리 안됐을때 전표에서 계산해와야함
				deadCk.put("세금계산서", "N");
			}
			
			
			
			
//			3: 신용카드매출전표발행금액집계표(영세 제외하고)(3+6이 신용카드매출전표발행금액집계표)
//			6은 신용카드매출전표 발행금액집계표(영세)
			
			CcIssStmt cis=new CcIssStmt();
			cis.setComCode(comCode);
			cis.setYearOfAttr(yearInt);
			cis.setTermDiv(term);
			
			cis=vs.selectCcIssStmt(cis);
			if(cis !=null) {
				deadCk.put("신용카드매출전표발행금액집계표", "Y");
				
			}else {
				deadCk.put("신용카드매출전표발행금액집계표", "N");
				
			}
			Receiption re=new Receiption();
			re.setSlipDivision("매입매출");
			re.setDivision("매출");
			re.setComCode(comCode);
			String startD=date1+"01";//전표일 조건중 시작날짜
			String endD=date2+endDay;
			try {
				java.util.Date ed = new java.text.SimpleDateFormat("yyyyMMdd").parse(endD);
				java.util.Date sd = new java.text.SimpleDateFormat("yyyyMMdd").parse(startD);
				
				Date stD= new Date(sd.getTime());
				Date eD= new Date(ed.getTime());
				re.setSlipDate(stD);
				//과세
				List<Receiption> reList=vs.selectCcIssStmtRe(re,eD);
				for(Receiption rec: reList) {
					if(rec.getValueTax().equals(new BigDecimal("0"))) {
						vatRe.setP6(rec.getSupplyValue());
						System.out.println("vatRE p6: "+vatRe.getP6());
					}else {
						vatRe.setP3(rec.getSupplyValue());
						vatRe.setP3T(rec.getValueTax());
					}
				}	
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			
			
//			7이 0이면 오른쪽 7번 표 도 0
//			9는 1~6합계
			
			
			BigDecimal salesSum=new BigDecimal("0");	//공급가액 1,5,6,3 더하기
			BigDecimal salesTaxSum=new BigDecimal("0"); //부가세 1,3더하기
			salesSum.add(vatRe.getP1()).add(vatRe.getP3()).add(vatRe.getP5()).add(vatRe.getP6());
			salesTaxSum.add(vatRe.getP1T()).add(vatRe.getP3T());
			
			
			
			
//			11~13:못씀
//			10:매입매출전표 매입_10번(세금계산서)
//			14: 매입매출전표 매입_50번,100번(카드/현금 과세)/의제매입도 14상세표에 나오고 값도 나옴
//			15: 10~14합계
//			다: 가(매출 합계)-나(매입 합계)
//
//			19:매입매출 매출(현금영세) _90번, (현금과세)_100번=⇒13/1000
//			(19) 개인사업자로서 소매업자, 음식점업자, 숙박업자 등 부가가치세법시행령 제73조 제1항 및 제2항에 규정된 사업자가 신용카드매출 등 및 전자화폐에 의한 매출이 있는 경우에 기재하며, 
//			금액란에는 신용카드매출전표 등 발행금액과 전자화폐 수취금액을, 세액란에는 동 금액의 13/1,000에 해당하는 금액(2012년까지 연간 700만원 한도, 2013년부터 연간 500만원 한도)을 기재합니다.
//
//			부가율: (9-15)/9*100%

			
			//마감처리되지 않은 전표들있으면 몯라로 띄워줘야함

			
			
			
			
			
			
		}
		
		return mv;
	}

}
