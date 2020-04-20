package com.kh.jaga.finStmt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
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
       return "compTrialBal";
    }
	
	@GetMapping("stmtOfFinPos.fs")
    public String showStmtOfFinPos() {
       return "stmtOfFinPos";
    }
	
	@GetMapping("incomeStmt.fs")
	public String showIncomeStmt() {
		return "incomeStmt";
	}
	
	@GetMapping("mfrgCostsStmt.fs")
	public String showMfrgCostsStmt() {
		return "mfrgCostsStmt";
	}
	
	@GetMapping("stmtOfCashFlow.fs")
	public String showStmtOfCashFlow() {
		return "stmtOfCashFlow";
	}	
	
	@RequestMapping("insertIncomeStmt.fs")
	public String insertIncomeStmt(IncomeStmt i, Model model) {
		
		System.out.println("incomeStmt : " + i);
		
		//System.out.println("result : " + fss.insertIncomeStmt(i));
		
		fss.insertIncomeStmt(i);
		
		return "redirect:index.jsp";
	}
	
	@RequestMapping("selectIncomeStmt.fs")
	public void selectIncomeStmt(IncomeStmtAccount isa, HttpServletResponse response) throws IOException {
		System.out.println("year : " + isa.getYear());
		System.out.println("month : " + isa.getMonth());
		
		HashMap hmap = fss.selectIncomeStmt(isa);
		
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
		
		response.setContentType("application/json");
		
		new Gson().toJson(hmap, response.getWriter());
	}
	
}

















