package com.kh.jaga.aggregateIncomeTax.model.dto;

public class AmountDataDto {
	private String incomeStmtCode;
	private String year;
	private String sum10;
	private String sum20;
	private String sum40;
	
	public AmountDataDto() {}

	public AmountDataDto(String incomeStmtCode, String year, String sum10, String sum20, String sum40) {
		super();
		this.incomeStmtCode = incomeStmtCode;
		this.year = year;
		this.sum10 = sum10;
		this.sum20 = sum20;
		this.sum40 = sum40;
	}

	public String getIncomeStmtCode() {
		return incomeStmtCode;
	}

	public void setIncomeStmtCode(String incomeStmtCode) {
		this.incomeStmtCode = incomeStmtCode;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getSum10() {
		return sum10;
	}

	public void setSum10(String sum10) {
		this.sum10 = sum10;
	}

	public String getSum20() {
		return sum20;
	}

	public void setSum20(String sum20) {
		this.sum20 = sum20;
	}

	public String getSum40() {
		return sum40;
	}

	public void setSum40(String sum40) {
		this.sum40 = sum40;
	}

	@Override
	public String toString() {
		return "AmountDataDto [incomeStmtCode=" + incomeStmtCode + ", year=" + year + ", sum10=" + sum10 + ", sum20="
				+ sum20 + ", sum40=" + sum40 + "]";
	}
	
	
	
	
	
}
