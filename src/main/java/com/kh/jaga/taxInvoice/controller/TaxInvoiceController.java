package com.kh.jaga.taxInvoice.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.service.TransectionHistoryService;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.taxInvoice.model.service.TaxInvoiceService;

@Controller
public class TaxInvoiceController {
	
	@Autowired
	private TaxInvoiceService tis;
	
	
	@RequestMapping("taxInvoiceListAll.ti")
	public String taxInvoiceListAll(Model model, HttpServletRequest request) {
		Company com = (Company)request.getSession().getAttribute("loginCompany");
		
		List<Receiption> list = tis.selectTListAll(com);
		
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
		
		return "slip/taxInvoiceIssue";
	}
	
	@RequestMapping("taxInvoicePrint.ti")
	private String taxInvoicePrint(String slipCode) {
		
		
		return "slip/taxInvoicePrint";
	}
	
}
