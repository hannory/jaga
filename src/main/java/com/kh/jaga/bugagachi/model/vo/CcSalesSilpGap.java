package com.kh.jaga.bugagachi.model.vo;

public class CcSalesSilpGap {//신용카드 등 수령명세서

	private String rcptstmtCode; //수령명세서 코드
	private int yearOfAttr;		 //귀속연도
	private String termDiv;		 //기수구분
	private String eventDiv;	 //종목구분
	private int dealCount;		 //거래건수
	private int valOfSupply;	 //공급가액
	private int tax;			 //세액
	
	public CcSalesSilpGap() {}
	
	public CcSalesSilpGap(String rcptstmtCode, int yearOfAttr, String termDiv, String eventDiv, int dealCount,
			int valOfSupply, int tax) {
		super();
		this.rcptstmtCode = rcptstmtCode;
		this.yearOfAttr = yearOfAttr;
		this.termDiv = termDiv;
		this.eventDiv = eventDiv;
		this.dealCount = dealCount;
		this.valOfSupply = valOfSupply;
		this.tax = tax;
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
	public int getValOfSupply() {
		return valOfSupply;
	}
	public void setValOfSupply(int valOfSupply) {
		this.valOfSupply = valOfSupply;
	}
	public int getTax() {
		return tax;
	}
	public void setTax(int tax) {
		this.tax = tax;
	}
	@Override
	public String toString() {
		return "CcSalesSilpGap [rcptstmtCode=" + rcptstmtCode + ", yearOfAttr=" + yearOfAttr + ", termDiv=" + termDiv
				+ ", eventDiv=" + eventDiv + ", dealCount=" + dealCount + ", valOfSupply=" + valOfSupply + ", tax="
				+ tax + "]";
	}
	
	
}
