package com.kh.jaga.slip.model.vo;

public class Journalize {
	private String journalCode;		//분개번호
	private String slipCode;		//전표코드
	private String debitCredit;		//차대구분
	private int price;				//금액
	private String accountCode;		//계정코드
	
	public Journalize() {}

	public Journalize(String journalCode, String slipCode, String debitCredit, int price, String accountCode) {
		super();
		this.journalCode = journalCode;
		this.slipCode = slipCode;
		this.debitCredit = debitCredit;
		this.price = price;
		this.accountCode = accountCode;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAccountCode() {
		return accountCode;
	}

	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
	}

	@Override
	public String toString() {
		return "Journalize [journalCode=" + journalCode + ", slipCode=" + slipCode + ", debitCredit=" + debitCredit
				+ ", price=" + price + ", accountCode=" + accountCode + "]";
	}
	
	
}
