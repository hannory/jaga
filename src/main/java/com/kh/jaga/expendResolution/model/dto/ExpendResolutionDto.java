package com.kh.jaga.expendResolution.model.dto;

import java.sql.Date;

public class ExpendResolutionDto implements java.io.Serializable{
//	private String resolutionNo;		//결의서 코드
//	private String comResolutionCode;	//회사 코드
//	private Date initiativeDate;		//발의일
//	private String departmentCode;		//담당부서(코드)
//	private String managerNo;			//담당자(번호)
//	private String managerPosition;		//담당자 직급
//	private String expendPurpose;		//지출목적
//	private Date expendDate;			//지출일
//	private String accountTitleCode;	//계정과목(코드)
//	private String expendSummary;		//지출합계
//	private String createUser;			//작성자
//	private Date createDate;			//작성일
//	private String approvalStatus;		//승인여부
//	private String paymentTypeCode;		//결재코드
//	private String evidenceCode;		//관련증빙코드
//	private String comCode;				//회사코드
	
	//APPROVALER_INFO 테이블		 		//[결재자정보]
	private String apprInfoCode = "시퀀스넣기";		//결재자정보번호
	private String apprEmpCode;			//결재자직원코드
	private String apprEmpPosition;		//결재자직급
	private String expendResolution;	//결의서코드
	private String employeeCode;		//직원구분번호
	private String apprStatus;			//승인여부
	
	//EXPEND_RESOLUTION 테이블 			//[지출결의서]
	private String resolutionNo = "시퀀스넣기";		//결의서 코드
	private String comResolutionCode;	//회사 코드
	private String initiativeDate;		//발의일
	private String departmentCode;		//담당부서(코드)
	private String managerNo;			//담당자(번호)
	private String managerPosition;		//담당자 직급
	private String expendPurpose;		//지출목적
	private String expendDate;			//지출일
	private String accountTitleCode;	//계정과목(코드)
	private String expendSummary;		//지출합계
	private String createUser;			//작성자
	private String createDate;			//작성일
	private String approvalStatus;		//승인여부
	private String paymentTypeCode;		//결재코드
	private String evidenceCode;		//관련증빙코드
	private String comCode;				//회사코드
	
	//EXPEND_RESOLUTION_DETAIL 테이블		//[지출결의서 상세]
	private String expendDetailNo = "시퀀스넣기";		//상세내역번호
	private String expendDetailDate;	//지출일자		//디비에서 받아올 데이터	//DB칼럼명이랑 일치하지않으므로 맵핑 주의해서 할 것
	private String brief;				//적요
	private String venderCode;			//거래처코드
	private String price;				//금액
	private String memo;				//비고
	private String expendResolutionNo;	//결의서코드

	//뷰에서 받아오기위한 멤버변수
	private String detailDate01;
	private String detailBrief01;
	private String detailVenderCode01;
	private String detailPrice01;
	private String detailMemo01;
	
	private String detailDate02;
	private String detailBrief02;
	private String detailVenderCode02;
	private String detailPrice02;
	private String detailMemo02;
	
	private String detailDate03;
	private String detailBrief03;
	private String detailVenderCode03;
	private String detailPrice03;
	private String detailMemo03;
	
	//기본생성자
	public ExpendResolutionDto() {}

