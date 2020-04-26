package com.kh.jaga.taxInvoice.controller;

import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.taxInvoice.model.service.TaxInvoiceService;
import com.kh.jaga.taxInvoice.model.vo.TaxInvoicePrintDTO;

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
	private String taxInvoicePrint(String slipCode, Model model) {
		TaxInvoicePrintDTO tip = tis.selectTaxInvoice(slipCode);
		
		int result = tis.updatePrintStatus(slipCode);
		
		/* 날짜 나눠줌 */
		String[] date = tip.getSlipDate().split("-");
		tip.setYear(Integer.parseInt(date[0]));
		tip.setMonth(Integer.parseInt(date[1]));
		tip.setDate(Integer.parseInt(date[2]));
		
		/* 공급가액/세액 나눠줌 */
		ArrayList<Character> supply = new ArrayList<Character>();
		ArrayList<Character> tax = new ArrayList<Character>();
		for(int i = 0; i < tip.getSupplyValue().length(); i++) {
			
			supply.add(tip.getSupplyValue().charAt(i));
		}
		for(int i = 0; i < tip.getValueTax().length(); i++) {
			
			tax.add(tip.getValueTax().charAt(i));
		}
		
		
		BigDecimal ga = new BigDecimal(tip.getSupplyValue());
		BigDecimal tx = new BigDecimal(tip.getValueTax());
		BigDecimal deaga = ga.add(tx);
		
		tip.setSupplyDeaga(deaga);
		
		model.addAttribute("info", tip);
		model.addAttribute("supply", supply);
		model.addAttribute("supplyLength", tip.getSupplyValue().length());
		model.addAttribute("tax", tax);
		model.addAttribute("taxLength", tip.getValueTax().length());
		
		return "slip/taxInvoicePrint";
	}
	
}
