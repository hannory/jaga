package com.kh.jaga.vender.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jaga.vender.model.service.VenderService;
import com.kh.jaga.vender.model.vo.Vender;

@Controller
/* @SessionAttributes("loginCompany") */
public class VenderController {
	
	@Autowired
	private VenderService vs;
	
	@RequestMapping("insert.ve")
	public String insertVender(Model model, Vender v, HttpServletRequest request) {
		
		vs.insertVender(v);
		
		return "";
		
	}
}
