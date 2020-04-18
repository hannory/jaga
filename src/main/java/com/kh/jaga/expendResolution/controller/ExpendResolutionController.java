package com.kh.jaga.expendResolution.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;

/**
 * @author SWY
 * @comment 지출결의서 연결 컨트롤러
 * @createDate 2020. 4. 18.
 */
@Controller
public class ExpendResolutionController {

	//지출결의서 뷰 보여주는 페이지 //검색할 정보들도 한번에 읽어와서 페이지 이동하기
	@RequestMapping("showExpendResolutionWriteForm.expendResolution")
	public ModelAndView ShowExpendResolutionForm(ModelAndView mv, ExpendResolutionDto dto) {
		
		//검색할 정보들 가져오기	//근데 아직 검색할게 없으니 일단 냅두기
		System.out.println("받아온 정보 :::");
		System.out.println(dto);
		
		
		mv.addObject("test","testValue");
		mv.setViewName("expendResolution");
		
		return mv;
	}//method
	
	//지출결의서 디비에 저장
	@RequestMapping("insertExpendResolution.expendResolution")
	public ModelAndView insertExpendResolution(ModelAndView mv, ExpendResolutionDto dto) {
		
		System.out.println("dto ::: ");
		System.out.println(dto);
		
		mv.setViewName("redirect:index.jsp");
		return mv;
	}//method
	
	
	//탭메뉴 이동 - 지출결의서 목록
	@RequestMapping("showExpendResolutionList.expendResolution")
	public ModelAndView showExpendResolutionList(ModelAndView mv) {
		
		mv.setViewName("expendResolutionList");
		return mv;
	}
	
	
	
}//class
