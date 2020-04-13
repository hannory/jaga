package com.kh.jaga.slip.controller;

import java.sql.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.slip.model.vo.NormalReceiption;


@Controller
public class normalReceiptionController {

	@RequestMapping("normalReceipSearch.nr")
	public ModelAndView normalReceipSearch(@RequestParam Date date1, @RequestParam Date date2, ModelAndView mv) {
		System.out.println("date1 : " + date1);
		System.out.println("date2 : " + date1);
		
		
		mv.setViewName("jsonView");
		return mv;
	}
}
