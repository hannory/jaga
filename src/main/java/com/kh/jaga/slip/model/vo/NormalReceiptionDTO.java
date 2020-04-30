package com.kh.jaga.slip.model.vo;

import java.math.BigDecimal;

public class NormalReceiptionDTO {

	private String slipCode;
	private String slipDate;
	private String brief;
	private String dateSlipCode;
	private String journalCode;
	private String debitCredit;
	private BigDecimal price;
	private String accountCode;
	private String accountTitle;
	private String venderCode;
	private String venderName;
	
	private String month;
	private String day;
	
	public NormalReceiptionDTO() {}

	public NormalReceiptionDTO(String slipCode, String slipDate, String brief, String dateSlipCode, String journalCode,
			String debitCredit, BigDecimal price, String accountCode, String accountTitle, String venderCode,
			String venderName, String month, String day) {
		super();
		this.slipCode = slipCode;
		this.slipDate = slipDate;
		this.brief = brief;
		this.dateSlipCode = dateSlipCode;
		this.journalCode = journalCode;
		this.debitCredit = debitCredit;
		this.price = price;
		this.accountCode = accountCode;
		this.accountTitle = accountTitle;
		this.venderCode = venderCode;
		this.venderName = venderName;
		this.month = month;
		this.day = day;
	}

	public String getSlipCode() {
		return slipCode;
	}

	public void setSlipCode(String slipCode) {
		this.slipCode = slipCode;
	}

	public String getSlipDate() {
		return slipDate;
	}

	public void setSlipDate(String slipDate) {
		this.slipDate = slipDate;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getDateSlipCode() {
		return dateSlipCode;
	}

	public void setDateSlipCode(String dateSlipCode) {
		this.dateSlipCode = dateSlipCode;
	}

	public String getJournalCode() {
		return journalCode;
	}

	public void setJournalCode(String journalCode) {
		this.journalCode = journalCode;
	}

	public String getDebitCredit() {
		return debitCredit;
	}

	public void setDebitCredit(String debitCredit) {
		this.debitCredit = debitCredit;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getAccountCode() {
		return accountCode;
	}

	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
	}

	public String getAccountTitle() {
		return accountTitle;
	}

	public void setAccountTitle(String accountTitle) {
		this.accountTitle = accountTitle;
	}

	public String getVenderCode() {
		return venderCode;
	}

	public void setVenderCode(String venderCode) {
		this.venderCode = venderCode;
	}

	public String getVenderName() {
		return venderName;
	}

	public void setVenderName(String venderName) {
		this.venderName = venderName;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	@Override
	public String toString() {
		return "NormalReceiptionDTO [slipCode=" + slipCode + ", slipDate=" + slipDate + ", brief=" + brief
				+ ", dateSlipCode=" + dateSlipCode + ", journalCode=" + journalCode + ", debitCredit=" + debitCredit
				+ ", price=" + price + ", accountCode=" + accountCode + ", accountTitle=" + accountTitle
				+ ", venderCode=" + venderCode + ", venderName=" + venderName + ", month=" + month + ", day=" + day
				+ "]";
	}

	
}
