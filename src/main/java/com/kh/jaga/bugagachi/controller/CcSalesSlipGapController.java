package com.kh.jaga.bugagachi.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.bugagachi.model.service.CcSalesSlipGapService;
import com.kh.jaga.bugagachi.model.vo.CcSalesSlipGap;
import com.kh.jaga.slip.model.vo.Receiption;
 
@Controller
public class CcSalesSlipGapController {

	@Autowired
	private CcSalesSlipGapService csser;

	@RequestMapping("ccSalesSilpGap.cssg")
	public ModelAndView ccSalesSilpGap(@RequestParam String search_ye1 ,
			@RequestParam String search_mon1
			,@RequestParam String search_mon2 , ModelAndView mv){
		
		String term="";
		if(search_mon1.equals("01")&&search_mon2.equals("06")) {
			term="1기확정";
		}else if(search_mon1.equals("07")&&search_mon2.equals("12")) {
			term="2기확정";
		}
		
		String year=search_ye1.substring(2);
		String date1= year+"/"+search_mon1;
		String date2= year+"/"+search_mon2;
		
		//먼저 신용카드매출전표수령명세서 에 해당날짜가 있는 값이 있는지 확인한다.
		CcSalesSlipGap cssg= new CcSalesSlipGap(); 

		int yearInt=Integer.parseInt(year);
		
		System.out.println("yearInt:"+yearInt);
		
		cssg.setYearOfAttr(yearInt);
		
		System.out.println("되면 오류없는거 날짜확인:" +date1+"Rmx"+date2);
		
		cssg.setTermDiv(term);
		
		//신용카드매출전표가지고와서 가지고 온값으로 거래내역 조회해야함
		List<CcSalesSlipGap> cssg2=csser.selectCssg(cssg);
		if(cssg2!=null) {
			mv.addObject("cssgList",cssg2); 
			mv.setViewName("jsonView");
		}else {
			//전표에서 없으면 값 불러오기
			//전표구분을 : 매입매출, 구분:매입, 증빙종류: 50,60,70,80,90,100(db: slip전표,evidence), 전표일: 년1개 째기
			//List<Receiption> re=csser.selectReceiCssg(cssg);
			
			
		}
		
		return mv;
	}

	
	
}
