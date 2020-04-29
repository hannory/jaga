package com.kh.jaga.finStmt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.finStmt.model.service.FinStmtService;
import com.kh.jaga.finStmt.model.vo.IncomeStmt;
import com.kh.jaga.finStmt.model.vo.IncomeStmtAccount;

import net.sf.json.JSONObject;

/**
 * @author hannory
 * @comment Financial Statement(재무제표) 관련 Controller 
 * @createDate 2020. 4. 8.
 */
@Controller
public class FinStmtController {
	@Autowired
	private FinStmtService fss;
	
	@GetMapping("compTrialBal.fs")
    public String showCompTrialBal() {
       return "finStmt/compTrialBal";
    }
	
	@GetMapping("stmtOfFinPos.fs")
    public String showStmtOfFinPos() {
       return "finStmt/stmtOfFinPos";
    }
	
	@GetMapping("incomeStmt.fs")
	public String showIncomeStmt(HttpServletRequest request) {
//		Company loginCompany = (Company) request.getSession().getAttribute("loginCompany"); 
//		
//		if(loginCompany == null) {
//			request.getSession().setAttribute("msg", "로그인을 해주세요");
//			
//			return "common/alertPage";
//		} else {
//			return "finStmt/incomeStmt";
//		}
		
		return "finStmt/incomeStmt";
	}
	
	@GetMapping("mfrgCostsStmt.fs")
	public String showMfrgCostsStmt() {
		return "finStmt/mfrgCostsStmt";
	}
	
	@GetMapping("stmtOfCashFlow.fs")
	public String showStmtOfCashFlow() {
		return "finStmt/stmtOfCashFlow";
	}	
	
	@RequestMapping("insertIncomeStmt.fs")
	public String insertIncomeStmt(IncomeStmt i, Model model, HttpServletRequest request) {
		
		System.out.println("incomeStmt : " + i);
		
		i.setComCode(((Company) request.getSession().getAttribute("loginCompany")).getCompanyCode());
		
		fss.insertIncomeStmt(i);
		
		return "finStmt/incomeStmt";
	}
	
	@RequestMapping("selectIncomeStmt.fs")
	public void selectIncomeStmt(IncomeStmtAccount isa, HttpServletRequest request,HttpServletResponse response) {
		System.out.println("year : " + isa.getYear());
		System.out.println("month : " + isa.getMonth());
		
		isa.setComCode(((Company) request.getSession().getAttribute("loginCompany")).getCompanyCode());
		
		HashMap hmap = fss.selectIncomeStmt(isa);
		
		//JSON 사용
//		JSONObject jmap = new JSONObject();
//		jmap.put(14600, jmap.get(14600));
//		jmap.put(40100, jmap.get(40100));
//		jmap.put(83000, jmap.get(83000));
//		
//		response.setContentType("application/json");
//		PrintWriter out = response.getWriter();
//		out.print(jmap.toString());
//		out.flush();
//		out.close();
		
		//GSON 사용
		try {
			response.setContentType("application/json");
			new Gson().toJson(hmap, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("selectSlip.fs")
	public void selectSlip(IncomeStmtAccount isa, HttpServletRequest request, HttpServletResponse response) {
		isa.setComCode(((Company) request.getSession().getAttribute("loginCompany")).getCompanyCode());
		
		System.out.println("curPast : " + isa.getCurPast());
		
		ArrayList<IncomeStmtAccount> list;
		
		if(isa.getCurPast().equals("c")) {
			//당기일 경우
			list = fss.selectSlip(isa);
		} else {
			//전기일 경우
			int curYear = isa.getYear();
			isa.setYear(curYear - 1);
			list = fss.selectSlip(isa);
		}
		
		response.setContentType("application/json");
		
		try {
			new Gson().toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("selectMfrgCostStmt.fs")
	public void selectMfrgCostStmt(IncomeStmtAccount isa, HttpServletRequest request, HttpServletResponse response) {
		isa.setComCode(((Company) request.getSession().getAttribute("loginCompany")).getCompanyCode());
		
		HashMap hmap = fss.selectMfrgCostStmt(isa);
		
		try {
			response.setContentType("application/json");
			new Gson().toJson(hmap, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}

















