package com.kh.jaga.slip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.slip.model.service.ReceiptionService;
import com.kh.jaga.slip.model.vo.Vender;

@Controller
public class receiptionController {
	
	@Autowired
	private ReceiptionService rs;

	@PostMapping("venderSearch.rp")
	public ModelAndView venderSearch(ModelAndView mv) {
		System.out.println("출력 테스트");
		
		List<Vender> list = rs.selectVenderList();
		
		mv.setViewName("jsonView");
		return mv;
	}
}
