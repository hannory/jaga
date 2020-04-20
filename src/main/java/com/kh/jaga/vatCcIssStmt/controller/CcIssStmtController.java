package com.kh.jaga.vatCcIssStmt.controller;

import java.sql.Date;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vatCcIssStmt.model.service.CcIssStmtService;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;
//import com.kh.tsp.member.model.vo.Member;



/**
 * @author 조지연
 * @comment 신용카드매출전표등 발행금액 집계표
 * @createDate 2020. 4. 18.
 */
@Controller
public class CcIssStmtController {
	
	@Autowired
	private CcIssStmtService cissv;
	
	@RequestMapping("ccIssStmt.cis")
	public ModelAndView ccIssStmt(@RequestParam String search_ye ,
			@RequestParam String search_mon1
			,@RequestParam String search_mon2 ,@RequestParam String comCode ,ModelAndView mv) {
		
		String term="";
		if(search_mon1.equals("01")&&search_mon2.equals("06")) {
			term="1기확정";
		}else if(search_mon1.equals("07")&&search_mon2.equals("12")) {
			term="2기확정";
		}
		
		//달에 따른 끝날짜 설정
		String endDay="31";
		if(search_mon2.equals("06")) {
			endDay="30";
		}
		
		String year=search_ye;
		String date1= year+search_mon1;// 시작날짜 월까지 문자열로 이음
		String date2= year+search_mon2;// 시작날짜 월까지 문자열로 이음
		
		int yearInt=Integer.parseInt(year);
		
		CcIssStmt cis=new CcIssStmt();
		cis.setComCode(comCode);	//회사 번호
		cis.setYearOfAttr(yearInt);//귀속년도
		cis.setTermDiv(term);  //기수 구분
		
		System.out.println("회사번호: "+cis.getComCode());
		
		//마감된 전표 있는 지확인
		CcIssStmt cis2=cissv.selectCis(cis);
		
		//마감된 전표 있는경우
		if(cis2 !=null) {
			System.out.println("cont null! if문");
			mv.addObject("cis",cis2); 
			mv.setViewName("jsonView");
		}else if(cis2 ==null) { //마감전표 없는경우
			System.out.println("cont null if문");
			Receiption re=new Receiption();
			//전표구분:매입매출, 구분
			re.setSlipDivision("매입매출");
			re.setDivision("매출");
			re.setComCode(comCode);

			String startD=date1+"01";//전표일 조건중 시작날짜
			String endD=date2+endDay;
			try {
				//String 을 java.util.Date로 변환하고
				java.util.Date ed = new java.text.SimpleDateFormat("yyyyMMdd").parse(endD);
				java.util.Date sd = new java.text.SimpleDateFormat("yyyyMMdd").parse(startD);
				System.out.println("ed:"+ed);
				System.out.println("sd:"+sd);
				//java.util.Date 를 java.sql.Date로 변환함
				Date stD= new Date(sd.getTime());
				Date eD= new Date(ed.getTime());
				re.setSlipDate(stD);
				System.out.println("eD"+eD);
				CcIssStmt cisN=cissv.selectNewCis(re,eD);
				cisN.setYearOfAttr(yearInt);//귀속년도
				cisN.setTermDiv(term);  //기수 구분
				cisN.setDeadline("N");
				mv.addObject("cis",cisN); 
				mv.setViewName("jsonView");
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.err.println("설마");
			}
			//시작날짜
			
			
		}
		
		
		return mv;
	}
	@RequestMapping("insertCcIssStmt.cis")
	public String inserCcIssStmt(Model model, CcIssStmt cis,HttpServletRequest request) {
		System.out.println("insertCis Controller: "+cis);
		cissv.insertCcIssStmt(cis);
		
		return "bugagachi/CreditCardPurchaseSilp";
	}
	
	
	@RequestMapping("updateCcIssStmt.cis")
	public String updateCcIssStmt(Model model,CcIssStmt cis,HttpServletRequest request ) {
		System.out.println("updateCis Controller: "+cis);
		
		//pk찾아오기
		String issCode=cissv.selectCurrvalCcIssStmt(cis);
		
		System.out.println("Controller issCode: "+issCode);
		
		//pk 넣어주기
		cis.setIssCode(issCode);
		
		//pk로 해당 cis update하기
		int result=cissv.updateCcIssStmt(cis);
		System.out.println("Controller update cis issCode: "+result);
		
		
		if(result>0) {
			return "bugagachi/CreditCardPurchaseSilp";			
		}else {
			return "common/error";
		}
		
	}
	
	
}
