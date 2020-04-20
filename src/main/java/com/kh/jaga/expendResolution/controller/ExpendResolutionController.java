package com.kh.jaga.expendResolution.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;
import com.kh.jaga.expendResolution.model.service.ExpendResolutionService;
import com.kh.jaga.expendResolution.model.vo.DepartmentVo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * @author SWY
 * @comment 지출결의서 연결 컨트롤러
 * @createDate 2020. 4. 18.
 */
@Controller
public class ExpendResolutionController {
	
	@Autowired
	ExpendResolutionService service;

	//지출결의서 뷰 보여주는 페이지 //검색할 정보들도 한번에 읽어와서 페이지 이동하기
	@RequestMapping("showExpendResolutionWriteForm.expendResolution")
	public ModelAndView ShowExpendResolutionForm(ModelAndView mv, HttpServletResponse response) {
		
				//제이슨으로도 전달해보자 ,,
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("k01", "v01");
				
				mv.addObject(jsonObj);
				
		
		
		
		
		//검색할 정보들 가져오기	//부서정보
		List<DepartmentVo> deptList = service.selectDeptList();
		
		mv.addObject("deptList",deptList);
		mv.setViewName("expendResolution");
		
		
		
		return mv;
	}//method
	
	//지출결의서 디비에 저장
	@RequestMapping("insertExpendResolution.expendResolution")
	public ModelAndView insertExpendResolution(ModelAndView mv, ExpendResolutionDto dto) {
		
		System.out.println("dto ::: ");
		System.out.println(dto);
		
		int result = service.insertExpendResolution(dto);

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
