package com.kh.jaga.bugagachi.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.bugagachi.model.service.CcSalesSlipGapService;
import com.kh.jaga.bugagachi.model.vo.CcSalesSlipDetail;
import com.kh.jaga.bugagachi.model.vo.CcSalesSlipGap;
import com.kh.jaga.bugagachi.model.vo.TnxHis;
import com.kh.jaga.slip.model.vo.Receiption;
 

/**
 * @author 조지연
 * @comment 신용카드매출전표등 수령명세서(갑)(을)
 * @createDate 2020. 4. 20.
 */
@Controller
public class CcSalesSlipGapController {

	@Autowired
	private CcSalesSlipGapService csser;

	@RequestMapping("ccSalesSilpGap.cssg")
	public ModelAndView ccSalesSilpGap(@RequestParam String search_ye1 ,
			@RequestParam String search_mon1
			,@RequestParam String search_mon2 ,@RequestParam String comCode, ModelAndView mv){
		
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
				
				String year=search_ye1;
				String date1= year+search_mon1;// 시작날짜 월까지 문자열로 이음
				String date2= year+search_mon2;// 시작날짜 월까지 문자열로 이음
				
				int yearInt=Integer.parseInt(year);
		
		//먼저 신용카드매출전표수령명세서 에 해당날짜가 있는 값이 있는지 확인한다.
		CcSalesSlipGap cssg= new CcSalesSlipGap(); 
		
		cssg.setYearOfAttr(yearInt);
		cssg.setTermDiv(term);
		cssg.setComCode(comCode);

		cssg= csser.selectCcGap(cssg);
		
		if(cssg.getRcptstmtCode() !=null) {
		//cssg가 pk가 있으면 밑의 합계들을 가지고 오고 아니면 계산해야함
		//신용카드매출전표가지고와서 가지고 온값으로 거래내역 조회해야함
			System.out.println("controller: CcGap이 있을때: "+cssg);
			
			List<CcSalesSlipDetail> cgDetailList=csser.selectCssg(cssg);
			
			List<TnxHis> cssgHisList=csser.selectTnxHis(cssg);
			
			mv.addObject("cssg", cssg);
			mv.addObject("cgDetailList", cgDetailList);
			mv.addObject("cssgHisList", cssgHisList);
			
			mv.setViewName("jsonView");
		}else {
			System.out.println("controller: CcGap이 없을때:!!!!! "+cssg);
			
		}
//		if(cssg2!=null) {
//			mv.addObject("cssgList",cssg2); 
//			mv.setViewName("jsonView");
//		}else {
//			//전표에서 없으면 값 불러오기
//			//전표구분을 : 매입매출, 구분:매입, 증빙종류: 50,60,70,80,90,100(db: slip전표,evidence), 전표일: 년1개 째기
//			//List<Receiption> re=csser.selectReceiCssg(cssg);
//			
//			
//		}
		
		return mv;
	}
	
	
	
	// 마감 취소
	@RequestMapping("updateccSalesSilpGap.cssg")
	public String updateCcSalesSlipGap(Model model,CcSalesSlipGap cssg,HttpServletRequest request  ) {
		System.out.println("controller: updateCcSalesSlipGap 진입");
		
		//pk찾아오기
		String cssgCode=csser.selectCssgPk(cssg);
		
		System.out.println("controller: updateCcSalesSlipGap pk: "+cssgCode);
		
		if(cssgCode==null) {
			return "common/error";
		}
		
		//PK이를 기준으로 deadline y->n으로 바꾸기
		int result= csser.updateCcSalesSlipGap(cssg);
		System.out.println("Controller: update: result : "+result);
		
		
		return "bugagachi/CreditCardSalesSlipGap";
		
	} 
	
}
