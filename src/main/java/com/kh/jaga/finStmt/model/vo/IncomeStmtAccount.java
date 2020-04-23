package com.kh.jaga.finStmt.model.vo;

public class IncomeStmtAccount implements java.io.Serializable {
	private String comCode;
	private String dateSlipCode;	//회사별, 일별 전표코드
	private String debitCredit;		//차대구분
	private int price;				//금액
	private int accountCode;		//계정코드
	private String accountTitle;	//계정명
	private int year;
	private int month;
	
	public IncomeStmtAccount() {}
	
	public IncomeStmtAccount(String comCode, String dateSlipCode, String debitCredit, int price, int accountCode,
			String accountTitle, int year, int month) {
		super();
		this.comCode = comCode;
		this.dateSlipCode = dateSlipCode;
		this.debitCredit = debitCredit;
		this.price = price;
		this.accountCode = accountCode;
		this.accountTitle = accountTitle;
		this.year = year;
		this.month = month;
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

	@Override
	public String toString() {
		return "IncomeStmtAccount [comCode=" + comCode + ", dateSlipCode=" + dateSlipCode + ", debitCredit="
				+ debitCredit + ", price=" + price + ", accountCode=" + accountCode + ", accountTitle=" + accountTitle
				+ ", year=" + year + ", month=" + month + "]";
	}

	
	
}
