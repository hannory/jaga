package com.kh.jaga.slip.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class normalReceiptionController {

	@RequestMapping("normalReceipSearch.nr")
	public ModelAndView normalReceipSearch(@RequestParam Date date1, @RequestParam Date date2, ModelAndView mv) {
		System.out.println("date1 : " + date1);
		System.out.println("date2 : " + date1);
		
		
		mv.setViewName("jsonView");
		return mv;
	}
	@PostMapping("normalValue.nr")
	public String normalValue(HttpServletRequest request) {
		
		return "";
	}
}
