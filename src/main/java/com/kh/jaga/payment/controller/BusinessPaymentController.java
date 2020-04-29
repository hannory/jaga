package com.kh.jaga.payment.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.employee.model.service.BusinessEmpService;
import com.kh.jaga.employee.model.vo.BusinessEmp;
import com.kh.jaga.employee.model.vo.BusinessEmp2;
import com.kh.jaga.payment.model.service.BusinessPaymentService;
import com.kh.jaga.payment.model.vo.BusinessPayList;
import com.kh.jaga.payment.model.vo.BusinessPayment;
import com.kh.jaga.slip.model.service.ReceiptionService;
import com.kh.jaga.slip.model.vo.Journalize;
import com.kh.jaga.slip.model.vo.Receiption;


/**
 * @author EunJin
 * @comment 사업소득자료입력 관련 컨트롤러
 * @createDate 2020. 4. 24.
 */
@Controller
public class BusinessPaymentController {
	@Autowired
	private BusinessEmpService bes;
	
	@Autowired
	private BusinessPaymentService bps;
	
	@Autowired
	private ReceiptionService rs;
	
	/**
	 * @comment 메뉴에서 사업소득자료 클릭시 사업소득자 리스트를 불러오는 컨트롤러 메소드
	 * @comment BUSINESS_EMP/SELECT
	 * @param request
	 * @param model
	 * @return 
	 */
	@RequestMapping("BPaymentList.bp")
	public String BPaymenrList(HttpServletRequest request, Model model) {
		Company com = (Company)request.getSession().getAttribute("loginCompany");
		String comCode = com.getCompanyCode();
		List<BusinessEmp> list = bes.selectBEmpList(comCode);
		
		
		
		
		model.addAttribute("empList", list);
		
		
		return "payment/businessPayment";
	}
	
	/**
	 * @comment 사업소득자 급여 입력 컨트롤러 메소드
	 * @comment BUSINESS_INCOME_HISTORY/insert
	 * @param bpl
	 * @param model
	 * @param employeeCode
	 * @return
	 */
	@RequestMapping("insertBPay.bp")
	public String insertBPay(BusinessPayList bpl, Model model, String employeeCode) {
		System.out.println(bpl); 
		
		List<BusinessPayment> list = bpl.getBpList();
		
		for(int i = 0; i < list.size(); i++) {
			BusinessPayment bp = list.get(i);
			bp.setEmployeeCode(employeeCode);
			bp.setAttributeDate(Integer.parseInt(bp.getAttYear()+bp.getAttMonth()));
			bp.setPayDate(bp.getPayYear()+"-"+bp.getPayMonth()+"-"+bp.getPayDay());
			
			Date date = new Date(Integer.parseInt(bp.getPayYear()), Integer.parseInt(bp.getPayMonth()),Integer.parseInt(bp.getPayDay()));
			
			Receiption rp = new Receiption();
			rp.setSlipDivision("일반");
			rp.setDivision("매입");
			rp.setSlipDate(date);
			rp.setSupplyValue(bp.getSalary());
			BigDecimal zero = new BigDecimal("0");
			rp.setValueTax(zero);
			rp.setDeemedStatus("N");
			
			Journalize j = new Journalize();
			j.setDebitCredit("차변");
			j.setPrice(bp.getSalary());
			j.setAccountCode("83100");
			
			Journalize o = new Journalize();
			o.setDebitCredit("대변");
			o.setPrice(bp.getDifferencePymt());
			o.setAccountCode("10300");
			
			Journalize u = new Journalize();
			u.setDebitCredit("대변");
			u.setPrice(bp.getIncomeTax());
			u.setAccountCode("25400");
			
			Journalize r = new Journalize();
			r.setDebitCredit("대변");
			r.setPrice(bp.getLocalIncomeTax());
			r.setAccountCode("25400");
			
			List<Journalize> lj = new ArrayList<Journalize>();
			
			lj.add(j);
			lj.add(o);
			lj.add(u);
			lj.add(r);
			
			rp.setJournalizeList(lj);
			
			int result2 = rs.insertReceiption(rp);
		}

		
		
		int result = bps.insertBPay(list);
		
		return "redirect:BPaymentList.bp";
	}
	
	/**
	 * @comment 
	 * @param mv
	 * @param salary 입력한 지급액이 넘어옴
	 * @return
	 */
	@RequestMapping("calculTax.bp")
	public ModelAndView calculTax(ModelAndView mv, @RequestParam String salary) {
		BigDecimal payment = new BigDecimal(salary);
		BigDecimal percent = new BigDecimal("0.03");
		BigDecimal lPercent = new BigDecimal("0.1");
		BigDecimal incomeTax = null;
		BigDecimal localTax = null;
		BigDecimal difference = null;
		
		incomeTax = payment.multiply(percent);
		BigDecimal it =  incomeTax.setScale(-1, RoundingMode.FLOOR);
		
		
		localTax = it.multiply(lPercent);
		BigDecimal lt = localTax.setScale(-1, RoundingMode.FLOOR);
		
		difference = payment.subtract(it).subtract(lt);
		
		mv.addObject("incomeTax",it);
		mv.addObject("localTax", lt);
		mv.addObject("di", difference);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("detailBEmp.bp")
	public ModelAndView detailBEmp(ModelAndView mv, @RequestParam String empCode, HttpServletResponse response) {
		BusinessEmp2 be = bes.selectOneBEmp(empCode);
		
		DecimalFormat fm = new DecimalFormat("###,###");
		
		List<BusinessPayment> list1 = bps.selectBPay(empCode);
		
		for(int i = 0; i < list1.size(); i++) {
			BusinessPayment bp = list1.get(i);
			
			String payDate = bp.getPayDate();
			String[] date = payDate.split("-");
			bp.setPayYear(date[0]);
			bp.setPayMonth(date[1]);
			bp.setPayDay(date[2]);
			
			String att = Integer.valueOf(bp.getAttributeDate()).toString();
			bp.setAttYear(att.substring(0, 4));
			bp.setAttMonth(att.substring(4, 6));
			
//			BigDecimal sa = new BigDecimal(fm.format(bp.getSalary()));
//			bp.setSalary(sa);
//			
//			BigDecimal it = new BigDecimal(fm.format(bp.getIncomeTax()));
//			bp.setIncomeTax(it);
//			
//			BigDecimal lt = new BigDecimal(fm.format(bp.getLocalIncomeTax()));
//			bp.setLocalIncomeTax(lt);
//			
//			BigDecimal dp = new BigDecimal(fm.format(bp.getDifferencePymt()));
//			bp.setDifferencePymt(dp);
		}
		
		mv.addObject("payList", list1);
		mv.addObject("BEmp", be);
		mv.setViewName("jsonView");
		
		return mv;
	}
}
