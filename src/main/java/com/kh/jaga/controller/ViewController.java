package com.kh.jaga.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jaga.service.testService;

@Controller
public class ViewController {
	
	@Autowired
	private testService ts;

	@GetMapping("/normalReceiption.vi")
	public String normalReceiption() {
		return "slip/normalReceiptionForm";
	}
	
	@GetMapping("/sumTableTax.vi")
	public String sumTableTax() {
		return "bugagachi/sumTableOfTaxInvoices";
	}
	@GetMapping("/tranHis.vi")
	public String transectionHistory() {
		return "slip/transectionHistory";
	}
	@GetMapping("/receiption.vi")
	public String reciptionForm() {
		return "slip/receiptionForm";
	}
	@GetMapping("showViewCeateCompanyId.vi")
	   public String showViewCeateCompanyId() {
	      System.out.println("showViewCeateCompanyId 메소드 호출됨 ㅎ");
	      return "createCompanyId/createCompanyId";
	   }

}
