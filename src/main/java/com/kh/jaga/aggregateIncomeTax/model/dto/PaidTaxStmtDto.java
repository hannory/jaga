package com.kh.jaga.aggregateIncomeTax.model.dto;

public class PaidTaxStmtDto {
	
	private String documentNo;
	private String yearOfAttr;
	private String paidTax;
	private String paymentExpectedReturn;
	private String occasinalTax;
	private String interestIncome;
	private String dividendIncome;
	private String bizIncome;
	private String workIncome;
	private String annuityIncome;
	private String etcIncome;
	private String totalPaidIncome;
	private String comCode;
	
	public PaidTaxStmtDto() {}

	public PaidTaxStmtDto(String documentNo, String yearOfAttr, String paidTax, String paymentExpectedReturn,
			String occasinalTax, String interestIncome, String dividendIncome, String bizIncome, String workIncome,
			String annuityIncome, String etcIncome, String totalPaidIncome, String comCode) {
		super();
		this.documentNo = documentNo;
		this.yearOfAttr = yearOfAttr;
		this.paidTax = paidTax;
		this.paymentExpectedReturn = paymentExpectedReturn;
		this.occasinalTax = occasinalTax;
		this.interestIncome = interestIncome;
		this.dividendIncome = dividendIncome;
		this.bizIncome = bizIncome;
		this.workIncome = workIncome;
		this.annuityIncome = annuityIncome;
		this.etcIncome = etcIncome;
		this.totalPaidIncome = totalPaidIncome;
		this.comCode = comCode;
	}

	public String getDocumentNo() {
		return documentNo;
	}

	public void setDocumentNo(String documentNo) {
		this.documentNo = documentNo;
	}

	public String getYearOfAttr() {
		return yearOfAttr;
	}

	public void setYearOfAttr(String yearOfAttr) {
		this.yearOfAttr = yearOfAttr;
	}

	public String getPaidTax() {
		return paidTax;
	}

	public void setPaidTax(String paidTax) {
		this.paidTax = paidTax;
	}

	public String getPaymentExpectedReturn() {
		return paymentExpectedReturn;
	}

	public void setPaymentExpectedReturn(String paymentExpectedReturn) {
		this.paymentExpectedReturn = paymentExpectedReturn;
	}

	public String getOccasinalTax() {
		return occasinalTax;
	}

	public void setOccasinalTax(String occasinalTax) {
		this.occasinalTax = occasinalTax;
	}

	public String getInterestIncome() {
		return interestIncome;
	}

	public void setInterestIncome(String interestIncome) {
		this.interestIncome = interestIncome;
	}

	public String getDividendIncome() {
		return dividendIncome;
	}

	public void setDividendIncome(String dividendIncome) {
		this.dividendIncome = dividendIncome;
	}

	public String getBizIncome() {
		return bizIncome;
	}

	public void setBizIncome(String bizIncome) {
		this.bizIncome = bizIncome;
	}

	public String getWorkIncome() {
		return workIncome;
	}

	public void setWorkIncome(String workIncome) {
		this.workIncome = workIncome;
	}

	public String getAnnuityIncome() {
		return annuityIncome;
	}

	public void setAnnuityIncome(String annuityIncome) {
		this.annuityIncome = annuityIncome;
	}

	public String getEtcIncome() {
		return etcIncome;
	}

	public void setEtcIncome(String etcIncome) {
		this.etcIncome = etcIncome;
	}

	public String getTotalPaidIncome() {
		return totalPaidIncome;
	}

	public void setTotalPaidIncome(String totalPaidIncome) {
		this.totalPaidIncome = totalPaidIncome;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	@Override
	public String toString() {
		return "PaidTaxStmtDto [documentNo=" + documentNo + ", yearOfAttr=" + yearOfAttr + ", paidTax=" + paidTax
				+ ", paymentExpectedReturn=" + paymentExpectedReturn + ", occasinalTax=" + occasinalTax
				+ ", interestIncome=" + interestIncome + ", dividendIncome=" + dividendIncome + ", bizIncome="
				+ bizIncome + ", workIncome=" + workIncome + ", annuityIncome=" + annuityIncome + ", etcIncome="
				+ etcIncome + ", totalPaidIncome=" + totalPaidIncome + ", comCode=" + comCode + "]";
	}
	
	
	

}
