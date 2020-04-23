package com.kh.jaga.employee.model.vo;

import java.util.List;

public class BusinessEmp2 {
	
	private String employeeCode; 	//직원구분번호
	private String comCode;			//회사 코드
	private String employeeNum;		//직원번호
	private String employeeName;	//이름
	private String securityNumber;	//주민등록번호
	private int salary;			//급여
	private String email;			//이메일
	private String backCode;		//급여 은행코드
	private String accountNumber;	//계좌번호
	private String accountHolder;	//예금주
	private String department;		//부서
	private String positionCode;	//직급 코드
	private String enrollDate;		//입사일
	private String leaveDate;			//퇴사일
	private String leaveReason;		//	퇴사사유
	private String idDocument;		//신분증명서류
	private String accountDocument;	//통장사본
	private String incomeClass;		//소득구분
	private String positionName;		//소득구분
	private String deptName;		//소득구분
	private String typeOfBixCode;		//소득구분
	private String sellTargetName;		//소득구분
	private List<Attachment> attList;
	
	public BusinessEmp2() {}

	public BusinessEmp2(String employeeCode, String comCode, String employeeNum, String employeeName,
			String securityNumber, int salary, String email, String backCode, String accountNumber,
			String accountHolder, String department, String positionCode, String enrollDate, String leaveDate,
			String leaveReason, String idDocument, String accountDocument, String incomeClass, String positionName,
			String deptName, String typeOfBixCode, String sellTargetName, List<Attachment> attList) {
		super();
		this.employeeCode = employeeCode;
		this.comCode = comCode;
		this.employeeNum = employeeNum;
		this.employeeName = employeeName;
		this.securityNumber = securityNumber;
		this.salary = salary;
		this.email = email;
		this.backCode = backCode;
		this.accountNumber = accountNumber;
		this.accountHolder = accountHolder;
		this.department = department;
		this.positionCode = positionCode;
		this.enrollDate = enrollDate;
		this.leaveDate = leaveDate;
		this.leaveReason = leaveReason;
		this.idDocument = idDocument;
		this.accountDocument = accountDocument;
		this.incomeClass = incomeClass;
		this.positionName = positionName;
		this.deptName = deptName;
		this.typeOfBixCode = typeOfBixCode;
		this.sellTargetName = sellTargetName;
		this.attList = attList;
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

	public String getSecurityNumber() {
		return securityNumber;
	}

	public void setSecurityNumber(String securityNumber) {
		this.securityNumber = securityNumber;
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

	public String getBackCode() {
		return backCode;
	}

	public void setBackCode(String backCode) {
		this.backCode = backCode;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
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

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}

	public String getIdDocument() {
		return idDocument;
	}

	public void setIdDocument(String idDocument) {
		this.idDocument = idDocument;
	}

	public String getAccountDocument() {
		return accountDocument;
	}

	public void setAccountDocument(String accountDocument) {
		this.accountDocument = accountDocument;
	}

	public String getIncomeClass() {
		return incomeClass;
	}

	public void setIncomeClass(String incomeClass) {
		this.incomeClass = incomeClass;
	}

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getTypeOfBixCode() {
		return typeOfBixCode;
	}

	public void setTypeOfBixCode(String typeOfBixCode) {
		this.typeOfBixCode = typeOfBixCode;
	}

	public String getSellTargetName() {
		return sellTargetName;
	}

	public void setSellTargetName(String sellTargetName) {
		this.sellTargetName = sellTargetName;
	}

	public List<Attachment> getAttList() {
		return attList;
	}

	public void setAttList(List<Attachment> attList) {
		this.attList = attList;
	}

	@Override
	public String toString() {
		return "BusinessEmp2 [employeeCode=" + employeeCode + ", comCode=" + comCode + ", employeeNum=" + employeeNum
				+ ", employeeName=" + employeeName + ", securityNumber=" + securityNumber + ", salary=" + salary
				+ ", email=" + email + ", backCode=" + backCode + ", accountNumber=" + accountNumber
				+ ", accountHolder=" + accountHolder + ", department=" + department + ", positionCode=" + positionCode
				+ ", enrollDate=" + enrollDate + ", leaveDate=" + leaveDate + ", leaveReason=" + leaveReason
				+ ", idDocument=" + idDocument + ", accountDocument=" + accountDocument + ", incomeClass=" + incomeClass
				+ ", positionName=" + positionName + ", deptName=" + deptName + ", typeOfBixCode=" + typeOfBixCode
				+ ", sellTargetName=" + sellTargetName + ", attList=" + attList + "]";
	}

	
	
}
