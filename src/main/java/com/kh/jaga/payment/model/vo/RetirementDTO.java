package com.kh.jaga.payment.model.vo;

import java.math.BigDecimal;
import java.util.List;

public class RetirementDTO {
	private String employeeCode; /* 직원코드 */
	private String enrollDate; /* 입사일 */
	private String employeeName; /* 직원이름 */
	private String leaveDate; /* 퇴사일 */
	private int year; /* 근속연수 년 */
	private int month; /* 근속연수 월 */
	private int day; /* 근속연수 일 */
	private int allYear;
	private int allMonth;
	private int allDay;
	private String threeBeforeMonth; /* 3개월전 날짜 */
	private int lastThree;/* 3개월 전 달의 남은 날 */
	private String extDay;/* 퇴사달 일한 날 수 */
	private BigDecimal sumSalary; /* 3개월 급여합계 */
	private BigDecimal sumMeals;/* 3개월 식대합계 */
	private BigDecimal sumDrivingSubsidies;/* 3개월 자가운전보조금합계 */
	private BigDecimal sumChildcareAllowance;/* 3개월 육아비합계 */
	private BigDecimal sumNightpay;/* 3개월 야간근로비 */
	private BigDecimal sumMonthlypay;/* 3개월 월차수당 */
	private BigDecimal sumPositionpay;/* 3개월 직책수당 */
	private BigDecimal sumAllSalary;/* 3개월 전체 합계 */
	private BigDecimal avgBonus;/* 상여금 평균 */
	private BigDecimal sumBonus;/* 상여금 합계 */
	private int ttAll;
	private int ttAllYear;
	private int ttAllMonth;
	private int ttAllAllYear;
	private int ttBMonth;
	private int ttBAllYear;
	private int ttBAllMonth;
	private int ttBAllAllYear;
	private int ttAYear;
	private List<RetirementDTO2> retirementDTO2;
    
	public RetirementDTO() {}

