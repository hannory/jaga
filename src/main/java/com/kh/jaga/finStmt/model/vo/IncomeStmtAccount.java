package com.kh.jaga.finStmt.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;

public class IncomeStmtAccount implements java.io.Serializable {
	private String comCode;
	private int accountCode;		//계정코드
	private ArrayList<Integer> accountArr;		//계정코드 배열 
	private String accountTitle;	//계정명
	private String curPast;			//당기, 전기여부
	private int year;				//조회 연도
	private int month;				//조회 월
	private int date;				//조회 일
	private Date slipDate;			//전표일
	private String dateSlipCode;	//회사별, 일별 전표코드
	private String brief;			//적요
	private String venderCode;		//거래처 코드
	private String venderName;		//거래처명
	private String debitCredit;		//차대구분
	private long price;				//금액
	
	public IncomeStmtAccount() {}
	
	public IncomeStmtAccount(String comCode, int accountCode, ArrayList accountArr, String accountTitle, String curPast,
			int year, int month, int date, Date slipDate, String dateSlipCode, String brief, String venderCode,
			String venderName, String debitCredit, long price) {
		super();
		this.comCode = comCode;
		this.accountCode = accountCode;
		this.accountArr = accountArr;
		this.accountTitle = accountTitle;
		this.curPast = curPast;
		this.year = year;
		this.month = month;
		this.date = date;
		this.slipDate = slipDate;
		this.dateSlipCode = dateSlipCode;
		this.brief = brief;
		this.venderCode = venderCode;
		this.venderName = venderName;
		this.debitCredit = debitCredit;
		this.price = price;
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

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
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
	
	public String getCurPast() {
		return curPast;
	}

	public void setCurPast(String curPast) {
		this.curPast = curPast;
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

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public ArrayList<Integer> getAccountArr() {
		return accountArr;
	}

	public void setAccountArr(ArrayList<Integer> accountArr) {
		this.accountArr = accountArr;
	}

	@Override
	public String toString() {
		return "IncomeStmtAccount [comCode=" + comCode + ", accountCode=" + accountCode + ", accountArr=" + accountArr
				+ ", accountTitle=" + accountTitle + ", curPast=" + curPast + ", year=" + year + ", month=" + month
				+ ", date=" + date + ", slipDate=" + slipDate + ", dateSlipCode=" + dateSlipCode + ", brief=" + brief
				+ ", venderCode=" + venderCode + ", venderName=" + venderName + ", debitCredit=" + debitCredit
				+ ", price=" + price + "]";
	}
	
	
	
}
