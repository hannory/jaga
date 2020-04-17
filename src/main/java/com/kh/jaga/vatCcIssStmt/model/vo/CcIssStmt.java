package com.kh.jaga.vatCcIssStmt.model.vo;

import java.math.BigDecimal;

public class CcIssStmt {

	private String issCode;				//발행금액집계표 코드
	private BigDecimal taxinvIss;		//세금계산서발급금액
	private BigDecimal invIss;			//계산서발급금
	private BigDecimal cardTax;			//카드_과세매출분
	private BigDecimal cardTaxFree;		//카드_면세매출분
	private BigDecimal cardSvc;			//카드_봉사료
	private BigDecimal cashTax;			//현금영수증_과세
	private BigDecimal cashTaxFree;		//현금영수증_면세
	private BigDecimal cashSvc;			//현금영수증_봉사료
	private BigDecimal digitalTax;		//전자지급_과세
	private BigDecimal digitalTaxFree;	//전자지급_면세
	private BigDecimal digitalSvc;		//전자지급_봉사료
	private int yearOfAttr;				//귀속년도
	private String termDiv;				//기수 구분 1:1기확정, 2:2기확정
	private String deadline;			//마감여부
	private String comCode;				//회사코드
	
	public CcIssStmt() {}

	public CcIssStmt(String issCode, BigDecimal taxinvIss, BigDecimal invIss, BigDecimal cardTax,
			BigDecimal cardTaxFree, BigDecimal cardSvc, BigDecimal cashTax, BigDecimal cashTaxFree, BigDecimal cashSvc,
			BigDecimal digitalTax, BigDecimal digitalTaxFree, BigDecimal digitalSvc, int yearOfAttr, String termDiv,
			String deadline, String comCode) {
		super();
		this.issCode = issCode;
		this.taxinvIss = taxinvIss;
		this.invIss = invIss;
		this.cardTax = cardTax;
		this.cardTaxFree = cardTaxFree;
		this.cardSvc = cardSvc;
		this.cashTax = cashTax;
		this.cashTaxFree = cashTaxFree;
		this.cashSvc = cashSvc;
		this.digitalTax = digitalTax;
		this.digitalTaxFree = digitalTaxFree;
		this.digitalSvc = digitalSvc;
		this.yearOfAttr = yearOfAttr;
		this.termDiv = termDiv;
		this.deadline = deadline;
		this.comCode = comCode;
	}

	public String getIssCode() {
		return issCode;
	}

	public void setIssCode(String issCode) {
		this.issCode = issCode;
	}

	public BigDecimal getTaxinvIss() {
		return taxinvIss;
	}

	public void setTaxinvIss(BigDecimal taxinvIss) {
		this.taxinvIss = taxinvIss;
	}

	public BigDecimal getInvIss() {
		return invIss;
	}

	public void setInvIss(BigDecimal invIss) {
		this.invIss = invIss;
	}

	public BigDecimal getCardTax() {
		return cardTax;
	}

	public void setCardTax(BigDecimal cardTax) {
		this.cardTax = cardTax;
	}

	public BigDecimal getCardTaxFree() {
		return cardTaxFree;
	}

	public void setCardTaxFree(BigDecimal cardTaxFree) {
		this.cardTaxFree = cardTaxFree;
	}

	public BigDecimal getCardSvc() {
		return cardSvc;
	}

	public void setCardSvc(BigDecimal cardSvc) {
		this.cardSvc = cardSvc;
	}

	public BigDecimal getCashTax() {
		return cashTax;
	}

	public void setCashTax(BigDecimal cashTax) {
		this.cashTax = cashTax;
	}

	public BigDecimal getCashTaxFree() {
		return cashTaxFree;
	}

	public void setCashTaxFree(BigDecimal cashTaxFree) {
		this.cashTaxFree = cashTaxFree;
	}

	public BigDecimal getCashSvc() {
		return cashSvc;
	}

	public void setCashSvc(BigDecimal cashSvc) {
		this.cashSvc = cashSvc;
	}

	public BigDecimal getDigitalTax() {
		return digitalTax;
	}

	public void setDigitalTax(BigDecimal digitalTax) {
		this.digitalTax = digitalTax;
	}

	public BigDecimal getDigitalTaxFree() {
		return digitalTaxFree;
	}

	public void setDigitalTaxFree(BigDecimal digitalTaxFree) {
		this.digitalTaxFree = digitalTaxFree;
	}

	public BigDecimal getDigitalSvc() {
		return digitalSvc;
	}

	public void setDigitalSvc(BigDecimal digitalSvc) {
		this.digitalSvc = digitalSvc;
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
		return "CcIssStmt [issCode=" + issCode + ", taxinvIss=" + taxinvIss + ", invIss=" + invIss + ", cardTax="
				+ cardTax + ", cardTaxFree=" + cardTaxFree + ", cardSvc=" + cardSvc + ", cashTax=" + cashTax
				+ ", cashTaxFree=" + cashTaxFree + ", cashSvc=" + cashSvc + ", digitalTax=" + digitalTax
				+ ", digitalTaxFree=" + digitalTaxFree + ", digitalSvc=" + digitalSvc + ", yearOfAttr=" + yearOfAttr
				+ ", termDiv=" + termDiv + ", deadline=" + deadline + ", comCode=" + comCode + "]";
	}
	
	
	



}
