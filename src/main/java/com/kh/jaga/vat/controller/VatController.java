package com.kh.jaga.vat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.vat.model.service.VatService;
import com.kh.jaga.vat.model.vo.Vat;

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
		if(vat2!=null) {
			System.out.println("vat2에 값있을때 !!!!!");
			mv.addObject("vat", vat2);
			mv.setViewName("jsonView");
			
		}else{
			
		}
		
		return mv;
	}

}
