package com.kh.jaga.slip.model.vo;

import java.math.BigDecimal;

public class Journalize {
	private String journalCode;		//분개번호
	private String slipCode;		//전표코드
	private String debitCredit;		//차대구분
	private BigDecimal price;				//금액
	private String accountCode;		//계정코드
	private String venderCode;
	
	public Journalize() {}

	public Journalize(String journalCode, String slipCode, String debitCredit, BigDecimal price, String accountCode,
			String venderCode) {
		super();
		this.journalCode = journalCode;
		this.slipCode = slipCode;
		this.debitCredit = debitCredit;
		this.price = price;
		this.accountCode = accountCode;
		this.venderCode = venderCode;
	}

	public String getJournalCode() {
		return journalCode;
	}

	public void setJournalCode(String journalCode) {
		this.journalCode = journalCode;
	}

	public String getSlipCode() {
		return slipCode;
	}

	public void setSlipCode(String slipCode) {
		this.slipCode = slipCode;
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

	public String getVenderCode() {
		return venderCode;
	}

	public void setVenderCode(String venderCode) {
		this.venderCode = venderCode;
	}

	@Override
	public String toString() {
		return "Journalize [journalCode=" + journalCode + ", slipCode=" + slipCode + ", debitCredit=" + debitCredit
				+ ", price=" + price + ", accountCode=" + accountCode + ", venderCode=" + venderCode + "]";
	}

	
}
