package com.kh.jaga.finStmt.model.vo;

import java.sql.Date;

public class IncomeStmtAccount implements java.io.Serializable {
	private String comCode;
	private int accountCode;		//계정코드
	private String accountTitle;	//계정명
	private int year;				//조회 연도
	private int month;				//조회 월
	private Date slipDate;			//전표일
	private String dateSlipCode;	//회사별, 일별 전표코드
	private String brief;			//적요
	private String venderCode;		//거래처 코드
	private String venderName;		//거래처명
	private String debitCredit;		//차대구분
	private int price;				//금액
	
	public IncomeStmtAccount() {}

	public IncomeStmtAccount(String comCode, String dateSlipCode, String debitCredit, int price, int accountCode,
			String accountTitle, String brief, int year, int month, Date slipDate) {
		super();
		this.comCode = comCode;
		this.dateSlipCode = dateSlipCode;
		this.debitCredit = debitCredit;
		this.price = price;
		this.accountCode = accountCode;
		this.accountTitle = accountTitle;
		this.brief = brief;
		this.year = year;
		this.month = month;
		this.slipDate = slipDate;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	public String getDateSlipCode() {
		return dateSlipCode;
	}

	public void setDateSlipCode(String dateSlipCode) {
		this.dateSlipCode = dateSlipCode;
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

	public int getAccountCode() {
		return accountCode;
	}

	public void setAccountCode(int accountCode) {
		this.accountCode = accountCode;
	}

	public String getAccountTitle() {
		return accountTitle;
	}

	public void setAccountTitle(String accountTitle) {
		this.accountTitle = accountTitle;
	}
	
	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}
	
	public Date getSlipDate() {
		return slipDate;
	}

	public void setSlipDate(Date slipDate) {
		this.slipDate = slipDate;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	@Override
	public String toString() {
		return "IncomeStmtAccount [comCode=" + comCode + ", dateSlipCode=" + dateSlipCode + ", debitCredit="
				+ debitCredit + ", price=" + price + ", accountCode=" + accountCode + ", accountTitle=" + accountTitle
				+ ", brief=" + brief + ", year=" + year + ", month=" + month + ", slipDate=" + slipDate + "]";
	}

}
