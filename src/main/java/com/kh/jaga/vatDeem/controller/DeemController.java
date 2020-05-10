package com.kh.jaga.vatDeem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.vatDeem.model.service.DeemService;
import com.kh.jaga.vatDeem.model.vo.Deem;
import com.kh.jaga.vatDeem.model.vo.DeemOther;
import com.kh.jaga.vatDeem.model.vo.DeemPro;
import com.kh.jaga.vatDeem.model.vo.DeemSlip;

@Controller
public class DeemController {
	@Autowired
	private DeemService ds;
	
	@RequestMapping("deemedSearch.vd")
	public ModelAndView deemedSearch(@RequestParam String search_ye ,
			@RequestParam String search_mon1,
			@RequestParam String search_mon2 ,
			@RequestParam String comCode,
			ModelAndView mv) {
		
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
		
		Deem deem=new Deem();
		
		deem.setComCode(comCode);
		deem.setVatTerm(term);
		deem.setYearOfAttr(yearInt);
		
		//의제매입신고서 마감된거 있나 없나 찾으러감
		deem=ds.selectDeem(deem);
		System.out.println("controller: selectDeem: deem: "+deem);
		
		
		if(deem !=null) {
			System.out.println("deem 값이 있을때!!!!!!!!!!!!!!!!!");
			DeemPro dp=new DeemPro();
			dp.setDeemedCode(deem.getDeemedCode());
			
			//공급자 찾으러감
			System.out.println("Controller: 공급자 찾으러가기전:"+dp);
			List<DeemPro> dpList=ds.selectDeemPro(dp);
			System.out.println("Controller: selectDeemPro: dp: "+dpList);
			
			//구분표 가지러감
			DeemSlip dSlip=new DeemSlip();
			dSlip.setDeemedCode(deem.getDeemedCode());
			List<DeemSlip> dsList=ds.selectDeemSlip(dSlip);
			System.out.println("Controller: selectDeemSlip: dsList: "+dsList);	
			
			//deemOther(과세표준 표 가지러가기)
			DeemOther deo=new DeemOther();
			deo.setDeemedCode(deem.getDeemedCode());
			
			//찾으러감
			deo=ds.selectDeemOther(deo);
			mv.addObject("deem",deem);
			mv.addObject("deemPro",dpList);
			mv.addObject("deemOther",deo);
			mv.addObject("deemSlip",dsList);
			mv.setViewName("jsonView");
			
		}
		
		
		
		
		
		
		
		
		return mv;
	}
}
