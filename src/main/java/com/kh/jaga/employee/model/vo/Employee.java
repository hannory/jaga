package com.kh.jaga.employee.model.vo;

import java.sql.Date;

public class Employee implements java.io.Serializable{

	private String employeeCode;
	public String comCode;
	private String employeeNum;
	private String employeeName;
	private String securityNum;
	private int salary;
	private String email;
	private String bankCode;
	private String accountNum;
	private String accountHolder;
	private String department;
	private String positionCode;
	private Date enrollDate;
	private Date leaveDate;
	private String leaveReason;
	private int meals;
	private int drivingSubsidies;
	private int childcareAllowance;
	private String acquisitionStatus;
	private String deprivationStatus;
	private String big4PositionCode;
	private String goyongSanjae;

	
	public Employee () {}

	public Employee(String employeeCode, String comCode, String employeeNum, String employeeName, String securityNum,
			int salary, String email, String bankCode, String accountNum, String accountHolder, String department,
			String positionCode, Date enrollDate, Date leaveDate, String leaveReason, int meals, int drivingSubsidies,
			int childcareAllowance, String acquisitionStatus, String deprivationStatus, String big4PositionCode,
			String goyongSanjae) {
		super();
		this.employeeCode = employeeCode;
		this.comCode = comCode;
		this.employeeNum = employeeNum;
		this.employeeName = employeeName;
		this.securityNum = securityNum;
		this.salary = salary;
		this.email = email;
		this.bankCode = bankCode;
		this.accountNum = accountNum;
		this.accountHolder = accountHolder;
		this.department = department;
		this.positionCode = positionCode;
		this.enrollDate = enrollDate;
		this.leaveDate = leaveDate;
		this.leaveReason = leaveReason;
		this.meals = meals;
		this.drivingSubsidies = drivingSubsidies;
		this.childcareAllowance = childcareAllowance;
		this.acquisitionStatus = acquisitionStatus;
		this.deprivationStatus = deprivationStatus;
		this.big4PositionCode = big4PositionCode;
		this.goyongSanjae = goyongSanjae;
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	public String getEmployeeNum() {
		return employeeNum;
	}

	public void setEmployeeNum(String employeeNum) {
		this.employeeNum = employeeNum;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getSecurityNum() {
		return securityNum;
	}

	public void setSecurityNum(String securityNum) {
		this.securityNum = securityNum;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	public String getAccountHolder() {
		return accountHolder;
	}

	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
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

	public String getAcquisitionStatus() {
		return acquisitionStatus;
	}

	public void setAcquisitionStatus(String acquisitionStatus) {
		this.acquisitionStatus = acquisitionStatus;
	}

	public String getDeprivationStatus() {
		return deprivationStatus;
	}

	public void setDeprivationStatus(String deprivationStatus) {
		this.deprivationStatus = deprivationStatus;
	}

	public String getBig4PositionCode() {
		return big4PositionCode;
	}

	public void setBig4PositionCode(String big4PositionCode) {
		this.big4PositionCode = big4PositionCode;
	}

	public String getGoyongSanjae() {
		return goyongSanjae;
	}

	public void setGoyongSanjae(String goyongSanjae) {
		this.goyongSanjae = goyongSanjae;
	}

	@Override
	public String toString() {
		return "Employee [employeeCode=" + employeeCode + ", comCode=" + comCode + ", employeeNum=" + employeeNum
				+ ", employeeName=" + employeeName + ", securityNum=" + securityNum + ", salary=" + salary + ", email="
				+ email + ", bankCode=" + bankCode + ", accountNum=" + accountNum + ", accountHolder=" + accountHolder
				+ ", department=" + department + ", positionCode=" + positionCode + ", enrollDate=" + enrollDate
				+ ", leaveDate=" + leaveDate + ", leaveReason=" + leaveReason + ", meals=" + meals
				+ ", drivingSubsidies=" + drivingSubsidies + ", childcareAllowance=" + childcareAllowance
				+ ", acquisitionStatus=" + acquisitionStatus + ", deprivationStatus=" + deprivationStatus
				+ ", big4PositionCode=" + big4PositionCode + ", goyongSanjae=" + goyongSanjae + "]";
	}




	


	
	
	
}
