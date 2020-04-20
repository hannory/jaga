package com.kh.jaga.bugagachi.model.vo;

import java.math.BigDecimal;

public class CcSalesSlipGap {//신용카드 등 수령명세서

	private String rcptstmtCode; //수령명세서 코드
	private int yearOfAttr;		 //귀속연도
	private String termDiv;		 //기수구분
	private String deadline;		//마감여부
	private String comCode;			//회사코드
	 
	public CcSalesSlipGap() {}

	public CcSalesSlipGap(String rcptstmtCode, int yearOfAttr, String termDiv, String deadline, String comCode) {
		super();
		this.rcptstmtCode = rcptstmtCode;
		this.yearOfAttr = yearOfAttr;
		this.termDiv = termDiv;
		this.deadline = deadline;
		this.comCode = comCode;
	}

	public String getRcptstmtCode() {
		return rcptstmtCode;
	}

	public void setRcptstmtCode(String rcptstmtCode) {
		this.rcptstmtCode = rcptstmtCode;
	}

	public int getYearOfAttr() {
		return yearOfAttr;
	}

	public void setYearOfAttr(int yearOfAttr) {
		this.yearOfAttr = yearOfAttr;
	}

	public String getTermDiv() {
		return termDiv;
	}

	public void setTermDiv(String termDiv) {
		this.termDiv = termDiv;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	@Override
	public String toString() {
		return "CcSalesSlipGap [rcptstmtCode=" + rcptstmtCode + ", yearOfAttr=" + yearOfAttr + ", termDiv=" + termDiv
				+ ", deadline=" + deadline + ", comCode=" + comCode + "]";
	}

	
	
	
	
	
	
}
