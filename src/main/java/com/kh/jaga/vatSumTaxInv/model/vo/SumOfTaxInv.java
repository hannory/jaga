package com.kh.jaga.vatSumTaxInv.model.vo;

import java.io.Serializable;

public class SumOfTaxInv implements Serializable{
	private String taxinvCode;		//계산서합계표코드
	private String tabletaxDiv;		//계산서 구분
	private int yearOfAttr;			//귀속연도
	private String reportTerm;		//기수
	private String reportType;		//신고종류
	private String deadline;		//마감여부
	private String comCode;			//회사코드
	
	public SumOfTaxInv() {}

	public SumOfTaxInv(String taxinvCode, String tabletaxDiv, int yearOfAttr, String reportTerm, String reportType,
			String deadline, String comCode) {
		super();
		this.taxinvCode = taxinvCode;
		this.tabletaxDiv = tabletaxDiv;
		this.yearOfAttr = yearOfAttr;
		this.reportTerm = reportTerm;
		this.reportType = reportType;
		this.deadline = deadline;
		this.comCode = comCode;
	}

	public String getTaxinvCode() {
		return taxinvCode;
	}

	public void setTaxinvCode(String taxinvCode) {
		this.taxinvCode = taxinvCode;
	}

	public String getTabletaxDiv() {
		return tabletaxDiv;
	}

	public void setTabletaxDiv(String tabletaxDiv) {
		this.tabletaxDiv = tabletaxDiv;
	}

	public int getYearOfAttr() {
		return yearOfAttr;
	}

	public void setYearOfAttr(int yearOfAttr) {
		this.yearOfAttr = yearOfAttr;
	}

	public String getReportTerm() {
		return reportTerm;
	}

	public void setReportTerm(String reportTerm) {
		this.reportTerm = reportTerm;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
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
		return "SumOfTaxInv [taxinvCode=" + taxinvCode + ", tabletaxDiv=" + tabletaxDiv + ", yearOfAttr=" + yearOfAttr
				+ ", reportTerm=" + reportTerm + ", reportType=" + reportType + ", deadline=" + deadline + ", comCode="
				+ comCode + "]";
	}

	
	
	
}
