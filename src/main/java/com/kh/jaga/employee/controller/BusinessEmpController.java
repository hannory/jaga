package com.kh.jaga.employee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.employee.model.service.BusinessEmpService;
import com.kh.jaga.employee.model.vo.Bank;
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
	public String bEmpListAll() {
		
		return "";
	}
}
