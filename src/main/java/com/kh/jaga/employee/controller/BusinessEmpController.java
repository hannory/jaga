package com.kh.jaga.employee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.employee.model.service.BusinessEmpService;
import com.kh.jaga.employee.model.vo.Bank;
import com.kh.jaga.employee.model.vo.BusinessEmp;
import com.kh.jaga.employee.model.vo.BusinessEmp2;
import com.kh.jaga.employee.model.vo.TypeOfBizCode;

@Controller
public class BusinessEmpController {
	@Autowired
	private BusinessEmpService bes;
	
	@RequestMapping("bankSearch.be")
	public ModelAndView bankSearch(ModelAndView mv) {
		List<Bank> bk = bes.selectBankList();
		
		mv.addObject("bkList", bk);
		
		return mv;
	}
	
	@RequestMapping("tobcSearch.be")
	public ModelAndView tobcSearch(ModelAndView mv) {
		List<TypeOfBizCode> bk = bes.selectTOBList();
		
		System.out.println(bk);
		
		mv.addObject("bkList", bk);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("businessEmpList.be")
	public String bEmpListAll(BusinessEmp be, Model model, HttpServletRequest request) {
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
		
		return "employee/businessEmployee";
	}
	
	@RequestMapping("addBusinessEmp.be")
	public String addBusinessEmp(BusinessEmp be, Model model) {
		int result = bes.insertBEmp(be);
		
		return "redirect:businessEmpList.be";
	}
	
	
	@RequestMapping("addBusinessEmp2.be")
	public String addBusinessEmp2(BusinessEmp be, Model model) {
		System.out.println("수정용ㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+be);
		int result = bes.updateBEmp(be);
		
		return "redirect:businessEmpList.be";
	}
	
	@RequestMapping("detailBEmp.be")
	public ModelAndView detailBEmp(ModelAndView mv, @RequestParam String empCode, HttpServletResponse response) {
		BusinessEmp2 be = bes.selectOneBEmp(empCode);
		
		
		mv.addObject("BEmp", be);
		mv.setViewName("jsonView");
		
		return mv;
	}
}
