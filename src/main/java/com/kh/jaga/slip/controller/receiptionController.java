package com.kh.jaga.slip.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.slip.model.exception.receiptionException;
import com.kh.jaga.slip.model.service.ReceiptionService;
import com.kh.jaga.slip.model.vo.AccountTitle;
import com.kh.jaga.slip.model.vo.Receiption;
import com.kh.jaga.slip.model.vo.Vender;
import com.kh.jaga.taxInvoice.model.vo.TaxInvoice;

/**
 * @author HY S
 * @comment
 * @createDate 2020. 4. 18.
 */
@Controller
public class receiptionController {
	
	@Autowired
	private ReceiptionService rs;

	@GetMapping("venderSearch.rp")
	public ModelAndView venderSearch(ModelAndView mv, HttpServletRequest request) {
		Company com = (Company)request.getSession().getAttribute("loginCompany");
		String comCode = com.getCompanyCode();
		
		List<Vender> list =null;
		try {
			list = rs.selectVenderList(comCode);
		} catch (receiptionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		mv.addObject("data", list);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@GetMapping("accountSearch.rp")
	public ModelAndView accountSearch(ModelAndView mv, HttpServletRequest request) {
		Company com = (Company)request.getSession().getAttribute("loginCompany");
		String comCode = com.getCompanyCode();
		
		List<AccountTitle> list =null;
			list = rs.selectAccountTitleList(comCode);
			
		
		
		mv.addObject("data", list);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@PostMapping("calculTax.rp")
	public ModelAndView calculTax(ModelAndView mv, @RequestParam String supplydeaga) {

		BigDecimal sv = new BigDecimal(supplydeaga);	//공급대가
		BigDecimal ev = new BigDecimal("11");			
		BigDecimal ten = new BigDecimal("10");
		
		BigDecimal tax = sv.divide(ev, 0, BigDecimal.ROUND_DOWN); //부가세
		BigDecimal value = sv.subtract(tax);

		mv.addObject("value", value);
		mv.addObject("tax", tax);
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	@PostMapping("insertReceiption.rp")
	public String insertReceiption(Receiption receiption, HttpServletRequest request) {
		Company com = (Company)request.getSession().getAttribute("loginCompany");
		String comCode = com.getCompanyCode();
		
		receiption.setSlipDivision("매입매출");
		
		String division = receiption.getDivision();
		
		if(division.equals("buy")) {
			division = "매입";
		}else if(division.equals("sale")) {
			division = "매출";
		}
		
		receiption.setDivision(division);
		receiption.setComCode(comCode);

		String dateSlipCode = rs.selectDateSlipCode(receiption);
		if(dateSlipCode == null) {
			dateSlipCode = "50001";
		}else {
			dateSlipCode = (Integer.parseInt(dateSlipCode)+1) + "";
		}
		receiption.setDateSlipCode(dateSlipCode);
		
		
		int result = rs.insertReceiption(receiption);
		
		
		
		return "slip/receiptionForm";
	}
	
	
	@RequestMapping("excelUpload.rp")
	public String excelUpload(@RequestParam MultipartFile excelFile) {
		List<Receiption> exList = rs.uploadExcel(excelFile);
		
		return "slip/receiptionForm";
	}
}
