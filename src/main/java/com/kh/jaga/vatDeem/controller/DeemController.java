package com.kh.jaga.vatDeem.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.slip.model.vo.Receiption;
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
			System.out.println("deem.DemmedCode: "+deem.getDeemedCode());
			
			//찾으러감
			deo=ds.selectDeemOther(deo);
			System.out.println("마감했을때 deo: "+deo);
			mv.addObject("deem",deem);
			mv.addObject("deemPro",dpList);
			mv.addObject("deemOther",deo);
			mv.addObject("deemSlip",dsList);
			mv.setViewName("jsonView");
			
		}else if(deem==null) {
			System.out.println("의제매입 값 없을때!!!!!!!!!!!!!");
			Deem deem2=new Deem();
			
			deem2.setComCode(comCode);
			deem2.setYearOfAttr(yearInt);
			deem2.setVatTerm(term);
			
			int insertDeem=ds.insertDeem(deem2);
			String deemedCode="";
			if(insertDeem>0) {
				deemedCode=ds.selectDeemedCode();
			}
			deem2.setDeemedCode(deemedCode);
			
			Receiption re=new Receiption();
			re.setSlipDivision("매입매출");
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
				List<DeemSlip> dsList=ds.selectDeemSlip(re,eD);
				
				BigDecimal gon=new BigDecimal("0.0740740741");
				System.out.println("Gon: "+gon);
				for(DeemSlip ds:dsList) {
					ds.setDeemedCode(deemedCode);
					ds.setDeemTaxPrice(ds.getPurchasePrice().multiply(gon));
				}
				
				//deemSlip insert 해주기
				int insertDeemSlip=ds.insertDeemSlip(dsList);
				BigDecimal deemSum=BigDecimal.ZERO;
				
				List<DeemPro> dpList=new ArrayList<DeemPro>();
				
				BigDecimal dProPrice=BigDecimal.ZERO;
				for(DeemSlip dss:dsList) {
					if(dss.getBizRegNum().length()<=12) {
					DeemPro dp=new DeemPro();
					dp.setDeemedCode(deemedCode);
					dp.setVenderCode(dss.getVenderCode());
					dp.setVenderName(dss.getVenderName());
					dp.setProdName(dss.getItem());
					dp.setBizRegNum(dss.getBizRegNum());
					deemSum=deemSum.add(dss.getPurchasePrice());
					dpList.add(dp);
					}
				}
				
				System.out.println("dsList2: "+dsList);
				for(DeemSlip dss:dsList) {
					DeemPro dp=new DeemPro();
					dp.setVenderCode(dss.getVenderCode());
					if(dss.getBizRegNum().length()>=14) {
						DeemPro dPro=ds.selectFarm(dp,re,eD);
						dp.setFarmFishPurCode(dPro.getFarmFishPurCode());
						dp.setPurchasePrice(dPro.getPurchasePrice());
						dp.setCountFf(dPro.getCountFf());
						dp.setNumofTxn(dPro.getNumofTxn());
						dp.setBizRegNum(dPro.getBizRegNum());
						dp.setDeemedCode(deemedCode);
						dp.setProdName(dPro.getProdName());
						dp.setVenderCode(dPro.getVenderCode());
						dp.setVenderName(dPro.getVenderName());
						deemSum=deemSum.add(dPro.getPurchasePrice());
						dpList.add(dp);
					}
					
				}
				
				//deemPro insert 해주기
				int insertDeemPro=ds.insertDeemPro(dpList);
				
				
				
				//DeemOther 값 가져오기
				//DeemOther 값 넣기
				DeemOther deo=new DeemOther();
				BigDecimal asmt=ds.selectAsmt(re,eD);
				deo.setDeemedCode(deemedCode);
				deo.setAsmtConf(asmt);
				deo.setAsmtSum(deo.getAsmtConf().add(deo.getAsmtScheduled()));
				deo.setTargetRate(new BigDecimal("0.4"));
				deo.setTargetAmt((deo.getAsmtSum().multiply(deo.getTargetRate())).setScale(0,BigDecimal.ROUND_DOWN));
				deo.setCurrPurAmt(deemSum);
				if(deo.getCurrPurAmt().compareTo(deo.getTargetAmt())==-1) {
					deo.setDedAmt(deo.getCurrPurAmt());
				}else {
					deo.setDedAmt(deo.getTargetAmt());
				}
				BigDecimal son=new BigDecimal("4");
				BigDecimal mom=new BigDecimal("104");
				deo.setDedtaxRate(son.divide(mom,4,BigDecimal.ROUND_DOWN));
				deo.setDedtaxAmt((deo.getDedAmt().multiply(deo.getDedtaxRate())).setScale(0,BigDecimal.ROUND_DOWN));
				deo.setDedTaxrate1(deo.getDedtaxAmt().subtract(deo.getDedtaxSum()));
				
				//insertDeemOther
				int insertDeemOther=ds.insertDeemOther(deo);
				
				mv.addObject("deem",deem2);
				mv.addObject("deemPro",dpList);
				mv.addObject("deemOther",deo);
				mv.addObject("deemSlip",dsList);
				mv.setViewName("jsonView");
			
			}catch (Exception e) {
				// TODO: handle exception
			}
			
			
			
		}
		
		
		
		
		
		
		
		
		return mv;
	}
	
	
	@RequestMapping("deadLine.vd")
	public String deadLine(Model model, Deem deem ,HttpServletRequest request) {
		System.out.println("Controller: deadLine: "+deem);
		int result=ds.updatedeem(deem);
		return "bugagachi/deemedInputTax";
	}
	
	@RequestMapping("updatdDeadLineCen.vd")
	public String deadlineCen(Model model, Deem deem ,HttpServletRequest request) {
		System.out.println("Controller: deadLineCen: "+deem);
		int result=ds.updateDeadCenDeem(deem);
		return "bugagachi/deemedInputTax";
	}
}
