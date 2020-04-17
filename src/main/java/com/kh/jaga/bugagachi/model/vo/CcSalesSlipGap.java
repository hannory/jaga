package com.kh.jaga.bugagachi.model.vo;

import java.math.BigDecimal;

public class CcSalesSlipGap {//신용카드 등 수령명세서

	private String rcptstmtCode; //수령명세서 코드
	private int yearOfAttr;		 //귀속연도
	private String termDiv;		 //기수구분
	private String eventDiv;	 //종목구분
	private int dealCount;		 //거래건수
	private BigDecimal valOfSupply;	 //공급가액
	private BigDecimal tax;			 //세액
	private String deadline;		//마감여부
	private String comCode;			//회사코드
	 
	public CcSalesSlipGap() {}

	public CcSalesSlipGap(String rcptstmtCode, int yearOfAttr, String termDiv, String eventDiv, int dealCount,
			BigDecimal valOfSupply, BigDecimal tax, String deadline, String comCode) {
		super();
		this.rcptstmtCode = rcptstmtCode;
		this.yearOfAttr = yearOfAttr;
		this.termDiv = termDiv;
		this.eventDiv = eventDiv;
		this.dealCount = dealCount;
		this.valOfSupply = valOfSupply;
		this.tax = tax;
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

	public String getEventDiv() {
		return eventDiv;
	}

	public void setEventDiv(String eventDiv) {
		this.eventDiv = eventDiv;
	}

	public int getDealCount() {
		return dealCount;
	}

	public void setDealCount(int dealCount) {
		this.dealCount = dealCount;
	}

	public BigDecimal getValOfSupply() {
		return valOfSupply;
	}

	public void setValOfSupply(BigDecimal valOfSupply) {
		this.valOfSupply = valOfSupply;
	}

	public BigDecimal getTax() {
		return tax;
	}

	public void setTax(BigDecimal tax) {
		this.tax = tax;
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
				+ ", eventDiv=" + eventDiv + ", dealCount=" + dealCount + ", valOfSupply=" + valOfSupply + ", tax="
				+ tax + ", deadline=" + deadline + ", comCode=" + comCode + "]";
	}

	
	
	
	
	
}
