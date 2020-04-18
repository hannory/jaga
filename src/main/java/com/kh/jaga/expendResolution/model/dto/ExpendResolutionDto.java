package com.kh.jaga.expendResolution.model.dto;

public class ExpendResolutionDto implements java.io.Serializable{
	private String resolutionNo;
	private String comResolutionCode;
	private String initiativeDate;
	private String departmentCode;
	private String managerNo;
	private String managerPosition;
	private String expendPurpose;
	private String expendDate;
	private String accountTitleCode;
	private String expendSummary;
	private String createUser;
	private String createDate;
	private String approvalStatus;
	private String paymentTypeCode;
	private String evidenceCode;
	private String comCode;
	
	public ExpendResolutionDto() {}

	public ExpendResolutionDto(String resolutionNo, String comResolutionCode, String initiativeDate,
			String departmentCode, String managerNo, String managerPosition, String expendPurpose, String expendDate,
			String accountTitleCode, String expendSummary, String createUser, String createDate, String approvalStatus,
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

	public String getInitiativeDate() {
		return initiativeDate;
	}

	public void setInitiativeDate(String initiativeDate) {
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

	public String getExpendDate() {
		return expendDate;
	}

	public void setExpendDate(String expendDate) {
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

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
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
