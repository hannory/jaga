package com.kh.jaga.vatSumTaxInv.model.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.vatSumTaxInv.model.service.SumOfTaxInvService;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDiv;
import com.kh.jaga.vatSumTaxInv.model.vo.SumOfTaxInvDto;
import com.kh.jaga.vatSumTaxInv.model.vo.SumTaxInvDetail;

@Controller
public class SumOfTaxInvController {
	//세금계산서 합계표 조회
	@Autowired
	private SumOfTaxInvService ss;
	
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
			
		}
		
		
		
		return mv;
		
	}
	
	

}