	public RetirementDTO(String employeeCode, String enrollDate, String employeeName, String leaveDate, int year,
			int month, int day, int allYear, int allMonth, int allDay, String threeBeforeMonth, int lastThree,
			String extDay, BigDecimal sumSalary, BigDecimal sumMeals, BigDecimal sumDrivingSubsidies,
			BigDecimal sumChildcareAllowance, BigDecimal sumNightpay, BigDecimal sumMonthlypay,
			BigDecimal sumPositionpay, BigDecimal sumAllSalary, BigDecimal avgBonus, BigDecimal sumBonus, int ttAll,
			int ttAllYear, int ttAllMonth, int ttAllAllYear, int ttBMonth, int ttBAllYear, int ttBAllMonth,
			int ttBAllAllYear, int ttAYear, List<RetirementDTO2> retirementDTO2) {
		super();
		this.employeeCode = employeeCode;
		this.enrollDate = enrollDate;
		this.employeeName = employeeName;
		this.leaveDate = leaveDate;
		this.year = year;
		this.month = month;
		this.day = day;
		this.allYear = allYear;
		this.allMonth = allMonth;
		this.allDay = allDay;
		this.threeBeforeMonth = threeBeforeMonth;
		this.lastThree = lastThree;
		this.extDay = extDay;
		this.sumSalary = sumSalary;
		this.sumMeals = sumMeals;
		this.sumDrivingSubsidies = sumDrivingSubsidies;
		this.sumChildcareAllowance = sumChildcareAllowance;
		this.sumNightpay = sumNightpay;
		this.sumMonthlypay = sumMonthlypay;
		this.sumPositionpay = sumPositionpay;
		this.sumAllSalary = sumAllSalary;
		this.avgBonus = avgBonus;
		this.sumBonus = sumBonus;
		this.ttAll = ttAll;
		this.ttAllYear = ttAllYear;
		this.ttAllMonth = ttAllMonth;
		this.ttAllAllYear = ttAllAllYear;
		this.ttBMonth = ttBMonth;
		this.ttBAllYear = ttBAllYear;
		this.ttBAllMonth = ttBAllMonth;
		this.ttBAllAllYear = ttBAllAllYear;
		this.ttAYear = ttAYear;
		this.retirementDTO2 = retirementDTO2;
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getAllYear() {
		return allYear;
	}

	public void setAllYear(int allYear) {
		this.allYear = allYear;
	}

	public int getAllMonth() {
		return allMonth;
	}

	public void setAllMonth(int allMonth) {
		this.allMonth = allMonth;
	}

	public int getAllDay() {
		return allDay;
	}

	public void setAllDay(int allDay) {
		this.allDay = allDay;
	}

	public String getThreeBeforeMonth() {
		return threeBeforeMonth;
	}

	public void setThreeBeforeMonth(String threeBeforeMonth) {
		this.threeBeforeMonth = threeBeforeMonth;
	}

	public int getLastThree() {
		return lastThree;
	}

	public void setLastThree(int lastThree) {
		this.lastThree = lastThree;
	}

	public String getExtDay() {
		return extDay;
	}

	public void setExtDay(String extDay) {
		this.extDay = extDay;
	}

	public BigDecimal getSumSalary() {
		return sumSalary;
	}

	public void setSumSalary(BigDecimal sumSalary) {
		this.sumSalary = sumSalary;
	}

	public BigDecimal getSumMeals() {
		return sumMeals;
	}

	public void setSumMeals(BigDecimal sumMeals) {
		this.sumMeals = sumMeals;
	}

	public BigDecimal getSumDrivingSubsidies() {
		return sumDrivingSubsidies;
	}

	public void setSumDrivingSubsidies(BigDecimal sumDrivingSubsidies) {
		this.sumDrivingSubsidies = sumDrivingSubsidies;
	}

	public BigDecimal getSumChildcareAllowance() {
		return sumChildcareAllowance;
	}

	public void setSumChildcareAllowance(BigDecimal sumChildcareAllowance) {
		this.sumChildcareAllowance = sumChildcareAllowance;
	}

	public BigDecimal getSumNightpay() {
		return sumNightpay;
	}

	public void setSumNightpay(BigDecimal sumNightpay) {
		this.sumNightpay = sumNightpay;
	}

	public BigDecimal getSumMonthlypay() {
		return sumMonthlypay;
	}

	public void setSumMonthlypay(BigDecimal sumMonthlypay) {
		this.sumMonthlypay = sumMonthlypay;
	}

	public BigDecimal getSumPositionpay() {
		return sumPositionpay;
	}

	public void setSumPositionpay(BigDecimal sumPositionpay) {
		this.sumPositionpay = sumPositionpay;
	}

	public BigDecimal getSumAllSalary() {
		return sumAllSalary;
	}

	public void setSumAllSalary(BigDecimal sumAllSalary) {
		this.sumAllSalary = sumAllSalary;
	}

	public BigDecimal getAvgBonus() {
		return avgBonus;
	}

	public void setAvgBonus(BigDecimal avgBonus) {
		this.avgBonus = avgBonus;
	}

	public BigDecimal getSumBonus() {
		return sumBonus;
	}

	public void setSumBonus(BigDecimal sumBonus) {
		this.sumBonus = sumBonus;
	}

	public int getTtAll() {
		return ttAll;
	}

	public void setTtAll(int ttAll) {
		this.ttAll = ttAll;
	}

	public int getTtAllYear() {
		return ttAllYear;
	}

	public void setTtAllYear(int ttAllYear) {
		this.ttAllYear = ttAllYear;
	}

	public int getTtAllMonth() {
		return ttAllMonth;
	}

	public void setTtAllMonth(int ttAllMonth) {
		this.ttAllMonth = ttAllMonth;
	}

	public int getTtAllAllYear() {
		return ttAllAllYear;
	}

	public void setTtAllAllYear(int ttAllAllYear) {
		this.ttAllAllYear = ttAllAllYear;
	}

	public int getTtBMonth() {
		return ttBMonth;
	}

	public void setTtBMonth(int ttBMonth) {
		this.ttBMonth = ttBMonth;
	}

	public int getTtBAllYear() {
		return ttBAllYear;
	}

	public void setTtBAllYear(int ttBAllYear) {
		this.ttBAllYear = ttBAllYear;
	}

	public int getTtBAllMonth() {
		return ttBAllMonth;
	}

	public void setTtBAllMonth(int ttBAllMonth) {
		this.ttBAllMonth = ttBAllMonth;
	}

	public int getTtBAllAllYear() {
		return ttBAllAllYear;
	}

	public void setTtBAllAllYear(int ttBAllAllYear) {
		this.ttBAllAllYear = ttBAllAllYear;
	}

	public int getTtAYear() {
		return ttAYear;
	}

	public void setTtAYear(int ttAYear) {
		this.ttAYear = ttAYear;
	}

	public List<RetirementDTO2> getRetirementDTO2() {
		return retirementDTO2;
	}

	public void setRetirementDTO2(List<RetirementDTO2> retirementDTO2) {
		this.retirementDTO2 = retirementDTO2;
	}

	@Override
	public String toString() {
		return "RetirementDTO [employeeCode=" + employeeCode + ", enrollDate=" + enrollDate + ", employeeName="
				+ employeeName + ", leaveDate=" + leaveDate + ", year=" + year + ", month=" + month + ", day=" + day
				+ ", allYear=" + allYear + ", allMonth=" + allMonth + ", allDay=" + allDay + ", threeBeforeMonth="
				+ threeBeforeMonth + ", lastThree=" + lastThree + ", extDay=" + extDay + ", sumSalary=" + sumSalary
				+ ", sumMeals=" + sumMeals + ", sumDrivingSubsidies=" + sumDrivingSubsidies + ", sumChildcareAllowance="
				+ sumChildcareAllowance + ", sumNightpay=" + sumNightpay + ", sumMonthlypay=" + sumMonthlypay
				+ ", sumPositionpay=" + sumPositionpay + ", sumAllSalary=" + sumAllSalary + ", avgBonus=" + avgBonus
				+ ", sumBonus=" + sumBonus + ", ttAll=" + ttAll + ", ttAllYear=" + ttAllYear + ", ttAllMonth="
				+ ttAllMonth + ", ttAllAllYear=" + ttAllAllYear + ", ttBMonth=" + ttBMonth + ", ttBAllYear="
				+ ttBAllYear + ", ttBAllMonth=" + ttBAllMonth + ", ttBAllAllYear=" + ttBAllAllYear + ", ttAYear="
				+ ttAYear + ", retirementDTO2=" + retirementDTO2 + "]";
	}

	
}