	public ExpendResolutionDto(String apprInfoCode, String apprEmpCode, String apprEmpPosition, String expendResolution,
			String employeeCode, String apprStatus, String resolutionNo, String comResolutionCode,
			String initiativeDate, String departmentCode, String managerNo, String managerPosition,
			String expendPurpose, String expendDate, String accountTitleCode, String expendSummary, String createUser,
			String createDate, String approvalStatus, String paymentTypeCode, String evidenceCode, String comCode,
			String expendDetailNo, String expendDetailDate, String brief, String venderCode, String price, String memo,
			String expendResolutionNo, String detailDate01, String detailBrief01, String detailVenderCode01,
			String detailPrice01, String detailMemo01, String detailDate02, String detailBrief02,
			String detailVenderCode02, String detailPrice02, String detailMemo02, String detailDate03,
			String detailBrief03, String detailVenderCode03, String detailPrice03, String detailMemo03) {
		super();
		this.apprInfoCode = apprInfoCode;
		this.apprEmpCode = apprEmpCode;
		this.apprEmpPosition = apprEmpPosition;
		this.expendResolution = expendResolution;
		this.employeeCode = employeeCode;
		this.apprStatus = apprStatus;
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
		this.expendDetailNo = expendDetailNo;
		this.expendDetailDate = expendDetailDate;
		this.brief = brief;
		this.venderCode = venderCode;
		this.price = price;
		this.memo = memo;
		this.expendResolutionNo = expendResolutionNo;
		this.detailDate01 = detailDate01;
		this.detailBrief01 = detailBrief01;
		this.detailVenderCode01 = detailVenderCode01;
		this.detailPrice01 = detailPrice01;
		this.detailMemo01 = detailMemo01;
		this.detailDate02 = detailDate02;
		this.detailBrief02 = detailBrief02;
		this.detailVenderCode02 = detailVenderCode02;
		this.detailPrice02 = detailPrice02;
		this.detailMemo02 = detailMemo02;
		this.detailDate03 = detailDate03;
		this.detailBrief03 = detailBrief03;
		this.detailVenderCode03 = detailVenderCode03;
		this.detailPrice03 = detailPrice03;
		this.detailMemo03 = detailMemo03;
	}

	public String getApprInfoCode() {
		return apprInfoCode;
	}

	public void setApprInfoCode(String apprInfoCode) {
		this.apprInfoCode = apprInfoCode;
	}

	public String getApprEmpCode() {
		return apprEmpCode;
	}

	public void setApprEmpCode(String apprEmpCode) {
		this.apprEmpCode = apprEmpCode;
	}

	public String getApprEmpPosition() {
		return apprEmpPosition;
	}

	public void setApprEmpPosition(String apprEmpPosition) {
		this.apprEmpPosition = apprEmpPosition;
	}

	public String getExpendResolution() {
		return expendResolution;
	}

	public void setExpendResolution(String expendResolution) {
		this.expendResolution = expendResolution;
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}

	public String getApprStatus() {
		return apprStatus;
	}

