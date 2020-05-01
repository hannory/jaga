package com.kh.jaga.slip.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.service.ReceiptionService;
import com.kh.jaga.slip.model.vo.NormalReceiptionDTO;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Receiption2;


@Controller
public class normalReceiptionController {
	
	@Autowired
	private ReceiptionService rs;

	@RequestMapping("normalReceipSearch.nr")
	public ModelAndView normalReceipSearch(String date1,String date2, ModelAndView mv, HttpServletRequest request) {
		System.out.println("date1 : " + date1);
		System.out.println("date2 : " + date1);
		
		Date date11 = Date.valueOf(date1);
		Date date22 = Date.valueOf(date2);
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("date1", date11);
		hm.put("date2", date22);
		
		
		Company com = (Company)request.getSession().getAttribute("loginCompany");
		String comCode = com.getCompanyCode();
		
		hm.put("comCode", comCode);
		
		List<NormalReceiptionDTO> receiption = rs.selectNormalDateList(hm);
		
		for(int i = 0; i < receiption.size(); i++) {
			String date = receiption.get(i).getSlipDate();
			String[] attDate = date.split("-");
			String month = attDate[1];
			String day = attDate[2];
			
			receiption.get(i).setMonth(month);
			receiption.get(i).setDay(day);
		}
		
		mv.addObject("list", receiption);
		
		mv.setViewName("jsonView");
		return mv;
	}
	@PostMapping("normalValue.nr")
	public String normalValue(HttpServletRequest request, Receiption receiption) {
		System.out.println(receiption);
		
		Company com = (Company)request.getSession().getAttribute("loginCompany");
		String comCode = com.getCompanyCode();
		
		receiption.setComCode(comCode);
		receiption.setSlipDivision("일반");
		BigDecimal valueTax = new BigDecimal("0");
		receiption.setValueTax(valueTax);
		receiption.setDeemedStatus("N");
		
		int result = rs.insertReceiption(receiption);
		
		
		return "redirect:normalList.nr";
	}
	
	@RequestMapping("normalList.nr")
	public String normalList(Model model, HttpServletRequest request) {
		Company com = (Company)request.getSession().getAttribute("loginCompany");
		String comCode = com.getCompanyCode();
		
		List<NormalReceiptionDTO> receiption = rs.selectNormalList(comCode);
		
		for(int i = 0; i < receiption.size(); i++) {
			String date = receiption.get(i).getSlipDate();
			String[] attDate = date.split("-");
			String month = attDate[1];
			String day = attDate[2];
			
			receiption.get(i).setMonth(month);
			receiption.get(i).setDay(day);
		}
		
		model.addAttribute("list", receiption);
		
		return "slip/normalReceiptionForm";
	}
}
