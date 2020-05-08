package com.kh.jaga.vat.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.bugagachi.model.vo.CcSalesSlip;
import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vat.model.service.VatService;
import com.kh.jaga.vat.model.vo.Vat;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;
import com.kh.jaga.vatDeem.model.vo.Deem;
import com.kh.jaga.vatSumTaxInv.model.service.SumOfTaxInvService;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDto;

/**
 * @author 조지연
 * @comment 부가가체세 신고서
 * @createDate 2020. 5. 2.
 */
@Controller
public class VatController {
	
	@Autowired
	private VatService vs;
	@Autowired
	private SumOfTaxInvService ss;
	
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
		
		System.out.println("VAt2!!!!!!!!!!!!!!!!!!!!!!!!11: "+vat2);
		//마감된 항목들 확인할 hashMap
		Map<String, String> deadCk= new HashMap<String,String>();
		
		if(vat2!=null) {
			System.out.println("vat2에 값있을때 !!!!!");
			mv.addObject("vat", vat2);
			mv.setViewName("jsonView");
			
		}else{
			//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1111!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			System.out.println("vat2에 값 없!!을때");
			
			Vat vatRe=new Vat();
			
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
			Date stD;
			Date eD;
			try {
				java.util.Date ed = new java.text.SimpleDateFormat("yyyyMMdd").parse(endD);
				java.util.Date sd = new java.text.SimpleDateFormat("yyyyMMdd").parse(startD);
				
				stD= new Date(sd.getTime());
				eD= new Date(ed.getTime());
				re.setSlipDate(stD);
				
				
//				세금계산서 마감 안됐을 때 전표 계산해오기			
				
				//마감 처리된 4개 항목을 조회해와야함(세금계산서 합계표 /계산서 합계표/신용카드 수령명세서/ 신용카드 발행명세서)
//				세금계산서 합계표의 영세5와 과세1이다.
//				2는 우리가 할 수없음
//				4는 할수없음
//				5는 세금계산서합계표 페이제에서  공급가액-(세액*10)⇒영세
				
				SumOfTaxInv soti=new SumOfTaxInv();
				soti.setComCode(comCode);
				soti.setReportTerm(term);
				soti.setYearOfAttr(yearInt);
				soti.setReportType(report_type);
				
				soti=vs.selectSumOfTaxInv(soti);
				//soti가 null이 아닐때 div 23번 값을 가지고 와서 1,랑 5번 채우기
				if(soti != null) {
					//마감된 여부 체크
					
					deadCk.put("세금계산서 합계표", "Y");
					
					SumOfTaxInvDiv sotiDiv=new SumOfTaxInvDiv();
					sotiDiv.setTaxinvCode(soti.getTaxinvCode());
					sotiDiv=vs.selectSumOfTaxInvDiv(sotiDiv);
					//1: 과세
					if(sotiDiv.getValOfSupply().subtract(sotiDiv.getTax().multiply(new BigDecimal("10"))).equals(new BigDecimal("0"))) {
						
						vatRe.setP1(sotiDiv.getValOfSupply());
						vatRe.setP1T(sotiDiv.getTax());
						vatRe.setP5(new BigDecimal("0"));
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
					
				}else if(soti==null) {
				
					//soti가 마감처리 안됐을때 전표에서 계산해와야함
					deadCk.put("세금계산서 합계표", "N");
					System.out.println("세금계산서deadCk.put(\"세금계산서 합계표\", \"N\") sumRe null이 아닐 떄 마감안됐을때!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11");
					Receiption sumRe=new Receiption();
					sumRe.setComCode(comCode);
					sumRe.setDivision("매출");
					sumRe.setEvidenceCode("10");
					sumRe.setSlipDate(stD);
					
					sumRe=vs.selectRe1(sumRe, eD);
					
					if(sumRe !=null) {
						System.out.println("세금계산서 sumRe null이 아닐 떄 마감안됐을때!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11");
						//1: 과세
						if(sumRe.getSupplyValue().equals(sumRe.getValueTax().multiply(new BigDecimal("10")))) {
							System.out.println("세금계산서 마감안됐을때 과세!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11");
							vatRe.setP1(sumRe.getSupplyValue());
							vatRe.setP1T(sumRe.getValueTax());
							vatRe.setP5(new BigDecimal("0"));
							System.out.println("soit 영세 없을때 : p1: "+vatRe.getP1());
							System.out.println("soit 영세 없을때 : p1T: "+vatRe.getP1T());
						}else {
						//5: 영세 구분하기
							System.out.println("세금계산서 마감안됐을때 영세!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11");
							BigDecimal p5=sumRe.getSupplyValue().subtract(sumRe.getValueTax().multiply(new BigDecimal("10")));
						    vatRe.setP1(sumRe.getValueTax().multiply(new BigDecimal("10")));
						    vatRe.setP1T(sumRe.getValueTax());
						    vatRe.setP5(sumRe.getSupplyValue().subtract(sumRe.getValueTax().multiply(new BigDecimal("10"))));
						    System.out.println("soit 영세 있을때 : p1: "+vatRe.getP1());
							System.out.println("soit 영세 있을때 : p1T: "+vatRe.getP1T());
							System.out.println("soit 영세 있을때 : p1T: "+vatRe.getP5());
							
						}
						
						
					}else if(sumRe ==null) {
						//p5 null처리
						vatRe.setP5(new BigDecimal("0"));
						System.out.println("세믁계산서 마감안됬을때!!!!!!");
						// p1 null처리 
						if(vatRe.getP1()==null) {
							vatRe.setP1(new BigDecimal("0"));
							
						}
						if(vatRe.getP1T()==null) {
							vatRe.setP1T(new BigDecimal("0"));
						}
					}
				}
				
				
				
				
				
				//과세
				List<Receiption> reList=vs.selectCcIssStmtRe(re,eD);
				
				if( reList.size()>0) {
					for(Receiption rec: reList) {
						System.out.println("rec: "+ rec);
						if(rec.getValueTax().equals(new BigDecimal("0"))) {
							vatRe.setP6(rec.getSupplyValue());
						}else {
							vatRe.setP3(rec.getSupplyValue());
							vatRe.setP3T(rec.getValueTax());
						}
					
					}	//for문 끝
				}//if 문끝
					//p6,p3 null처리
					if(vatRe.getP6()==null) {
						System.out.println("p6이 null일 때 ");
						vatRe.setP6(new BigDecimal("0"));
					}
					if(vatRe.getP3()==null) {
						System.out.println("p3이 null일 때 ");
						vatRe.setP3(new BigDecimal("0"));
					}
					if(vatRe.getP3T()==null) {
						System.out.println("p3T이 null일 때 ");
						vatRe.setP3T(new BigDecimal("0"));
					}
				
//			10:매입매출전표 매입_10번(세금계산서)
				//마감은 위에 1,3번하면서 했으니 전표에서 값 가져오기
				
				Receiption reTaxPur=new Receiption();
				reTaxPur.setComCode(comCode);
				reTaxPur.setSlipDate(stD);
				
				reTaxPur=vs.selectSumOfTAxInvPur(reTaxPur,eD);
				if(reTaxPur !=null) {
					vatRe.setP10(reTaxPur.getSupplyValue());
					vatRe.setP10T(reTaxPur.getValueTax());
				}else {
					System.out.println("Vat 중간점검: "+vatRe);
					if(vatRe.getP10()==null) {
						System.out.println("p10이 null일 때 ");
						vatRe.setP10(new BigDecimal("0"));
					}
					if(vatRe.getP10T()==null) {
						System.out.println("p10T이 null일 때 ");
						vatRe.setP10T(new BigDecimal("0"));
					}
				}
//			14: 매입매출전표 매입_50번,100번(카드/현금 과세)/의제매입도 14상세표에 나오고 값도 나옴
//			41~49도 여기서 채워야함
				CcSalesSlip css=new CcSalesSlip();
				css.setComCode(comCode);
				css.setYearOfAttr(yearInt);
				css.setTermDiv(term);
				
				css=vs.selectCcSalesSlip(css);
				if(css !=null) {
					deadCk.put("신용카드매출전표수령서(갑)(을)","Y");
				}else {
					deadCk.put("신용카드매출전표수령서(갑)(을)", "N");
				}
				
				Receiption rePur14=new Receiption();
				rePur14.setComCode(comCode);
				rePur14.setSlipDate(stD);
				
				rePur14=vs.selectRe14(rePur14,eD);
				Deem deem=new Deem();
				deem.setComCode(comCode);
				deem.setYearOfAttr(yearInt);
				deem.setVatTerm(term);
				
				deem=vs.selectDeem(deem);
				if(deem == null) {
					deadCk.put("의제매입세액공제신고서","N");
				}else{
					deadCk.put("의제매입세액공제신고서","Y");
				}
				
				//deem의 상태를 받아올수 가 없음 group by로 묶어온거라 deem을 구분못함
				
				Receiption reDeem=new Receiption();
				reDeem.setComCode(comCode);
				reDeem.setSlipDate(stD);
				
				reDeem=vs.selectRe43(reDeem,eD);
				if(reDeem==null) {
					vatRe.setP43(new BigDecimal("0"));
					vatRe.setP43T(new BigDecimal("0"));
				}else {
					vatRe.setP43(reDeem.getSupplyValue());
					vatRe.setP43T(new BigDecimal("0"));
				}
				
				
				//14를 41에 넣고 14에 41이랑 43 더해주기
				//49도 넣어주기
				if(rePur14!=null) {
					vatRe.setP41(rePur14.getSupplyValue());
					vatRe.setP41T(rePur14.getValueTax());
					vatRe.setP14(vatRe.getP41().add(vatRe.getP43()));
					vatRe.setP14T(vatRe.getP41T().add(vatRe.getP43T()));
					vatRe.setP49(vatRe.getP41().add(vatRe.getP43()));
					vatRe.setP49T(vatRe.getP41T().add(vatRe.getP43T()));
				}else {
					
					//null처리
					if(vatRe.getP41()==null) {
						System.out.println("p1이 null일 때 ");
						vatRe.setP41(new BigDecimal("0"));
					}
					if(vatRe.getP41T()==null) {
						System.out.println("p1이 null일 때 ");
						vatRe.setP41T(new BigDecimal("0"));
					}
					if(vatRe.getP14()==null) {
						System.out.println("p1이 null일 때 ");
						vatRe.setP14(new BigDecimal("0"));
					}
					if(vatRe.getP14T()==null) {
						System.out.println("p1이 null일 때 ");
						vatRe.setP14T(new BigDecimal("0"));
					}
					vatRe.setP14(vatRe.getP41().add(vatRe.getP43()));
					vatRe.setP14T(vatRe.getP41T().add(vatRe.getP43T()));
					vatRe.setP49(vatRe.getP41().add(vatRe.getP43()));
					vatRe.setP49T(vatRe.getP41T().add(vatRe.getP43T()));
					
				}
				
				
				
				
				System.out.println("vatRe 225: "+vatRe);
				
//			19:매입매출 매출(카드과세) _90번, (현금과세)_100번=⇒13/1000
//			(19) 개인사업자로서 소매업자, 음식점업자, 숙박업자 등 부가가치세법시행령 제73조 제1항 및 제2항에 규정된 사업자가 신용카드매출 등 및 전자화폐에 의한 매출이 있는 경우에 기재하며, 
//			금액란에는 신용카드매출전표 등 발행금액과 전자화폐 수취금액을, 세액란에는 동 금액의 13/1,000에 해당하는 금액(2012년까지 연간 700만원 한도, 2013년부터 연간 500만원 한도)을 기재합니다.
				
				//회사의 업종보러갔다옴
				Company com=new Company();
				com.setCompanyCode(comCode);
				com=vs.selectComTypeOfBizCode(com);
				//19번에 해당하는 사업자
				if(com != null) {
					Receiption re19=new Receiption();
					re19.setComCode(comCode);
					re19.setSlipDate(stD);
					re19.setSlipDivision("매입매출");
					re19.setDivision("매출");
					
					re19=vs.selectRe19(re19, eD);
					if(re19!=null) {
						vatRe.setP19(re19.getSupplyValue());
					}else{//null 처리
						System.out.println("p19이 null일 때 ");
						vatRe.setP19(new BigDecimal("0"));
					}
					
				}else {
					System.out.println("공제 사업자에 해당안됨");
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
			
			salesTaxSum=salesTaxSum.add(vatRe.getP1T()).add(vatRe.getP3T());
			vatRe.setP9(vatRe.getP1().add(vatRe.getP3()).add(vatRe.getP5()).add(vatRe.getP6()));
			vatRe.setP9T(salesTaxSum);
		
			//null처리
			if(vatRe.getP9()==null) {
				System.out.println("p1이 null일 때 ");
				vatRe.setP9(new BigDecimal("0"));
			}
			if(vatRe.getP9T()==null) {
				System.out.println("p1이 null일 때 ");
				vatRe.setP9T(new BigDecimal("0"));
			}
			
			
				
  			
			
//			15: 10~14합계
			
			vatRe.setP15(vatRe.getP10().add(vatRe.getP14()));
			vatRe.setP15T(vatRe.getP10T().add(vatRe.getP14T()));
			
			//null처리
			if(vatRe.getP15()==null) {
				System.out.println("p1이 null일 때 ");
				vatRe.setP15(new BigDecimal("0"));
			}
			if(vatRe.getP15T()==null) {
				System.out.println("p1이 null일 때 ");
				vatRe.setP15T(new BigDecimal("0"));
			}
			
//			17: 15-16 ...16을 할 수 없음			
			
			vatRe.setP17(vatRe.getP15());
			vatRe.setP17T(vatRe.getP15T());
			if(vatRe.getP17()==null) {
				System.out.println("p17이 null일 때 ");
				vatRe.setP17(new BigDecimal("0"));
			}
			if(vatRe.getP17T()==null) {
				System.out.println("p17이 null일 때 ");
				vatRe.setP17T(new BigDecimal("0"));
			}
			
//			다: 가(매출 합계)-나(매입 합계)==>자바 스크립트에서 해야할듯
			
			//vatRe.setP15T(vatRe.getP9T().subtract(vatRe.getP17T()));
			
			
			
			
//			계산서 합계표 마감되있는지 확인
			
			SumOfTaxInvDto bill=new SumOfTaxInvDto();
			bill.setComCode(comCode);
			bill.setYearOfAttr(yearInt);
			bill.setReportTerm(term);
			bill.setTabletaxDiv("계산서");
			bill=ss.selectSotiDto(bill);
			System.out.println("계산서 bill: "+bill);
			
			if(bill == null) {
				deadCk.put("계산서 합계표","N");
			}else{
				deadCk.put("계산서 합계표","Y");
			}
			
			
//			부가율: (9-15)/9*100%
			
			System.out.println("부가율 setter전: "+vatRe.getP9());
			System.out.println("부가율 setter전: "+vatRe.getP9().subtract(vatRe.getP15()));
			System.out.println("부가율 setter전 15: "+vatRe.getP15());
			BigDecimal sub=vatRe.getP9().subtract(vatRe.getP15());
			System.out.println("부가율 setter전:16 "+sub.divide(vatRe.getP9(),8,BigDecimal.ROUND_DOWN));
			BigDecimal rate=new BigDecimal("0");
			if(vatRe.getP15().equals(new BigDecimal("0"))) {
				System.out.println("부가율 setter전: 17: "+vatRe.getP9().subtract(vatRe.getP15()).multiply(new BigDecimal("100")) );
				rate=new BigDecimal("0");
			}else {
				rate=sub.divide(vatRe.getP9(),8,BigDecimal.ROUND_DOWN).multiply(new BigDecimal("100"));
				
			}
			/*
			 * System.out.println("부가율 setter전: 18"+vatRe.getP15().divide(vatRe.getP9().
			 * subtract(vatRe.getP15()),8,BigDecimal.ROUND_DOWN) );
			 * System.out.println("부가율 setter전: 18"+vatRe.getP15().divide(vatRe.getP9().
			 * subtract(vatRe.getP15()),8,BigDecimal.ROUND_DOWN) );
			 */
			 // System.out.println("부가율 setter전: 19: "+vatRe.getP15().divide(vatRe.getP9().subtract(vatRe.getP15()),8,BigDecimal.ROUND_DOWN) );
			 
			
			vatRe.setValueRate(rate.setScale(2,BigDecimal.ROUND_DOWN));
			System.out.println("부가율: "+vatRe.getValueRate());
			//마감처리되지 않은 전표들있으면 몯라로 띄워줘야함

			//vat insert, deadCk insert(얘는 나중에)
			vatRe.setDeadline("N");
			vatRe.setComCode(comCode);
			vatRe.setReportTerm(term);
			vatRe.setReportType(report_type);
			vatRe.setYearOfAttr(yearInt);
			int vatInsert=vs.insertVat(vatRe);
			//vatCode 받아오기
			String vatCode=vs.selectVatCode(vatRe);
			vatRe.setVatCode(vatCode);
			System.out.println("insert 성공했냐? : "+vatInsert);
			//!!!1!!!!!!!!!!!!!!!!!!deadCk도 insert해줘야함 안했음!!!!!!!!!!!!!!!!!!!!!!!!!!!
			
			
			//부가가치세 넘기기
			mv.addObject("deadCk",deadCk);
			mv.addObject("vat", vatRe);
			mv.setViewName("jsonView");
			
			
		}
		
		
		return mv;
	}
	
	
	
	@RequestMapping("deadLine.vat")
	public String deadLine(Model model, Vat vat ,HttpServletRequest request) {
		System.out.println("Controller: deadLine: "+vat);
		int result=vs.updateVat(vat);
		return "bugagachi/vatReport";
	}
	@RequestMapping("updatdDeadLineCen.vat")
	public String deadlineCen(Model model, Vat vat ,HttpServletRequest request) {
		System.out.println("Controller: deadLineCen: "+vat);
		int result=vs.updateDeadCenVat(vat);
		return "bugagachi/vatReport";
	}
	

}
