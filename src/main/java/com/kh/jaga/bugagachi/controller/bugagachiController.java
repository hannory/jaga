package com.kh.jaga.bugagachi.controller;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.bugagachi.model.vo.CcSalesSilpGap;

@Controller
public class bugagachiController {

	@RequestMapping("ccSalesSilpGap.bu")
	public ModelAndView ccSalesSilpGap(@RequestParam int search_ye1 ,
			@RequestParam int search_ye2,@RequestParam String search_mon1
			,@RequestParam String search_mon2 , ModelAndView mv){
		String term="";
		if(search_mon1.equals("1")&&search_mon2.equals("6")) {
			term="1기확정";
		}else if(search_mon1.equals("7")&&search_mon2.equals("12")) {
			term="2기확정";
		}
		//ccSalesSilpGap(search_ye1, search_ye2, search_mon1, search_mon2, mv)
		return mv;
	}

	
	
}
