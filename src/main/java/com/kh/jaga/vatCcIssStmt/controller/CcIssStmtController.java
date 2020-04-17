package com.kh.jaga.vatCcIssStmt.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.vatCcIssStmt.model.service.CcIssStmtService;
import com.kh.jaga.vatCcIssStmt.model.vo.CcIssStmt;

@Controller
public class CcIssStmtController {
	
	@Autowired
	private CcIssStmtService cissv;
	
	@RequestMapping("ccIssStmt.cssg")
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
			endDay="31";
		}
		
		
		
		
		String year=search_ye.substring(2);
		String date1= year+"/"+search_mon1;// 시작날짜 월까지 문자열로 이음
		String date2= year+"/"+search_mon2;// 시작날짜 월까지 문자열로 이음
		System.out.println("year: "+year);
		System.out.println("date1:"+date1);
		System.out.println("date2:"+date2);
		
		int yearInt=Integer.parseInt(year);
		
		CcIssStmt cis=new CcIssStmt();
		cis.setComCode(comCode);
		cis.setYearOfAttr(yearInt);
		cis.setTermDiv(term);
		System.out.println("CISCOMCODE CONTROOLER"+cis.getComCode());
		
		CcIssStmt cis2=cissv.selectCis(cis);
		
		//if(cis2 !=null) {
			System.out.println("cont null! if문");
			mv.addObject("cis",cis2); 
			mv.setViewName("jsonView");
//		}else if(cis2 ==null) {
//			System.out.println("cont null if문");
//			Receiption re=new Receiption();
//			//전표구분:매입매출, 구분
//			re.setSlipDivision("매입매출");
//			re.setDivision("매출");
//
//			String startD=date1+"/"+"01";//전표일 조건중 시작날짜
//			String endD=date2+"/"+endDay;
//			
//			System.out.println("날짜 변환전");
//			Date stD=Date.valueOf(startD);
//			Date eD=Date.valueOf(endD);
//			//시작날짜
//			re.setSlipDate(stD);
//			
//			CcIssStmt cal=cissv.selectNewCis(re,eD);
//			
//		}
		
		
		return mv;
	}
	
	
	
}
