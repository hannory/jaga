package com.kh.jaga.expendResolution.model.dto;

import java.sql.Date;

public class ExpendResolutionDto implements java.io.Serializable{
	private String resolutionNo;		//결의서 코드
	private String comResolutionCode;	//회사 코드
	private Date initiativeDate;		//발의일
	private String departmentCode;		//담당부서(코드)
	private String managerNo;			//담당자(번호)
	private String managerPosition;		//담당자 직급
	private String expendPurpose;		//지출목적
	private Date expendDate;			//지출일
	private String accountTitleCode;	//계정과목(코드)
	private String expendSummary;		//지출합계
	private String createUser;			//작성자
	private Date createDate;			//작성일
	private String approvalStatus;		//승인여부
	private String paymentTypeCode;		//결재코드
	private String evidenceCode;		//관련증빙코드
	private String comCode;				//회사코드
	
	public ExpendResolutionDto() {}

	public ExpendResolutionDto(String resolutionNo, String comResolutionCode, Date initiativeDate,
			String departmentCode, String managerNo, String managerPosition, String expendPurpose, Date expendDate,
			String accountTitleCode, String expendSummary, String createUser, Date createDate, String approvalStatus,
			String paymentTypeCode, String evidenceCode, String comCode) {
		super();
		this.resolutionNo = resolutionNo;
		this.comResolutionCode = comResolutionCode;
		this.initiativeDate = initiativeDate;
		this.departmentCode = departmentCode;
		this.managerNo = managerNo;
		this.managerPosition = managerPosition;
		this.expendPurpose = expendPurpose;
		this.expendDate = expendDate;
		this.accountTitleCode = accountTitleCode;
		this.expendSummary = expendSummary;
		this.createUser = createUser;
		this.createDate = createDate;
		this.approvalStatus = approvalStatus;
		this.paymentTypeCode = paymentTypeCode;
		this.evidenceCode = evidenceCode;
		this.comCode = comCode;
	}

	public String getResolutionNo() {
		return resolutionNo;
	}

	public void setResolutionNo(String resolutionNo) {
		this.resolutionNo = resolutionNo;
	}

	public String getComResolutionCode() {
		return comResolutionCode;
	}

	public void setComResolutionCode(String comResolutionCode) {
		this.comResolutionCode = comResolutionCode;
	}

	public Date getInitiativeDate() {
		return initiativeDate;
	}

	public void setInitiativeDate(Date initiativeDate) {
		this.initiativeDate = initiativeDate;
	}

	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(String managerNo) {
		this.managerNo = managerNo;
	}

	public String getManagerPosition() {
		return managerPosition;
	}

	public void setManagerPosition(String managerPosition) {
		this.managerPosition = managerPosition;
	}

	public String getExpendPurpose() {
		return expendPurpose;
	}

	public void setExpendPurpose(String expendPurpose) {
		this.expendPurpose = expendPurpose;
	}

	public Date getExpendDate() {
		return expendDate;
	}

	public void setExpendDate(Date expendDate) {
		this.expendDate = expendDate;
	}

	public String getAccountTitleCode() {
		return accountTitleCode;
	}

	public void setAccountTitleCode(String accountTitleCode) {
		this.accountTitleCode = accountTitleCode;
	}

	public String getExpendSummary() {
		return expendSummary;
	}

	public void setExpendSummary(String expendSummary) {
		this.expendSummary = expendSummary;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public String getPaymentTypeCode() {
		return paymentTypeCode;
	}

	public void setPaymentTypeCode(String paymentTypeCode) {
		this.paymentTypeCode = paymentTypeCode;
	}

	public String getEvidenceCode() {
		return evidenceCode;
	}

	public void setEvidenceCode(String evidenceCode) {
		this.evidenceCode = evidenceCode;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	@Override
	public String toString() {
		return "ExpendResolutionDto [resolutionNo=" + resolutionNo + ", comResolutionCode=" + comResolutionCode
				+ ", initiativeDate=" + initiativeDate + ", departmentCode=" + departmentCode + ", managerNo="
				+ managerNo + ", managerPosition=" + managerPosition + ", expendPurpose=" + expendPurpose
				+ ", expendDate=" + expendDate + ", accountTitleCode=" + accountTitleCode + ", expendSummary="
				+ expendSummary + ", createUser=" + createUser + ", createDate=" + createDate + ", approvalStatus="
				+ approvalStatus + ", paymentTypeCode=" + paymentTypeCode + ", evidenceCode=" + evidenceCode
				+ ", comCode=" + comCode + "]";
	}
	
	
	
	
}
