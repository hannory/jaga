package com.kh.jaga.aggregateIncomeTax.controller;

import java.io.IOException;
import java.util.HashMap;
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
import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.AggregateCalculatedDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.AmountDataDto;
import com.kh.jaga.aggregateIncomeTax.model.dto.IncomeAmountStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.service.AggregateService;

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
		/* 소득금액명세서 처음 화면 보여주기 */
		
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
		
		return "aggregateIncomeTax/aggregateIncomeTax";
	}
	
	
	
	
	
	
	
	
	//소득금액명세서 입력하기 , (인설트)
	@RequestMapping("insertIncomeAmount.aggregate")
	public String insertIncomeAmount(IncomeAmountStmtDto dto, HttpServletRequest request) {
		
		System.out.println("소득금액 저장을 눌러서 이 메소드가 호출됨");
		System.out.println("뷰에서 넘어온 데이터 : " +  dto);
		
		int result = service.insertIncomeAmount(dto);
		
		if(result > 0) {
			System.out.println("소득금액 저장 성공...(result) :" + result);
			request.getSession().setAttribute("alertCode", "insertIncomeAmountOk");
		}else {
			System.out.println("소득금액 저장 실패...");
			request.getSession().setAttribute("alertCode", "fail");
		}
		
		return "common/alertPage";
	}

	
	
	//소득금액명세서 ajax . 코드 40 입력 시 데이터 가져옴
	@RequestMapping("getData40.aggregate")
	public void getData40(HttpServletResponse response, 
			@RequestParam(required = false) String attrYear, 
			String comCode) {
		System.out.println("attrYear : " + attrYear);
		if(attrYear == "") {
			attrYear = "2019";
		}
		
		System.out.println("ajax가 getData40 메소드를 부름");
		System.out.println("attrYear : " + attrYear);
		System.out.println("comCode : " + comCode);
		
		//마이바티스용 객체 하나 만듦
		Map<String, String> info = new HashMap<String, String>();
		info.put("attrYear", attrYear);
		info.put("comCode", comCode);
		
		AmountDataDto amountData = service.getData40(info);
		System.out.println("디비에서 가져온 데이터 ::: ");
		System.out.println(amountData);
		
		
		
		try {
			response.getWriter().print(new Gson().toJson(amountData));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("showIncomeDeductStmt.aggregate")
	public String showIncomeDeductStmt() {
		/* 소득공제명세서 */
		
		return "aggregateIncomeTax/incomeDeductStmt";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//가산명세서 조회
	@RequestMapping("showAddedTaxStmt.aggregate")
	public String showAddedTaxStmt() {
		/* 가산세명세서 */
		return "aggregateIncomeTax/addedTaxStmt";
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//종합소득세 계산서 조회
	@RequestMapping("showAggregateCalculated.aggregate")
	public String showAggregateCalculated() {
		/* 종합소득세액계산서 */
		return "aggregateIncomeTax/aggregateCalculated";
	}
	
	
	
	
	//종소세 년도 조회 시 ajax로 들어옴
	@RequestMapping("selectAggregateCalculated.aggregate")
	public void selectAggregateCalculated(
			HttpServletResponse response,
			String yearOfAttr,
			String comCode,
			String key, 
			String key2 ) {

		//해당 년도로 조회해와서 뷰에 값 넘겨주기
		System.out.println("attrYear : " + yearOfAttr);
		System.out.println("comCode : " + comCode);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("yearOfAttr",yearOfAttr);
		map.put("comCode", comCode);
		
		AggregateCalculatedDto dto = service.selectAggregateCalculated(map);
		System.out.println("디비에서 가져온 dto 결과 : " + dto);
		
		
		if(dto == null) {
			System.out.println("조회된거없음");
		}else {
			System.out.println("조회한 종소세 문서 ::: ");
			System.out.println(dto);
		}
		
		
		try {
			response.getWriter().print(new Gson().toJson(dto));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
}//class









