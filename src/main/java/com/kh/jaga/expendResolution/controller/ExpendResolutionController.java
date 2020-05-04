package com.kh.jaga.expendResolution.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.jaga.companyInnerId.model.vo.ComInIdVo;
import com.kh.jaga.expendResolution.model.dto.ExpendResolutionDto;
import com.kh.jaga.expendResolution.model.service.ExpendResolutionService;
import com.kh.jaga.expendResolution.model.vo.AccountTitleVo;
import com.kh.jaga.expendResolution.model.vo.DepartmentVo;
import com.kh.jaga.expendResolution.model.vo.ExpendResolutionDetailVo;

import net.sf.json.JSONArray;


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
	public ModelAndView ShowExpendResolutionForm(ModelAndView mv, HttpServletResponse response, HttpServletRequest request) {
		
		//검색할 정보들 가져오기	
		ComInIdVo empVo = (ComInIdVo) request.getSession().getAttribute("loginEmp");
		String comCome = empVo.getComCode();
		
		//1.부서정보
		List<DepartmentVo> deptList = service.selectDeptList();
		mv.addObject("deptList",deptList);		//리스트 추가
		JSONArray jsonList = JSONArray.fromObject(deptList);
		mv.addObject("jsonList", jsonList);		//json타입 리스트 추가
		
		System.out.println("\n@@@@@@@@@@@@@@@@@@@@\n");
		System.out.println(deptList);
		System.out.println("\n@@@@@@@@@@@@@@@@@@@@\n");
		System.out.println(jsonList);
		System.out.println("\n@@@@@@@@@@@@@@@@@@@@\n");
		
		//2.계정과목
		List<AccountTitleVo> accountTitleList = service.selectAccountTitleList();
		mv.addObject("accountTitleList", accountTitleList);				//리스트 추가
		JSONArray jsonAccountTitleList = JSONArray.fromObject(accountTitleList);
		mv.addObject("jsonAccountTitleList", jsonAccountTitleList);		//json타입 리스트 추가
		
		//3.담당자
		List<ComInIdVo> comInIdList = service.selectComInIdList(comCome);
		mv.addObject("comInIdList", comInIdList);				//리스트 추가
		JSONArray jsonComInIdList = JSONArray.fromObject(comInIdList);
		mv.addObject("jsonComInIdList", jsonComInIdList);		//json타입 리스트 추가

		//이제 화면 보여주기
		mv.setViewName("expendResolution/expendResolution");
		return mv;
	}//method
	
	
	
	//지출결의서 디비에 저장(인서트)
	@RequestMapping("insertExpendResolution.expendResolution")
	public ModelAndView insertExpendResolution(ModelAndView mv, ExpendResolutionDto dto, HttpServletRequest request) {
		
//		System.out.println("dto ::: ");
//		System.out.println(dto);
		
		int result = service.insertExpendResolution(dto);
		System.out.println("지출결의서 인서트 결과 ::::: " + result);
		
		if(result > 0) {
			request.getSession().setAttribute("alertCode", "insertExpendResolutionOk");
		}

		mv.setViewName("common/alertPage");
		return mv;
	}//method
	
	
	//탭메뉴 이동 - 지출결의서 목록 조회                     
	@RequestMapping("showExpendResolutionList.expendResolution")
	public ModelAndView showExpendResolutionList(ModelAndView mv) {
		
		//리스트 조회해오기
		List<ExpendResolutionDto> dtoList = service.selectExpendResolutionList(); 
		
//		System.out.println("조회결과 :::::::");
//		System.out.println(dtoList);
		
		
//		for(int i = 0; i < dtoList.size(); i++) {
//			//날짜 0000-00-00 로 자르기
//			dtoList.get(i).setExpendDate(dtoList.get(i).getExpendDate().substring(0,dtoList.get(i).getExpendDate().indexOf(" ")));
//		}
		
		mv.addObject("dtoList", dtoList);
		
		mv.setViewName("expendResolution/expendResolutionList");
		return mv;
	}//method
	
	
	
	
	
	//지출결의서 리스트에서 행 클릭시 동작하는 ajax
	@RequestMapping("selectExpendResolutionDetail.expendResolution")
	public void testMethod(HttpServletResponse response, String expendResolutionNo) {
//		System.out.println(expendResolutionNo);
		
		
		ExpendResolutionDto selectOneResult = service.selectExpendResolutionOne(expendResolutionNo);
		
		System.out.println("============조회결과==============");
		System.out.println(selectOneResult);

		List<ExpendResolutionDetailVo> detailVoList = null;
		if(selectOneResult != null) {
			detailVoList = service.selectDetailList(expendResolutionNo);
//			System.out.println("==========리스트==========");
//			System.out.println(detailVoList);
		}else {
			System.out.println("ExpendResolutionController > Exception");
		}
		
		
		
		try {
			//view 로 값 전달하기
//			response.getWriter().print(selectOneResult);
//			response.getWriter().print(detailVoList);
			
			
			HashMap<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("selectOneResult", selectOneResult);
			hmap.put("detailList", detailVoList);
//			response.getWriter().print(new Gson().toJson(hmap));
			
			ObjectMapper mapper = new ObjectMapper();
			String tempStr = mapper.writeValueAsString(hmap);
			response.getWriter().print(tempStr);
			
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}//method
	
	
	
	
	
}//class
