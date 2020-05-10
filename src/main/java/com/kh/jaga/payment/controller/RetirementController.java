package com.kh.jaga.payment.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.jaga.company.model.vo.Company;
import com.kh.jaga.employee.model.vo.Employee;
import com.kh.jaga.payment.model.service.RetirementService;
import com.kh.jaga.payment.model.vo.Retirement;
import com.kh.jaga.payment.model.vo.RetirementDTO;
import com.kh.jaga.payment.model.vo.RetirementDTO2;
import com.kh.jaga.payment.model.vo.RetirementTaxAf;

@Controller
public class RetirementController {
	@Autowired
	private RetirementService rs;
	
	@RequestMapping("retirement.rt")
	public String retirement(HttpServletRequest request, Model model) {
		Company company = (Company)request.getSession().getAttribute("loginCompany");
		String comCode = company.getCompanyCode();
		
		List<Employee> list = rs.selectRetireEmp(comCode);
		
		model.addAttribute("empList", list);
		
		return "payment/retirement";
	}
	
	@RequestMapping("detailRetirement.rt")
	public ModelAndView detailRetirement(ModelAndView mv, String empCode) {
		RetirementDTO r = rs.selectRetireInfo(empCode);
		
		/* 평균임금 계산 */
		BigDecimal three = new BigDecimal("3");
		BigDecimal sumAllSalary = r.getSumAllSalary();
		BigDecimal avgBonus = r.getAvgBonus();
		BigDecimal totalSalary = sumAllSalary.add(avgBonus);
		BigDecimal salaryAvg = totalSalary.divide(three, 0, BigDecimal.ROUND_DOWN);
		
		/* 예상퇴직금 */
		BigDecimal samback = new BigDecimal("365");
		BigDecimal allDay = new BigDecimal(r.getAllDay()+"");
		BigDecimal anticipateRtm = salaryAvg.multiply(allDay).divide(samback, 0, BigDecimal.ROUND_DOWN);
		
		/* 달별 총합 */
		for(int i = 0; i < r.getRetirementDTO2().size(); i++) {
			RetirementDTO2 r2 = r.getRetirementDTO2().get(i);
			
			BigDecimal salary = r2.getSalary();
			BigDecimal meals = r2.getMeals();
			BigDecimal drivingSubsidies = r2.getDrivingSubsidies();
			BigDecimal childcareAllowance = r2.getChildcareAllowance();
			BigDecimal nightpay = r2.getNightpay();
			BigDecimal monthlypay = r2.getMonthlypay();
			BigDecimal positionpay = r2.getPositionpay();
			
			BigDecimal sumThisMonth = salary.add(meals).add(drivingSubsidies).add(childcareAllowance).add(nightpay).add(monthlypay).add(positionpay);
			
			r.getRetirementDTO2().get(i).setSumThisMonth(sumThisMonth);
		}
		
		Retirement rt = new Retirement();
		
		/* 종전 퇴직소득정률공제 */
		BigDecimal four = new BigDecimal("40");
		BigDecimal hundred = new BigDecimal("100");
		BigDecimal rtmDecliningBf = anticipateRtm.multiply(four).divide(hundred, 0, BigDecimal.ROUND_DOWN);
		rt.setRtmDecliningBf(rtmDecliningBf);
		
		/* 종전 근속연수 공제 */
		BigDecimal longevityDdcBf = null;
		BigDecimal forDdc1 = new BigDecimal("300000");
		BigDecimal forDdc2 = new BigDecimal("1500000");
		BigDecimal forDdc3 = new BigDecimal("500000");
		BigDecimal forDdc4 = new BigDecimal("4000000");
		BigDecimal forDdc5 = new BigDecimal("800000");
		BigDecimal forDdc6 = new BigDecimal("12000000");
		BigDecimal forDdc7 = new BigDecimal("1200000");
		BigDecimal ttY = new BigDecimal(r.getTtBAllAllYear() + "");
		BigDecimal ttYm = null;
		if(r.getTtBAllAllYear() <= 5) {
			
			longevityDdcBf = forDdc1.multiply(ttY);
		}else if(r.getTtBAllAllYear() <= 10) {
			ttYm = new BigDecimal("5");
			BigDecimal ttY2 = ttY.subtract(ttYm);
			
			longevityDdcBf = forDdc3.multiply(ttY2).add(forDdc2);
		}else if(r.getTtBAllAllYear() <= 20) {
			ttYm = new BigDecimal("10");
			BigDecimal ttY2 = ttY.subtract(ttYm);
			
			longevityDdcBf = forDdc5.multiply(ttY2).add(forDdc4);
		}else {
			ttYm = new BigDecimal("20");
			BigDecimal ttY2 = ttY.subtract(ttYm);
			
			longevityDdcBf = forDdc7.multiply(ttY2).add(forDdc6);
		}
		
		rt.setLongevityDdcBf(longevityDdcBf);
		
		/* 종전 퇴직소득과세표준 */
		BigDecimal rtmStdTaxBf = anticipateRtm.subtract(rtmDecliningBf).subtract(longevityDdcBf);
		
		rt.setRtmStdTaxBf(rtmStdTaxBf);
		
		/* 개정 근속연수공제 */
		BigDecimal longevityDdcAf = null;
		BigDecimal ttYA = new BigDecimal(r.getTtAYear() + "");
		BigDecimal ttYmA = null;
		if(r.getTtAYear()<= 5) {
			
			longevityDdcAf = forDdc1.multiply(ttYA);
		}else if(r.getTtAYear() <= 10) {
			ttYmA = new BigDecimal("5");
			BigDecimal ttY2 = ttYA.subtract(ttYmA);
			
			longevityDdcAf = forDdc3.multiply(ttY2).add(forDdc2);
		}else if(r.getTtAYear() <= 20) {
			ttYmA = new BigDecimal("10");
			BigDecimal ttY2 = ttYA.subtract(ttYmA);
			
			longevityDdcAf = forDdc5.multiply(ttY2).add(forDdc4);
		}else {
			ttYmA = new BigDecimal("20");
			BigDecimal ttY2 = ttYA.subtract(ttYmA);
			
			longevityDdcAf = forDdc7.multiply(ttY2).add(forDdc6);
		}
		
		rt.setLongevityDdcAf(longevityDdcAf);
		
		/* 개정 환산급여 */
		BigDecimal forExchangePymtAf = anticipateRtm.subtract(longevityDdcAf);
		BigDecimal tw = new BigDecimal("12");
		BigDecimal exchangePymtAf = forExchangePymtAf.divide(ttYA, 0, BigDecimal.ROUND_DOWN).multiply(tw);
		
		rt.setExchangePymtAf(exchangePymtAf);
		
		
		/* 개정 환산급여별공제 */
		BigDecimal exchPymtDdcAf = null;
		BigDecimal num1 = new BigDecimal("8000000"); /* 8백만원 */
		BigDecimal num2 = new BigDecimal("70000000");/* 7천만원 */
		BigDecimal num3 = new BigDecimal("100000000");/* 1억원 */
		BigDecimal num4 = new BigDecimal("300000000");/* 3억원 */
		BigDecimal num5 = new BigDecimal("45200000");
		BigDecimal num6 = new BigDecimal("61700000");
		BigDecimal num7 = new BigDecimal("151700000");
		BigDecimal num8 = new BigDecimal("60");
		BigDecimal num9 = new BigDecimal("55");
		BigDecimal num10 = new BigDecimal("45");
		BigDecimal num11 = new BigDecimal("35");
		if(exchangePymtAf.compareTo(num1) == -1 || exchangePymtAf.compareTo(num1) == 0) {
			exchPymtDdcAf = exchangePymtAf;
		}else if(exchangePymtAf.compareTo(num2) == -1 || exchangePymtAf.compareTo(num2) == 0 ) {
			exchPymtDdcAf = exchangePymtAf.subtract(num1).divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num8).add(num1);
		}else if(exchangePymtAf.compareTo(num3) == -1 || exchangePymtAf.compareTo(num3) == 0 ) {
			exchPymtDdcAf = exchangePymtAf.subtract(num2).divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num9).add(num5);
		}else if(exchangePymtAf.compareTo(num4) == -1 || exchangePymtAf.compareTo(num4) == 0 ) {
			exchPymtDdcAf = exchangePymtAf.subtract(num3).divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num10).add(num6);
		}else {
			exchPymtDdcAf = exchangePymtAf.subtract(num4).divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num11).add(num7);
		}
		
		rt.setExchPymtDdcAf(exchPymtDdcAf);
		
		/* 개정 퇴직소득과세표준 */
		BigDecimal retireStdTaxAf = exchangePymtAf.subtract(exchPymtDdcAf);
		
		rt.setRetireStdTaxAf(retireStdTaxAf);
		
		/* 퇴직소득세액 계산 */
		RetirementTaxAf rta1 = new RetirementTaxAf();
		RetirementTaxAf rta2 = new RetirementTaxAf();
		RetirementTaxAf rta3 = new RetirementTaxAf();
		RetirementTaxAf rta4 = new RetirementTaxAf();
		RetirementTaxAf rta5 = new RetirementTaxAf();
		RetirementTaxAf rta6 = new RetirementTaxAf();
		BigDecimal ttAAY = new BigDecimal(r.getTtAllAllYear());
		
		/* 2013 이전 */
		/* 과세표준안분 */
		BigDecimal bf10 = rtmStdTaxBf.divide(ttAAY, 0, BigDecimal.ROUND_HALF_UP).multiply(ttY);
		rta1.setBeforeLongevity(bf10);
		rta1.setCalculCode("10");
		
		/* 연평균과세표준 */
		BigDecimal bf20 = bf10.divide(ttY, 0, BigDecimal.ROUND_DOWN);
		rta2.setBeforeLongevity(bf20);
		rta2.setCalculCode("20");
		
		/* 환산과세표준,환산산출세액 */
		rta3.setBeforeLongevity(new BigDecimal("0"));
		rta4.setBeforeLongevity(new BigDecimal("0"));
		
		/* 연평균산출세액 */
		BigDecimal bf50 = null;
		BigDecimal num41 = new BigDecimal("12000000"); /* 천이백만원 */
		BigDecimal num42 = new BigDecimal("46000000"); /* 사천육백만원 */
		BigDecimal num43 = new BigDecimal("88000000"); /* 8800만원 */
		BigDecimal num44 = new BigDecimal("150000000"); /* 1억5천만원 */
		BigDecimal num45 = new BigDecimal("6");
		BigDecimal num46 = new BigDecimal("15");
		BigDecimal num47 = new BigDecimal("24");
		BigDecimal num48 = new BigDecimal("35");
		BigDecimal num49 = new BigDecimal("38");
		BigDecimal num401 = new BigDecimal("1080000");
		BigDecimal num402 = new BigDecimal("5220000");
		BigDecimal num403 = new BigDecimal("14900000");
		BigDecimal num404 = new BigDecimal("19400000");
		
		if(bf20.compareTo(num41) == -1 || bf20.compareTo(num41) == 0) {
			bf50 = bf20.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num45);
		}else if(bf20.compareTo(num42) == -1 || bf20.compareTo(num42) == 0) {
			bf50 = bf20.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num46).subtract(num401);
			
		}else if(bf20.compareTo(num43) == -1 || bf20.compareTo(num43) == 0) {
			bf50 = bf20.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num47).subtract(num402);
			
		}else if(bf20.compareTo(num44) == -1 || bf20.compareTo(num44) == 0) {
			bf50 = bf20.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num48).subtract(num403);
			
		}else {
			bf50 = bf20.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num49).subtract(num404);
			
		}
		
		rta5.setBeforeLongevity(bf50);
		rta5.setCalculCode("50");
		
		/* 산출세액 */
		BigDecimal bf60 = bf50.multiply(ttY);
		rta6.setBeforeLongevity(bf60);
		rta6.setCalculCode("60");
		
		
		/* 2013 이후 */
		/* 과세표준안분 */
		BigDecimal af10 = rtmStdTaxBf.divide(ttAAY, 0, BigDecimal.ROUND_HALF_UP).multiply(ttYA);
		rta1.setAfterLongevity(af10);
		
		/* 연평균과세표준 */
		BigDecimal af20 = af10.divide(ttYA, 0, BigDecimal.ROUND_DOWN);
		rta2.setAfterLongevity(af20);
		
		/* 환산과세표준 */
		BigDecimal five = new BigDecimal("5");
		BigDecimal af30 = af20.multiply(five);
		rta3.setAfterLongevity(af30);
		rta3.setCalculCode("30");
		
		/* 환산산출세액 */
		BigDecimal af40 = null;
		if(af20.compareTo(num41) == -1 || af20.compareTo(num41) == 0) {
			af40 = af20.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num45);
		}else if(af20.compareTo(num42) == -1 || af20.compareTo(num42) == 0) {
			af40 = af20.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num46).subtract(num401);
			
		}else if(af20.compareTo(num43) == -1 || af20.compareTo(num43) == 0) {
			af40 = af20.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num47).subtract(num402);
			
		}else if(af20.compareTo(num44) == -1 || af20.compareTo(num44) == 0) {
			af40 = af20.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num48).subtract(num403);
			
		}else {
			af40 = af20.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num49).subtract(num404);
			
		}
		rta4.setAfterLongevity(af40);
		rta4.setCalculCode("40");
		
		/* 연평균산출세액 */
		BigDecimal af50 = af40.divide(five, 0, BigDecimal.ROUND_DOWN);
		rta5.setAfterLongevity(af50);
		
		/* 산출세액 */
		BigDecimal af60 = af50.multiply(ttYA);
		rta6.setAfterLongevity(af60);
		
		
		/* 합계 */
		/* 과세표준안분 */
		BigDecimal sum10 = rtmStdTaxBf;
		rta1.setCalculSum(sum10);
		
		/* 연평균과세표준 */
		BigDecimal sum20 = bf20;
		rta2.setCalculSum(sum20);
		
		/* 환산과세표준 */
		BigDecimal sum30 = af30;
		rta3.setCalculSum(sum30);
		
		/* 환산산출세액 */
		BigDecimal sum40 = af40;
		rta4.setCalculSum(sum40);
		
		/* 연평균산출세액 */
		BigDecimal sum50 = bf50.add(af50);
		rta5.setCalculSum(sum50);
		
		/* 산출세액 */
		BigDecimal sum60 = bf60.add(af50);
		rta6.setCalculSum(sum60);
		
		List<RetirementTaxAf> reTaxList = new ArrayList<RetirementTaxAf>();
		reTaxList.add(rta1);
		reTaxList.add(rta2);
		reTaxList.add(rta3);
		reTaxList.add(rta4);
		reTaxList.add(rta5);
		reTaxList.add(rta6);
		
		rt.setRtaList(reTaxList);
		
		
		/* 개정 환산산출세액 */
		BigDecimal exchCalculTaxAf = null;
		if(retireStdTaxAf.compareTo(num41) == -1 || retireStdTaxAf.compareTo(num41) == 0) {
			exchCalculTaxAf = retireStdTaxAf.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num45);
		}else if(retireStdTaxAf.compareTo(num42) == -1 || retireStdTaxAf.compareTo(num42) == 0) {
			exchCalculTaxAf = retireStdTaxAf.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num46).subtract(num401);
		}else if(retireStdTaxAf.compareTo(num43) == -1 || retireStdTaxAf.compareTo(num43) == 0) {
			exchCalculTaxAf = retireStdTaxAf.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num47).subtract(num402);
		}else if(retireStdTaxAf.compareTo(num44) == -1 || retireStdTaxAf.compareTo(num44) == 0) {
			exchCalculTaxAf = retireStdTaxAf.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num48).subtract(num403);
		}else {
			exchCalculTaxAf = retireStdTaxAf.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(num49).subtract(num404);
		}
		
		rt.setExchCalculTaxAf(exchCalculTaxAf);
		
		/* 개정 산출세액 */
		BigDecimal calculTaxAf = exchCalculTaxAf.multiply(ttAAY).divide(tw, 0, BigDecimal.ROUND_DOWN);
		rt.setCalculTaxAf(calculTaxAf);
		
		/* 퇴직소득계산_퇴직소득세 산출세액 */
		BigDecimal rtmCalculTax = null;
		int rtmYear = Integer.parseInt(r.getLeaveDate().substring(0, 4));
		
		if(rtmYear == 2016) {
			BigDecimal be = new BigDecimal("80");
			BigDecimal af = new BigDecimal("20");
			BigDecimal beT = sum60.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(be);
			BigDecimal afT = calculTaxAf.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(af);
			
			rtmCalculTax = beT.add(afT);
			
		}else if(rtmYear == 2017) {
			BigDecimal be = new BigDecimal("60");
			BigDecimal af = new BigDecimal("40");
			
			BigDecimal beT = sum60.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(be);
			BigDecimal afT = calculTaxAf.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(af);
			
			rtmCalculTax = beT.add(afT);
		}else if(rtmYear == 2018) {
			BigDecimal be = new BigDecimal("40");
			BigDecimal af = new BigDecimal("60");
			
			BigDecimal beT = sum60.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(be);
			BigDecimal afT = calculTaxAf.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(af);
			
			rtmCalculTax = beT.add(afT);
		}else if(rtmYear == 2019) {
			BigDecimal be = new BigDecimal("20");
			BigDecimal af = new BigDecimal("80");
			
			BigDecimal beT = sum60.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(be);
			BigDecimal afT = calculTaxAf.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(af);
			
			rtmCalculTax = beT.add(afT);
		}else if(rtmYear == 2020) {
			BigDecimal af = new BigDecimal("100");
			
			BigDecimal afT = calculTaxAf.divide(hundred, 0, BigDecimal.ROUND_DOWN).multiply(af);
			
			rtmCalculTax = afT;
		}
		
		rt.setRtmCalculTax(rtmCalculTax);
		
		rt.setRtmYear(rtmYear);
		
		/* 소득세 */
		BigDecimal incomeTax = rtmCalculTax.setScale(-1, BigDecimal.ROUND_DOWN);
		rt.setIncomeTax(incomeTax);
		
		/* 지방소득세 */
		BigDecimal ten = new BigDecimal("0.1");
		BigDecimal localIncomeTax1 = incomeTax.multiply(ten);
		BigDecimal localIncomeTax = localIncomeTax1.setScale(-1, BigDecimal.ROUND_DOWN);
		
		rt.setLocalIncomeTax(localIncomeTax);
		
		/* 차인지급액 */
		BigDecimal realRetirement = anticipateRtm.subtract(incomeTax).subtract(localIncomeTax);
		rt.setRealRetirement(realRetirement);
		
		mv.addObject("info", r);
		mv.addObject("salaryAvg", salaryAvg);
		mv.addObject("anticipateRtm", anticipateRtm);
		mv.addObject("retirement", rt);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("bonusSearch.rt")
	public ModelAndView selectBonus(ModelAndView mv, String empCode) {
		List<RetirementDTO2> list = rs.selectRetireBonus(empCode);
		
		for(int i = 0; i < list.size(); i++) {
			RetirementDTO2 r2 = list.get(i);
			
			String year = r2.getAttributeDate().substring(0, 4);
			String month = r2.getAttributeDate().substring(4, 6);
			
			list.get(i).setBonusYear(year);
			list.get(i).setBonusMonth(month);
			
			
		}
		
		mv.addObject("bonusList", list);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("insertRetirement.rt")
	public String insertRetirement(Retirement r) {
		System.out.println(r);
		
		return "payment/retirement";
	}

}
