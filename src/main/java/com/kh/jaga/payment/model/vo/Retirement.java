package com.kh.jaga.payment.model.vo;

import java.math.BigDecimal;
import java.util.List;

public class Retirement {
	private String rtmCode; /* 퇴직금 구분번호 */
	private String employeeCode; /* 직원구분번호 */
	private String startDate; /* 정산시작일 */
	private String endDate; /* 정산종료일 */
	private String pymtDate; /* 지급일 */
	private BigDecimal totalSalary; /* 산정계 */
	private BigDecimal salary; /* 급여 */
	private BigDecimal bonus; /* 상여 */
	private BigDecimal salaryAvg; /* 평균임금 */
	private BigDecimal anticipateRtm; /* 예상퇴직금 */
	private String totalSalaryStart; /* 급여산정시작일 */
	private String totalSalaryEnd; /* 급여산정종료일 */
	private String longevity; /* 근속연수 */
	private BigDecimal beforeLongevity; /* 2013년이전 근속년수 */
	private BigDecimal afterLongevity; /* 2013년이후 근속년수 */
	
	private BigDecimal incomeTax; /* 소득세 */
	private BigDecimal localIncomeTax; /* 지방소득세 */
	private BigDecimal rtmBf; /* 퇴직소득(종전) */
	private BigDecimal rtmDecliningBf;	/*퇴직소득정률공제(종전)*/
	private BigDecimal longevityDdcBf;	/*근속연수공제(종전)*/
	private BigDecimal rtmStdTaxBf;	/*퇴직소득과세표준(종전)*/
	private BigDecimal rtmAf; 	/*퇴직소득(개정)*/
	private BigDecimal longevityDdcAf;	/*근속연수공제(개정)*/
	private BigDecimal exchangePymtAf;	/*환산급여(개정)*/
	private BigDecimal exchPymtDdcAf;	/*환산급여별공제(개정)*/
	private BigDecimal retireStdTaxAf;	/*퇴직소득과세표준(개정)*/
	private BigDecimal exchCalculTaxAf;	/*개정규정_환산산출세액*/
	private BigDecimal calculTaxAf;	/*개정규정_산출세액*/
	private BigDecimal rtmCalculTax;	/*퇴직소득세 산출세액*/
	private int rtmYear;	/*퇴직일이 속하는 과세연도*/
	private BigDecimal realRetirement; /* 차인지급액 */
	
	private List<RetirementTaxAf> rtaList;
	
	public Retirement() {}

	public Retirement(String rtmCode, String employeeCode, String startDate, String endDate, String pymtDate,
			BigDecimal totalSalary, BigDecimal salary, BigDecimal bonus, BigDecimal salaryAvg, BigDecimal anticipateRtm,
			String totalSalaryStart, String totalSalaryEnd, String longevity, BigDecimal beforeLongevity,
			BigDecimal afterLongevity, BigDecimal incomeTax, BigDecimal localIncomeTax, BigDecimal rtmBf,
			BigDecimal rtmDecliningBf, BigDecimal longevityDdcBf, BigDecimal rtmStdTaxBf, BigDecimal rtmAf,
			BigDecimal longevityDdcAf, BigDecimal exchangePymtAf, BigDecimal exchPymtDdcAf, BigDecimal retireStdTaxAf,
			BigDecimal exchCalculTaxAf, BigDecimal calculTaxAf, BigDecimal rtmCalculTax, int rtmYear,
			BigDecimal realRetirement, List<RetirementTaxAf> rtaList) {
		super();
		this.rtmCode = rtmCode;
		this.employeeCode = employeeCode;
		this.startDate = startDate;
		this.endDate = endDate;
		this.pymtDate = pymtDate;
		this.totalSalary = totalSalary;
		this.salary = salary;
		this.bonus = bonus;
		this.salaryAvg = salaryAvg;
		this.anticipateRtm = anticipateRtm;
		this.totalSalaryStart = totalSalaryStart;
		this.totalSalaryEnd = totalSalaryEnd;
		this.longevity = longevity;
		this.beforeLongevity = beforeLongevity;
		this.afterLongevity = afterLongevity;
		this.incomeTax = incomeTax;
		this.localIncomeTax = localIncomeTax;
		this.rtmBf = rtmBf;
		this.rtmDecliningBf = rtmDecliningBf;
		this.longevityDdcBf = longevityDdcBf;
		this.rtmStdTaxBf = rtmStdTaxBf;
		this.rtmAf = rtmAf;
		this.longevityDdcAf = longevityDdcAf;
		this.exchangePymtAf = exchangePymtAf;
		this.exchPymtDdcAf = exchPymtDdcAf;
		this.retireStdTaxAf = retireStdTaxAf;
		this.exchCalculTaxAf = exchCalculTaxAf;
		this.calculTaxAf = calculTaxAf;
		this.rtmCalculTax = rtmCalculTax;
		this.rtmYear = rtmYear;
		this.realRetirement = realRetirement;
		this.rtaList = rtaList;
	}