	public void setApprStatus(String apprStatus) {
		this.apprStatus = apprStatus;
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

	public String getExpendDetailNo() {
		return expendDetailNo;
	}

	public void setExpendDetailNo(String expendDetailNo) {
		this.expendDetailNo = expendDetailNo;
	}

	public String getExpendDetailDate() {
		return expendDetailDate;
	}

	public void setExpendDetailDate(String expendDetailDate) {
		this.expendDetailDate = expendDetailDate;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getVenderCode() {
		return venderCode;
	}

	public void setVenderCode(String venderCode) {
		this.venderCode = venderCode;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getExpendResolutionNo() {
		return expendResolutionNo;
	}

	public void setExpendResolutionNo(String expendResolutionNo) {
		this.expendResolutionNo = expendResolutionNo;
	}

	public String getDetailDate01() {
		return detailDate01;
	}

	public void setDetailDate01(String detailDate01) {
		this.detailDate01 = detailDate01;
	}

	public String getDetailBrief01() {
		return detailBrief01;
	}

	public void setDetailBrief01(String detailBrief01) {
		this.detailBrief01 = detailBrief01;
	}

	public String getDetailVenderCode01() {
		return detailVenderCode01;
	}

	public void setDetailVenderCode01(String detailVenderCode01) {
		this.detailVenderCode01 = detailVenderCode01;
	}

	public String getDetailPrice01() {
		return detailPrice01;
	}

	public void setDetailPrice01(String detailPrice01) {
		this.detailPrice01 = detailPrice01;
	}

	public String getDetailMemo01() {
		return detailMemo01;
	}

	public void setDetailMemo01(String detailMemo01) {
		this.detailMemo01 = detailMemo01;
	}

	public String getDetailDate02() {
		return detailDate02;
	}

	public void setDetailDate02(String detailDate02) {
		this.detailDate02 = detailDate02;
	}

	public String getDetailBrief02() {
		return detailBrief02;
	}

	public void setDetailBrief02(String detailBrief02) {
		this.detailBrief02 = detailBrief02;
	}

	public String getDetailVenderCode02() {
		return detailVenderCode02;
	}

	public void setDetailVenderCode02(String detailVenderCode02) {
		this.detailVenderCode02 = detailVenderCode02;
	}

	public String getDetailPrice02() {
		return detailPrice02;
	}

	public void setDetailPrice02(String detailPrice02) {
		this.detailPrice02 = detailPrice02;
	}

	public String getDetailMemo02() {
		return detailMemo02;
	}

	public void setDetailMemo02(String detailMemo02) {
		this.detailMemo02 = detailMemo02;
	}

	public String getDetailDate03() {
		return detailDate03;
	}

	public void setDetailDate03(String detailDate03) {
		this.detailDate03 = detailDate03;
	}

	public String getDetailBrief03() {
		return detailBrief03;
	}

	public void setDetailBrief03(String detailBrief03) {
		this.detailBrief03 = detailBrief03;
	}

	public String getDetailVenderCode03() {
		return detailVenderCode03;
	}

	public void setDetailVenderCode03(String detailVenderCode03) {
		this.detailVenderCode03 = detailVenderCode03;
	}

	public String getDetailPrice03() {
		return detailPrice03;
	}

	public void setDetailPrice03(String detailPrice03) {
		this.detailPrice03 = detailPrice03;
	}

	public String getDetailMemo03() {
		return detailMemo03;
	}

	public void setDetailMemo03(String detailMemo03) {
		this.detailMemo03 = detailMemo03;
	}

	@Override
	public String toString() {
		return "ExpendResolutionDto:::\n [apprInfoCode=" + apprInfoCode + ", \napprEmpCode=" + apprEmpCode
				+ ", \napprEmpPosition=" + apprEmpPosition + ", \nexpendResolution=" + expendResolution + ", \nemployeeCode="
				+ employeeCode + ", \napprStatus=" + apprStatus + ", \nresolutionNo=" + resolutionNo
				+ ", \ncomResolutionCode=" + comResolutionCode + ", \ninitiativeDate=" + initiativeDate
				+ ", \ndepartmentCode=" + departmentCode + ", \nmanagerNo=" + managerNo + ", \nmanagerPosition="
				+ managerPosition + ", \nexpendPurpose=" + expendPurpose + ", \nexpendDate=" + expendDate
				+ ", \naccountTitleCode=" + accountTitleCode + ", \nexpendSummary=" + expendSummary + ", \ncreateUser="
				+ createUser + ", \ncreateDate=" + createDate + ", \napprovalStatus=" + approvalStatus
				+ ", \npaymentTypeCode=" + paymentTypeCode + ", \nevidenceCode=" + evidenceCode + ", \ncomCode=" + comCode
				+ ", \nexpendDetailNo=" + expendDetailNo + ", \nexpendDetailDate=" + expendDetailDate + ", \nbrief=" + brief
				+ ", \nvenderCode=" + venderCode + ", \nprice=" + price + ", \nmemo=" + memo + ", \nexpendResolutionNo="
				+ expendResolutionNo + ", \ndetailDate01=" + detailDate01 + ", \ndetailBrief01=" + detailBrief01
				+ ", \ndetailVenderCode01=" + detailVenderCode01 + ", \ndetailPrice01=" + detailPrice01 + ", \ndetailMemo01="
				+ detailMemo01 + ", \ndetailDate02=" + detailDate02 + ", \ndetailBrief02=" + detailBrief02
				+ ", \ndetailVenderCode02=" + detailVenderCode02 + ", \ndetailPrice02=" + detailPrice02 + ", \ndetailMemo02="
				+ detailMemo02 + ", \ndetailDate03=" + detailDate03 + ", \ndetailBrief03=" + detailBrief03
				+ ", \ndetailVenderCode03=" + detailVenderCode03 + ", \ndetailPrice03=" + detailPrice03 + ", \ndetailMemo03="
				+ detailMemo03 + "]";
	}
	
	

	
	
	
}



