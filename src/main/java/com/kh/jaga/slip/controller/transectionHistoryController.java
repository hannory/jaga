package com.kh.jaga.slip.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.slip.model.service.TransectionHistoryService;
import com.kh.jaga.slip.model.vo.Journalize;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Receiption2;

@Controller
public class transectionHistoryController {
	@Autowired
	private TransectionHistoryService ths;
	
	
	@RequestMapping("transListAll.th")
	public String transHistoryListAll(Model model) {
		List<Receiption> list = ths.selectTListAll();
		
		BigDecimal saleValue = new BigDecimal("0");
		BigDecimal buyValue = new BigDecimal("0");
		BigDecimal minusValue = new BigDecimal("0");
		
		for(int i = 0; i < list.size(); i++) {
			Receiption re = list.get(i);
			
			BigDecimal supplyVal = re.getSupplyValue();
			BigDecimal tax = re.getValueTax();
			
			BigDecimal deaga = supplyVal.add(tax);
			re.setSupplyDeaga(deaga);
			
			if(re.getDivision().equals("매출")) {
				saleValue = saleValue.add(re.getSupplyDeaga());
			}else if(re.getDivision().equals("매입")) {
				buyValue = buyValue.add(re.getSupplyDeaga());
			}
		}
		
		minusValue = saleValue.subtract(buyValue);
		
		model.addAttribute("list", list);
		model.addAttribute("sale", saleValue);
		model.addAttribute("buy", buyValue);
		model.addAttribute("minus", minusValue);
		
		return "slip/transectionHistory";
	}
	
	
	@RequestMapping("selectDateList.th")
	public ModelAndView selectDateList(ModelAndView mv, String date1, String date2) {
		System.out.println("date1 : " + date1);
		System.out.println("date2 : " + date2);
		
		Date date11 = Date.valueOf(date1);
		Date date22 = Date.valueOf(date2);
		
		HashMap<String, Date> hm = new HashMap<String, Date>();
		
		hm.put("date1", date11);
		hm.put("date2", date22);
		
		
		List<Receiption2> list = ths.selectDateList(hm);
		
		BigDecimal saleValue = new BigDecimal("0");
		BigDecimal buyValue = new BigDecimal("0");
		BigDecimal minusValue = new BigDecimal("0");
		
		for(int i = 0; i < list.size(); i++) {
			Receiption2 re = list.get(i);
			
			BigDecimal supplyVal = re.getSupplyValue();
			BigDecimal tax = re.getValueTax();
			
			BigDecimal deaga = supplyVal.add(tax);
			re.setSupplyDeaga(deaga);
			
			if(re.getDivision().equals("매출")) {
				saleValue = saleValue.add(re.getSupplyDeaga());
			}else if(re.getDivision().equals("매입")) {
				buyValue = buyValue.add(re.getSupplyDeaga());
			}
		}
		
		System.out.println("list 출렦ㄲㄱ : " + list);
		minusValue = saleValue.subtract(buyValue);
		
		mv.addObject("list", list);
		mv.addObject("sale", saleValue);
		mv.addObject("buy", buyValue);
		mv.addObject("minus", minusValue);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("detailJounalize.th")
	public ModelAndView detailJournal(ModelAndView mv, @RequestParam String slipCode) {
		List<Journalize> list = ths.selectDetailJournal(slipCode);
		
		mv.addObject("list", list);
		mv.setViewName("jsonView");
		return mv;
	}
	
	
}
