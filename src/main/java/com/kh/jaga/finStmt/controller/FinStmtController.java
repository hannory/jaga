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
import com.kh.jaga.finStmt.model.vo.MfrgStmt;

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
	
	@GetMapping("mfrgStmt.fs")
	public String showMfrgStmt() {
		return "finStmt/mfrgStmt";
	}
	
	@GetMapping("stmtOfCashFlow.fs")
	public String showStmtOfCashFlow() {
		return "finStmt/stmtOfCashFlow";
	}	
	
	@RequestMapping("insertIncomeStmt.fs")
	public String insertIncomeStmt(IncomeStmt i, HttpServletRequest request) {
		
		i.setComCode(((Company) request.getSession().getAttribute("loginCompany")).getCompanyCode());
		
		int result = fss.insertIncomeStmt(i);
		
		System.out.println("CHECK : result Controller : " + result);
		
		if(result > 0) {
			request.getSession().setAttribute("alertCode", "successIncome");
			
			return "common/alertPage";
		} else {
			request.getSession().setAttribute("alertCode", "failIncome");
			
			return "common/alertPage";
		}

		//return "finStmt/incomeStmt";
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
		
		ArrayList<IncomeStmtAccount> list = fss.selectSlip(isa);
		
		response.setContentType("application/json");
		
		try {
			new Gson().toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("selectSlipByDate.fs")
	public void selectSlipByDate(IncomeStmtAccount isa, String accountClass, HttpServletRequest request, HttpServletResponse response) {
		isa.setComCode(((Company) request.getSession().getAttribute("loginCompany")).getCompanyCode());
		
		ArrayList<IncomeStmtAccount> list = fss.selectSlipByDate(isa, accountClass);
		
		response.setContentType("application/json");
		
		try {
			new Gson().toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("selectMfrgStmt.fs")
	public void selectMfrgCostStmt(IncomeStmtAccount isa, HttpServletRequest request, HttpServletResponse response) {
		isa.setComCode(((Company) request.getSession().getAttribute("loginCompany")).getCompanyCode());
		
		HashMap hmap = fss.selectMfrgStmt(isa);
		
		try {
			response.setContentType("application/json");
			new Gson().toJson(hmap, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//제조원가명세서에서 저장 또는 마감 버튼을 눌렀을 시
	@RequestMapping("insertMfrgStmt.fs")
	public String insertMfrgStmt(MfrgStmt ms, String pValSum90, HttpServletRequest request) {
		ms.setComCode(((Company) request.getSession().getAttribute("loginCompany")).getCompanyCode());
		
		//당기 값 입력
		int cResult = fss.insertMfrgStmt(ms);			
		
		System.out.println("pValSum90 : " + pValSum90);
		
		//전기 값 입력
		ms.setYear(ms.getYear() - 1);
		ms.setSum90(Integer.parseInt(pValSum90));
		int pResult = fss.insertMfrgStmt(ms);
		
		if(cResult <= 0 || pResult <= 0) {
			request.getSession().setAttribute("alertCode", "failMfrg");
			
			return "common/alertPage";
		} else {
			request.getSession().setAttribute("alertCode", "successMfrg");
			
			return "common/alertPage";
		}
	}
	
	@RequestMapping("searchMfrg.fs")
	public void searchMfrg(MfrgStmt ms, HttpServletRequest request, HttpServletResponse response) {
		ms.setComCode(((Company) request.getSession().getAttribute("loginCompany")).getCompanyCode());
		
		MfrgStmt resultMs = fss.searchMfrg(ms);
		
		if(resultMs != null) {
			int countClosed = fss.countClosedMfrg(ms);
			String sCountClosed = Integer.toString(countClosed);
			
			JSONObject result = new JSONObject();
			result.put("val13", resultMs.getVal13());
			result.put("closing", resultMs.getClosing());
			result.put("countClosed", sCountClosed);
			
			
			try {
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				out.print(result.toString());
				out.flush();
				out.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	@RequestMapping("countClosedMfrg.fs")
	public void countClosedMfrg(MfrgStmt ms, HttpServletRequest request, HttpServletResponse response) {
		ms.setComCode(((Company) request.getSession().getAttribute("loginCompany")).getCompanyCode());
		
		int count = fss.countClosedMfrg(ms);
		String sCount = Integer.toString(count);
		
		try {
			response.getWriter().print(sCount);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("selectFinPos.fs")
	public void selectFinPos(IncomeStmtAccount isa, HttpServletRequest request, HttpServletResponse response) {
		isa.setComCode(((Company) request.getSession().getAttribute("loginCompany")).getCompanyCode());
		
		HashMap hmap = fss.selectFinPos(isa);
		
		try {
			response.setContentType("application/json");
			new Gson().toJson(hmap, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("searchIncomeStmt.fs")
	public void searchIncomeStmt(IncomeStmt is, HttpServletRequest request, HttpServletResponse response) {
		is.setComCode(((Company) request.getSession().getAttribute("loginCompany")).getCompanyCode());
		
		IncomeStmt resultIs = fss.searchIncomeStmt(is);
		
		if(resultIs != null) {
			int countClosed = fss.countClosedIncomeStmt(is);
			String sCountClosed = Integer.toString(countClosed);
			
			JSONObject result = new JSONObject();
			result.put("val213", resultIs.getVal213());
			result.put("closing", resultIs.getClosing());
			result.put("countClosed", sCountClosed);
			
			try {
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				out.print(result.toString());
				out.flush();
				out.close();
				
			} catch (IOException e) {
				
				e.printStackTrace();
			}
					
		}
	}
	
	@RequestMapping("countClosedIncomeStmt.fs")
	public void countClosedIncomeStmt(IncomeStmt is, HttpServletRequest request, HttpServletResponse response) {
		is.setComCode(((Company) request.getSession().getAttribute("loginCompany")).getCompanyCode());
		
		int count = fss.countClosedIncomeStmt(is);
		String sCount = Integer.toString(count);
		
		try {
			response.getWriter().print(sCount);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}

















