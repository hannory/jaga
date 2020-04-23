package com.kh.jaga.payment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.employee.model.service.BusinessEmpService;
import com.kh.jaga.employee.model.vo.BusinessEmp;
import com.kh.jaga.payment.model.service.BusinessPaymentService;
import com.kh.jaga.payment.model.vo.BusinessPayList;
import com.kh.jaga.payment.model.vo.BusinessPayment;

@Controller
public class BusinessPaymentController {
	@Autowired
	private BusinessEmpService bes;
	
	@Autowired
	private BusinessPaymentService bps;
	
	
	@RequestMapping("BPaymentList.bp")
	public String BPaymenrList(HttpServletRequest request, Model model) {
		Company com = (Company)request.getSession().getAttribute("loginCompany");
		String comCode = com.getCompanyCode();
		List<BusinessEmp> list = bes.selectBEmpList(comCode);
		System.out.println(list);
		int employeeNum = 0;
		
		if(list.size() == 0) {
			 employeeNum = 10001;
		}else {
			employeeNum = Integer.parseInt(list.get(list.size()-1).getEmployeeNum()) + 1;
		}
		
		model.addAttribute("empList", list);
		model.addAttribute("employeeNum", employeeNum);
		
		
		return "payment/businessPayment";
	}
	
	@RequestMapping("insertBPay.bp")
	public String insertBPay(BusinessPayList bpl, Model model) {
		System.out.println(bpl); 
		
		//int result = bps.insertBPay(list);
		
		return "redirect:BPaymentList.bp";
	}
}