	public String getRtmCode() {
		return rtmCode;
	}

	public void setRtmCode(String rtmCode) {
		this.rtmCode = rtmCode;
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getPymtDate() {
		return pymtDate;
	}

	public void setPymtDate(String pymtDate) {
		this.pymtDate = pymtDate;
	}

	public BigDecimal getTotalSalary() {
		return totalSalary;
	}

	public void setTotalSalary(BigDecimal totalSalary) {
		this.totalSalary = totalSalary;
	}

	public BigDecimal getSalary() {
		return salary;
	}

	public void setSalary(BigDecimal salary) {
		this.salary = salary;
	}

	public BigDecimal getBonus() {
		return bonus;
	}

	public void setBonus(BigDecimal bonus) {
		this.bonus = bonus;
	}

	public BigDecimal getSalaryAvg() {
		return salaryAvg;
	}

	public void setSalaryAvg(BigDecimal salaryAvg) {
		this.salaryAvg = salaryAvg;
	}

	public BigDecimal getAnticipateRtm() {
		return anticipateRtm;
	}

	public void setAnticipateRtm(BigDecimal anticipateRtm) {
		this.anticipateRtm = anticipateRtm;
	}

	public String getTotalSalaryStart() {
		return totalSalaryStart;
	}

	public void setTotalSalaryStart(String totalSalaryStart) {
		this.totalSalaryStart = totalSalaryStart;
	}

	public String getTotalSalaryEnd() {
		return totalSalaryEnd;
	}

	public void setTotalSalaryEnd(String totalSalaryEnd) {
		this.totalSalaryEnd = totalSalaryEnd;
	}

	public String getLongevity() {
		return longevity;
	}

	public void setLongevity(String longevity) {
		this.longevity = longevity;
	}

	public BigDecimal getBeforeLongevity() {
		return beforeLongevity;
	}

	public void setBeforeLongevity(BigDecimal beforeLongevity) {
		this.beforeLongevity = beforeLongevity;
	}

	public BigDecimal getAfterLongevity() {
		return afterLongevity;
	}

	public void setAfterLongevity(BigDecimal afterLongevity) {
		this.afterLongevity = afterLongevity;
	}

	public BigDecimal getIncomeTax() {
		return incomeTax;
	}

	public void setIncomeTax(BigDecimal incomeTax) {
		this.incomeTax = incomeTax;
	}

	public BigDecimal getLocalIncomeTax() {
		return localIncomeTax;
	}

	public void setLocalIncomeTax(BigDecimal localIncomeTax) {
		this.localIncomeTax = localIncomeTax;
	}

	public BigDecimal getRtmBf() {
		return rtmBf;
	}

	public void setRtmBf(BigDecimal rtmBf) {
		this.rtmBf = rtmBf;
	}

	public BigDecimal getRtmDecliningBf() {
		return rtmDecliningBf;
	}

	public void setRtmDecliningBf(BigDecimal rtmDecliningBf) {
		this.rtmDecliningBf = rtmDecliningBf;
	}

	public BigDecimal getLongevityDdcBf() {
		return longevityDdcBf;
	}

	public void setLongevityDdcBf(BigDecimal longevityDdcBf) {
		this.longevityDdcBf = longevityDdcBf;
	}

	public BigDecimal getRtmStdTaxBf() {
		return rtmStdTaxBf;
	}

	public void setRtmStdTaxBf(BigDecimal rtmStdTaxBf) {
		this.rtmStdTaxBf = rtmStdTaxBf;
	}

	public BigDecimal getRtmAf() {
		return rtmAf;
	}

	public void setRtmAf(BigDecimal rtmAf) {
		this.rtmAf = rtmAf;
	}

	public BigDecimal getLongevityDdcAf() {
		return longevityDdcAf;
	}

	public void setLongevityDdcAf(BigDecimal longevityDdcAf) {
		this.longevityDdcAf = longevityDdcAf;
	}

	public BigDecimal getExchangePymtAf() {
		return exchangePymtAf;
	}

	public void setExchangePymtAf(BigDecimal exchangePymtAf) {
		this.exchangePymtAf = exchangePymtAf;
	}

	public BigDecimal getExchPymtDdcAf() {
		return exchPymtDdcAf;
	}

	public void setExchPymtDdcAf(BigDecimal exchPymtDdcAf) {
		this.exchPymtDdcAf = exchPymtDdcAf;
	}

	public BigDecimal getRetireStdTaxAf() {
		return retireStdTaxAf;
	}

	public void setRetireStdTaxAf(BigDecimal retireStdTaxAf) {
		this.retireStdTaxAf = retireStdTaxAf;
	}

	public BigDecimal getExchCalculTaxAf() {
		return exchCalculTaxAf;
	}

	public void setExchCalculTaxAf(BigDecimal exchCalculTaxAf) {
		this.exchCalculTaxAf = exchCalculTaxAf;
	}

	public BigDecimal getCalculTaxAf() {
		return calculTaxAf;
	}

	public void setCalculTaxAf(BigDecimal calculTaxAf) {
		this.calculTaxAf = calculTaxAf;
	}

	public BigDecimal getRtmCalculTax() {
		return rtmCalculTax;
	}

	public void setRtmCalculTax(BigDecimal rtmCalculTax) {
		this.rtmCalculTax = rtmCalculTax;
	}

	public int getRtmYear() {
		return rtmYear;
	}

	public void setRtmYear(int rtmYear) {
		this.rtmYear = rtmYear;
	}

	public BigDecimal getRealRetirement() {
		return realRetirement;
	}

	public void setRealRetirement(BigDecimal realRetirement) {
		this.realRetirement = realRetirement;
	}

	public List<RetirementTaxAf> getRtaList() {
		return rtaList;
	}

	public void setRtaList(List<RetirementTaxAf> rtaList) {
		this.rtaList = rtaList;
	}

	@Override
	public String toString() {
		return "Retirement [rtmCode=" + rtmCode + ", employeeCode=" + employeeCode + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", pymtDate=" + pymtDate + ", totalSalary=" + totalSalary + ", salary="
				+ salary + ", bonus=" + bonus + ", salaryAvg=" + salaryAvg + ", anticipateRtm=" + anticipateRtm
				+ ", totalSalaryStart=" + totalSalaryStart + ", totalSalaryEnd=" + totalSalaryEnd + ", longevity="
				+ longevity + ", beforeLongevity=" + beforeLongevity + ", afterLongevity=" + afterLongevity
				+ ", incomeTax=" + incomeTax + ", localIncomeTax=" + localIncomeTax + ", rtmBf=" + rtmBf
				+ ", rtmDecliningBf=" + rtmDecliningBf + ", longevityDdcBf=" + longevityDdcBf + ", rtmStdTaxBf="
				+ rtmStdTaxBf + ", rtmAf=" + rtmAf + ", longevityDdcAf=" + longevityDdcAf + ", exchangePymtAf="
				+ exchangePymtAf + ", exchPymtDdcAf=" + exchPymtDdcAf + ", retireStdTaxAf=" + retireStdTaxAf
				+ ", exchCalculTaxAf=" + exchCalculTaxAf + ", calculTaxAf=" + calculTaxAf + ", rtmCalculTax="
				+ rtmCalculTax + ", rtmYear=" + rtmYear + ", realRetirement=" + realRetirement + ", rtaList=" + rtaList
				+ "]";
	}

	
}
