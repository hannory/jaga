package com.kh.jaga.bugagachi.controller;


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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.bugagachi.model.service.CcSalesSlipGapService;
import com.kh.jaga.bugagachi.model.vo.CcSalesSlip;
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

	@Transactional
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

		System.out.println("Dao: ccSalesSilpGap:cssg설정값 :"+cssg);
		CcSalesSlipGap cssg2= new CcSalesSlipGap(); 
		cssg2= csser.selectCcGap(cssg);
		
		if(cssg2 !=null) {
		//cssg가 pk가 있으면 밑의 합계들을 가지고 오고 아니면 계산해야함
		//신용카드매출전표가지고와서 가지고 온값으로 거래내역 조회해야함
			System.out.println("controller: CcGap이 있을때: "+cssg2);
			
			List<CcSalesSlipDetail> cgDetailList=csser.selectCssg(cssg2);
			
			List<TnxHis> cssgHisList=csser.selectTnxHis(cssg2);
			
			mv.addObject("cssg", cssg2);
			mv.addObject("cgDetailList", cgDetailList);
			mv.addObject("cssgHisList", cssgHisList);
			
			mv.setViewName("jsonView");
		}else {
			System.out.println("controller: CcGap이 없을때:!!!!! "+cssg2);
			//전표에서 없으면 값 불러오기
			//전표구분을 : 매입매출, 구분:매입, 증빙종류: 50,60,70,80,90,100(db: slip전표,evidence), 전표일: 년1개 째기
			Receiption re=new Receiption();
			//전표구분:매입매출, 구분
			re.setSlipDivision("매입매출");
			re.setDivision("매입");
			re.setComCode(comCode);
			
			String startD=date1+"01";//전표일 조건중 시작날짜
			String endD=date2+endDay;
			try {
				 
				java.util.Date ed = new java.text.SimpleDateFormat("yyyyMMdd").parse(endD);
				java.util.Date sd = new java.text.SimpleDateFormat("yyyyMMdd").parse(startD);
				//java.util.Date 를 java.sql.Date로 변환함
				Date stD= new Date(sd.getTime());
				Date eD= new Date(ed.getTime());
				re.setSlipDate(stD);
				
				//CcSalesSlip css=new CcSalesSlip();
				//전표리스트
				List<TnxHis> cssgHisList=csser.selectNewRecei(re,eD);
				
				//css.setCssTnxHis(cssgHisList);
				
				System.out.println("Controller: cssgHisList: "+cssgHisList);
				//중간합계효!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
				List<CcSalesSlipDetail> cgDetailList=new ArrayList<CcSalesSlipDetail>();
				if(! cssgHisList.isEmpty()) {//전표값이 없을때
					System.out.println("전표있을때");
					int cardCount=0; 
					BigDecimal cardValOfSupply=new BigDecimal("0");
					BigDecimal cardTax=new BigDecimal("0");
					int cashCount=0; 
					BigDecimal cashValOfSupply=new BigDecimal("0");
					BigDecimal cashTax=new BigDecimal("0");
					CcSalesSlipDetail cd= new CcSalesSlipDetail();
					CcSalesSlipDetail cd2= new CcSalesSlipDetail();
					for(TnxHis th:cssgHisList) {
						if(th.getDivision().equals("신용")) {

							cardCount++;
							cardValOfSupply=cardValOfSupply.add(th.getValOfSupply());
							cardTax=cardTax.add(th.getTax());

						}else if(th.getDivision().equals("현금")){
							cashCount++;
							cashValOfSupply=cashValOfSupply.add(th.getValOfSupply());
							cashTax=cashTax.add(th.getTax());
						}

					}

					//if(cashCount>0) {
						cd.setEventDiv("현금영수증");

					//}
					cd.setDealCount(cashCount);
					cd.setValOfSupply(cashValOfSupply);
					cd.setTax(cashTax);
					cgDetailList.add(cd);

					//if(cardCount>0) {
						cd2.setEventDiv("그 밖의 신용카드");
					//}
					cd2.setDealCount(cardCount);
					cd2.setValOfSupply(cardValOfSupply);
					cd2.setTax(cardTax);
					cgDetailList.add(cd2);
					//css.setCssDetail(cgDetailList);
					//중간합계효!!!!!!!!!!!!!!!!!!!!!!!!!!!끝끝끝끝
					//CcSalesSlipGap cssg= new CcSalesSlipGap(); 
					cssg.setComCode(comCode);
					cssg.setYearOfAttr(yearInt);
					cssg.setTermDiv(term);
					cssg.setDeadline("N");

					System.out.println("Controller: 값게삲 다하고 dto로 css: "+cssg);
					System.out.println("Controller: 값게삲 다하고 dto로 cd: "+cgDetailList);

					//인설트를 뷰페이지까지 안가고 여기서 테이블에 넣어주고 마감유무를 Y/N으로 구분 시킬꺼임!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
					int insertResult=csser.insertCssg(cssg);
					if(insertResult>0) {
						try {
							String pk=csser.selectCssgPk2(cssg);
							//DetailList 인설트 시켜주기
							System.out.println("Controller: pk: "+pk);
							System.out.println("cgDetailList: "+cgDetailList);
							int insertCssd=csser.insertCssgDetail(cgDetailList,pk);
							System.out.println("Controller: isnertCssd: "+insertCssd);

							int insertCssHis=csser.insertCssgHis(cssgHisList,pk);
							System.out.println("Controller: insertCssHis: "+insertCssHis);

						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}

				}
				
				
				
				
				mv.addObject("cssg", cssg);
				mv.addObject("cgDetailList", cgDetailList);
				mv.addObject("cssgHisList", cssgHisList);
				mv.setViewName("jsonView");
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		return mv;
	}
	

	//인설트
	@RequestMapping("insertCcsalesSlip.cssg")
	public String insertCcsalesSlip(Model model, CcSalesSlipGap cssg,HttpServletRequest request) {
		String pk=null;
		try {
			pk=csser.selectCssgPk2(cssg);
			System.out.println("Controller: insertCcsalesSlip: pk: "+pk);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cssg.setRcptstmtCode(pk);
		System.out.println("Controller: insert: cssg "+cssg);
		int result=csser.updateCcSalesSlipGapDead(cssg);
		System.out.println("Controller: insertCcsalesSlip: result: "+result);
		
		
		return "bugagachi/CreditCardSalesSlipGap";
	}
	
	
	
	
	
	
	// 마감 취소
	@RequestMapping("updateccSalesSilpGap.cssg")
	public String updateCcSalesSlipGap(Model model,CcSalesSlipGap cssg,HttpServletRequest request  ) {
		System.out.println("controller: updateCcSalesSlipGap 진입");
	
		
		//PK이를 기준으로 deadline y->n으로 바꾸기
		int result= csser.updateCcSalesSlipGap(cssg);
		System.out.println("Controller: update: result : "+result);
		
		
		return "bugagachi/CreditCardSalesSlipGap";
		
	} 
	
	
	
}
