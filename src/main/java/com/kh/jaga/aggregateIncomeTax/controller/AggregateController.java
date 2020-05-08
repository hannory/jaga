package com.kh.jaga.aggregateIncomeTax.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.service.AggregateService;
import com.kh.jaga.aggregateIncomeTax.model.vo.BizCodeVo;
import com.kh.jaga.finStmt.model.vo.IncomeStmt;

import net.sf.json.JSONArray;

/**
 * @author SWY
 * @comment 종합소득세 컨트롤러
 * @createDate 2020. 4. 29.
 */
@Controller
public class AggregateController {
	
	@Autowired
	AggregateService service;
	
	@RequestMapping("showAggregateIncomeTax.aggregate")
	public String showAggregateIncomeTax(Model model) {
		/* 소득금액명세서 */
		
		//뷰에서 처리해주기때문에 안불러와도 될듯
//		//업종코드 불러오기
//		List<BizCodeVo> bizCodeList = service.selectBizCodeList();
//		System.out.println("컨트롤러 > 쿼리 실행결과 받아온 데이터 :::");
//		System.out.println("============================================================");
//		System.out.println(bizCodeList);
//		System.out.println("============================================================");
//		model.addAttribute("bizCodeList", bizCodeList);
//		
//		JSONArray bizCodeArray = JSONArray.fromObject(bizCodeList);
//		model.addAttribute("bizCodeArray", bizCodeArray);
		
		return "aggregateIncomeTax";
	}
	
	
	
	
	
	
	
	//소득금액명세서 입력하기
	@RequestMapping("")
	public String insertAggregateIncomeStmt() {
		
		
		
		return "zzz";
	}

	
	
	//ajax . 코드 40 입력 시 데이터 가져옴
	@RequestMapping("getData40.aggregate")
	public void getData40(HttpServletResponse response, 
			@RequestParam(required = false) String attrYear, 
			String comCode) {
		
		if(attrYear == null) {
			attrYear = "2019";
		}
		
		System.out.println("ajax가 getData40 메소드를 부름");
		System.out.println("attrYear : " + attrYear);
		System.out.println("comCode : " + comCode);
		
		Map<String, String> info = new HashMap<String, String>();
		info.put("attrYear", attrYear);
		info.put("comCode", comCode);
		
		IncomeStmt inStmt = service.getData40(info);
		System.out.println("디비에서 가져온 데이터 ::: ");
		System.out.println(info);
		
		
		
		try {
			response.getWriter().print(new Gson().toJson(inStmt));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("showIncomeDeductStmt.aggregate")
	public String showIncomeDeductStmt() {
		/* 소득공제명세서 */
		
		return "incomeDeductStmt";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//가산명세서 조회
	@RequestMapping("showAddedTaxStmt.aggregate")
	public String showAddedTaxStmt() {
		/* 가산세명세서 */
		return "addedTaxStmt";
	}
	
	

	
	
	//가산명세서 입력
	@RequestMapping("insertAddedTaxStmt.aggregate")
	public String insertAddedTaxStmt(@ModelAttribute AddedTaxStmtDto dto, HttpServletRequest request) {
		System.out.println("저장 버튼 눌렀음 ,, 컨트롤러도착,, dto :::");
		System.out.println(dto);
		
		int result = service.insertAddedTaxStmt(dto);
		
//		model.addAttribute("result", result);
//		model.addAttribute("message","가산세 입력 성공");
		if(result == 1) {
			request.setAttribute("message", "가산세 입력 성공");
			return "redirect:addedTaxSuccessPage.jsp";
		}
		
		return "redirect:errorPage.jsp";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("showAggregateCalculated.aggregate")
	public String showAggregateCalculated() {
		/* 종합소득세액계산서 */
		return "aggregateCalculated";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}//class









