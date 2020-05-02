package com.kh.jaga.employee.model.vo;

import java.sql.Date;

public class EarnIncome implements java.io.Serializable {
	private String employeeCode;
	private String employeeName;
	private int attributeDate;
	private Date payDate;
	private int salary;
	private int bonus;
	private int meals;
	private int drivingSubsidies;
	private int childcareAllowance;
	private int taxableIncome;
	private int nontaxableIncome;
	private int nationalPension;
	private int healthInsurance;
	private int longTermInsurance;
	private int employmentInsurance;
	private int incomeTax;
	private int localIncomeTax;
	private int differencePymt;
	private int payStubCount;
	private int nightPay;
	private int monthlyPay;
	private int positionPay;
	private int totalPayment;
	private int totalDeduction;
	private int min;
	private int max;
	private int result;
	
	public EarnIncome() {}

	public EarnIncome(String employeeCode, String employeeName, int attributeDate, Date payDate, int salary, int bonus,
			int meals, int drivingSubsidies, int childcareAllowance, int taxableIncome, int nontaxableIncome,
			int nationalPension, int healthInsurance, int longTermInsurance, int employmentInsurance, int incomeTax,
			int localIncomeTax, int differencePymt, int payStubCount, int nightPay, int monthlyPay, int positionPay,
			int totalPayment, int totalDeduction, int min, int max, int result) {
		super();
		this.employeeCode = employeeCode;
		this.employeeName = employeeName;
		this.attributeDate = attributeDate;
		this.payDate = payDate;
		this.salary = salary;
		this.bonus = bonus;
		this.meals = meals;
		this.drivingSubsidies = drivingSubsidies;
		this.childcareAllowance = childcareAllowance;
		this.taxableIncome = taxableIncome;
		this.nontaxableIncome = nontaxableIncome;
		this.nationalPension = nationalPension;
		this.healthInsurance = healthInsurance;
		this.longTermInsurance = longTermInsurance;
		this.employmentInsurance = employmentInsurance;
		this.incomeTax = incomeTax;
		this.localIncomeTax = localIncomeTax;
		this.differencePymt = differencePymt;
		this.payStubCount = payStubCount;
		this.nightPay = nightPay;
		this.monthlyPay = monthlyPay;
		this.positionPay = positionPay;
		this.totalPayment = totalPayment;
		this.totalDeduction = totalDeduction;
		this.min = min;
		this.max = max;
		this.result = result;
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public int getAttributeDate() {
		return attributeDate;
	}

	public void setAttributeDate(int attributeDate) {
		this.attributeDate = attributeDate;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public int getBonus() {
		return bonus;
	}

	public void setBonus(int bonus) {
		this.bonus = bonus;
	}

	public int getMeals() {
		return meals;
	}

	public void setMeals(int meals) {
		this.meals = meals;
	}

	public int getDrivingSubsidies() {
		return drivingSubsidies;
	}

	public void setDrivingSubsidies(int drivingSubsidies) {
		this.drivingSubsidies = drivingSubsidies;
	}

	public int getChildcareAllowance() {
		return childcareAllowance;
	}

	public void setChildcareAllowance(int childcareAllowance) {
		this.childcareAllowance = childcareAllowance;
	}

	public int getTaxableIncome() {
		return taxableIncome;
	}

	public void setTaxableIncome(int taxableIncome) {
		this.taxableIncome = taxableIncome;
	}

	public int getNontaxableIncome() {
		return nontaxableIncome;
	}

	public void setNontaxableIncome(int nontaxableIncome) {
		this.nontaxableIncome = nontaxableIncome;
	}

	public int getNationalPension() {
		return nationalPension;
	}

	public void setNationalPension(int nationalPension) {
		this.nationalPension = nationalPension;
	}

	public int getHealthInsurance() {
		return healthInsurance;
	}

	public void setHealthInsurance(int healthInsurance) {
		this.healthInsurance = healthInsurance;
	}

	public int getLongTermInsurance() {
		return longTermInsurance;
	}

	public void setLongTermInsurance(int longTermInsurance) {
		this.longTermInsurance = longTermInsurance;
	}

	public int getEmploymentInsurance() {
		return employmentInsurance;
	}

	public void setEmploymentInsurance(int employmentInsurance) {
		this.employmentInsurance = employmentInsurance;
	}

	public int getIncomeTax() {
		return incomeTax;
	}

	public void setIncomeTax(int incomeTax) {
		this.incomeTax = incomeTax;
	}

	public int getLocalIncomeTax() {
		return localIncomeTax;
	}

	public void setLocalIncomeTax(int localIncomeTax) {
		this.localIncomeTax = localIncomeTax;
	}

	public int getDifferencePymt() {
		return differencePymt;
	}

	public void setDifferencePymt(int differencePymt) {
		this.differencePymt = differencePymt;
	}

	public int getPayStubCount() {
		return payStubCount;
	}

	public void setPayStubCount(int payStubCount) {
		this.payStubCount = payStubCount;
	}

	public int getNightPay() {
		return nightPay;
	}

	public void setNightPay(int nightPay) {
		this.nightPay = nightPay;
	}

	public int getMonthlyPay() {
		return monthlyPay;
	}

	public void setMonthlyPay(int monthlyPay) {
		this.monthlyPay = monthlyPay;
	}

	public int getPositionPay() {
		return positionPay;
	}

	public void setPositionPay(int positionPay) {
		this.positionPay = positionPay;
	}

	public int getTotalPayment() {
		return totalPayment;
	}

	public void setTotalPayment(int totalPayment) {
		this.totalPayment = totalPayment;
	}

	public int getTotalDeduction() {
		return totalDeduction;
	}

	public void setTotalDeduction(int totalDeduction) {
		this.totalDeduction = totalDeduction;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "EarnIncome [employeeCode=" + employeeCode + ", employeeName=" + employeeName + ", attributeDate="
				+ attributeDate + ", payDate=" + payDate + ", salary=" + salary + ", bonus=" + bonus + ", meals="
				+ meals + ", drivingSubsidies=" + drivingSubsidies + ", childcareAllowance=" + childcareAllowance
				+ ", taxableIncome=" + taxableIncome + ", nontaxableIncome=" + nontaxableIncome + ", nationalPension="
				+ nationalPension + ", healthInsurance=" + healthInsurance + ", longTermInsurance=" + longTermInsurance
				+ ", employmentInsurance=" + employmentInsurance + ", incomeTax=" + incomeTax + ", localIncomeTax="
				+ localIncomeTax + ", differencePymt=" + differencePymt + ", payStubCount=" + payStubCount
				+ ", nightPay=" + nightPay + ", monthlyPay=" + monthlyPay + ", positionPay=" + positionPay
				+ ", totalPayment=" + totalPayment + ", totalDeduction=" + totalDeduction + ", min=" + min + ", max="
				+ max + ", result=" + result + "]";
	}

	
	
	
	
	
	
}
