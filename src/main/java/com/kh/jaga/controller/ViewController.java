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
		System.out.println(ts.abcd());
		return "slip/normalReceiptionForm";
	}
	
	@GetMapping("/sumTableTax.vi")
	public String sumTableTax() {
		System.out.println(ts.abcd());
		return "bugagachi/sumTableOfTaxInvoices";
	}
}
