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
	
	private String apprInfoCode;		//결재자정보번호
	private String apprEmpCode;			//결재자직원코드
	private String apprEmpPosition;		//결재자직급
	private String expendResolution;	//결의서코드
	private String employeeCode;		//직원구분번호
	private String apprStatus;			//승인여부

	
	
	
	
	public ExpendResolutionDto() {}
	
}



