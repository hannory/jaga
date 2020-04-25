package com.kh.jaga.payment.model.vo;

import java.math.BigDecimal;

public class BusinessPayment {
	private String employeeCode;	//직원구분번호
	private int attributeDate;		//귀속년월
	private String payDate;			//지급일자
	private BigDecimal salary;		//급여
	private BigDecimal incomeTax;	//소득세
	private BigDecimal localIncomeTax;	//지방소득세
	private BigDecimal differencePymt;	//차인지급액
	private int payStubCount;
	private String attYear;
	private String attMonth;
	private String payYear;
	private String payMonth;
	private String payDay;
	
	
	public BusinessPayment(){}


	public BusinessPayment(String employeeCode, int attributeDate, String payDate, BigDecimal salary,
			BigDecimal incomeTax, BigDecimal localIncomeTax, BigDecimal differencePymt, int payStubCount, String attYear,
			String attMonth, String payYear, String payMonth, String payDay) {
		super();
		this.employeeCode = employeeCode;
		this.attributeDate = attributeDate;
		this.payDate = payDate;
		this.salary = salary;
		this.incomeTax = incomeTax;
		this.localIncomeTax = localIncomeTax;
		this.differencePymt = differencePymt;
		this.payStubCount = payStubCount;
		this.attYear = attYear;
		this.attMonth = attMonth;
		this.payYear = payYear;
		this.payMonth = payMonth;
		this.payDay = payDay;
	}


	public String getEmployeeCode() {
		return employeeCode;
	}


	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}


	public int getAttributeDate() {
		return attributeDate;
	}


	public void setAttributeDate(int attributeDate) {
		this.attributeDate = attributeDate;
	}


	public String getPayDate() {
		return payDate;
	}


	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}


	public BigDecimal getSalary() {
		return salary;
	}


	public void setSalary(BigDecimal salary) {
		this.salary = salary;
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


	public BigDecimal getDifferencePymt() {
		return differencePymt;
	}


	public void setDifferencePymt(BigDecimal differencePymt) {
		this.differencePymt = differencePymt;
	}


	public int getPayStubCount() {
		return payStubCount;
	}


	public void setPayStubCount(int payStubCount) {
		this.payStubCount = payStubCount;
	}


	public String getAttYear() {
		return attYear;
	}


	public void setAttYear(String attYear) {
		this.attYear = attYear;
	}


	public String getAttMonth() {
		return attMonth;
	}


	public void setAttMonth(String attMonth) {
		this.attMonth = attMonth;
	}


	public String getPayYear() {
		return payYear;
	}


	public void setPayYear(String payYear) {
		this.payYear = payYear;
	}


	public String getPayMonth() {
		return payMonth;
	}


	public void setPayMonth(String payMonth) {
		this.payMonth = payMonth;
	}


	public String getPayDay() {
		return payDay;
	}


	public void setPayDay(String payDay) {
		this.payDay = payDay;
	}


	@Override
	public String toString() {
		return "BusinessPayment [employeeCode=" + employeeCode + ", attributeDate=" + attributeDate + ", payDate="
				+ payDate + ", salary=" + salary + ", incomeTax=" + incomeTax + ", localIncomeTax=" + localIncomeTax
				+ ", differencePymt=" + differencePymt + ", payStubCount=" + payStubCount + ", attYear=" + attYear
				+ ", attMonth=" + attMonth + ", payYear=" + payYear + ", payMonth=" + payMonth + ", payDay=" + payDay
				+ "]";
	}

	
	
}
