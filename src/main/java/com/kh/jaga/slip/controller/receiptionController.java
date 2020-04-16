package com.kh.jaga.slip.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.slip.model.exception.receiptionException;
import com.kh.jaga.slip.model.service.ReceiptionService;
import com.kh.jaga.slip.model.vo.Vender;

@Controller
public class receiptionController {
	
	@Autowired
	private ReceiptionService rs;

	@PostMapping("venderSearch.rp")
	public ModelAndView venderSearch(ModelAndView mv) {
		
		List<Vender> list =null;
		try {
			list = rs.selectVenderList();
		} catch (receiptionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		mv.addObject("venderList", list);
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
}
