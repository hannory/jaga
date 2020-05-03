package com.kh.jaga.accountBook.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.type.BigDecimalTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.accountBook.model.service.AccountBookService;
import com.kh.jaga.accountBook.model.vo.GenderLedgerDTO;
import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.vo.AccountTitle;

@Controller
public class AccountBookController {
	@Autowired
	private AccountBookService abs;
	
	@GetMapping("dailyTable.ab")
	public String showDailyTable() {
		return "dailyTable";
	}
	
	@RequestMapping("generalLedger.ab")
	public String generalLedger(HttpServletRequest request, Model model) {
		Company com = (Company)request.getSession().getAttribute("loginCompany");
		String comCode = com.getCompanyCode();
		
		List<AccountTitle> list = abs.selectAccountList(comCode);
		
		model.addAttribute("list", list);
		
		return "generalLedger";
	}
	
	@RequestMapping("selectOneAccount.ab")
	public ModelAndView selectOneAccount(ModelAndView mv, String accountCode, HttpServletRequest request) {
		Company com = (Company)request.getSession().getAttribute("loginCompany");
		String comCode = com.getCompanyCode();
		
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("comCode", comCode);
		hm.put("accountCode", accountCode);
		
		List<GenderLedgerDTO> list = abs.selectOneAccount(hm);
		
		System.out.println("-------------" + list);
		BigDecimal firstSumAll = list.get(0).getSumAll();
		BigDecimal firstcha = list.get(0).getPriceSumCha();
		BigDecimal firstDea = list.get(0).getPriceSumDea();
		BigDecimal lastSumAll = firstSumAll.add(firstDea).subtract(firstcha);
		
		BigDecimal chaSum = new BigDecimal("0");
		BigDecimal deaSum = new BigDecimal("0");
		
		for(int i = 0; i < list.size(); i++) {
			GenderLedgerDTO gld = list.get(i);
			chaSum = chaSum.add(gld.getPriceSumCha());
			deaSum = deaSum.add(gld.getPriceSumDea());
		}
		
		mv.addObject("list", list);
		mv.addObject("lastSum", lastSumAll);
		mv.addObject("chaSum", chaSum);
		mv.addObject("deaSum", deaSum);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("selectOneAccountDay.ab")
	public ModelAndView selectOneAccountDay(ModelAndView mv, String accountCode, HttpServletRequest request) {
		Company com = (Company)request.getSession().getAttribute("loginCompany");
		String comCode = com.getCompanyCode();
		
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("comCode", comCode);
		hm.put("accountCode", accountCode);
		
		List<GenderLedgerDTO> list = abs.selectOneAccountDay(hm);
		
		System.out.println("-------------" + list);
		BigDecimal firstSumAll = list.get(0).getSumAll();
		BigDecimal firstcha = list.get(0).getPriceSumCha();
		BigDecimal firstDea = list.get(0).getPriceSumDea();
		BigDecimal lastSumAll = firstSumAll.add(firstDea).subtract(firstcha);
		
		BigDecimal chaSum = new BigDecimal("0");
		BigDecimal deaSum = new BigDecimal("0");
		
		for(int i = 0; i < list.size(); i++) {
			GenderLedgerDTO gld = list.get(i);
			chaSum = chaSum.add(gld.getPriceSumCha());
			deaSum = deaSum.add(gld.getPriceSumDea());
		}
		
		mv.addObject("list", list);
		mv.addObject("lastSum", lastSumAll);
		mv.addObject("chaSum", chaSum);
		mv.addObject("deaSum", deaSum);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
}
