package com.kh.jaga.accountBook.model.vo;

import java.math.BigDecimal;

public class GenderLedgerDTO {
    private String yearMonthAll;
	private String yearMonthCha;
	private String debitCreditCha;
	private BigDecimal priceSumCha;
	private String yearMonthDea;
	private String debitCreditDea;
	private BigDecimal priceSumDea;
    private BigDecimal sumMonthCha;
	private BigDecimal sumMonthDea;
	private BigDecimal sumAll;
	
	public GenderLedgerDTO() {}

	public GenderLedgerDTO(String yearMonthAll, String yearMonthCha, String debitCreditCha, BigDecimal priceSumCha,
			String yearMonthDea, String debitCreditDea, BigDecimal priceSumDea, BigDecimal sumMonthCha,
			BigDecimal sumMonthDea, BigDecimal sumAll) {
		super();
		this.yearMonthAll = yearMonthAll;
		this.yearMonthCha = yearMonthCha;
		this.debitCreditCha = debitCreditCha;
		this.priceSumCha = priceSumCha;
		this.yearMonthDea = yearMonthDea;
		this.debitCreditDea = debitCreditDea;
		this.priceSumDea = priceSumDea;
		this.sumMonthCha = sumMonthCha;
		this.sumMonthDea = sumMonthDea;
		this.sumAll = sumAll;
	}

	public String getYearMonthAll() {
		return yearMonthAll;
	}

	public void setYearMonthAll(String yearMonthAll) {
		this.yearMonthAll = yearMonthAll;
	}

	public String getYearMonthCha() {
		return yearMonthCha;
	}

	public void setYearMonthCha(String yearMonthCha) {
		this.yearMonthCha = yearMonthCha;
	}

	public String getDebitCreditCha() {
		return debitCreditCha;
	}

	public void setDebitCreditCha(String debitCreditCha) {
		this.debitCreditCha = debitCreditCha;
	}

	public BigDecimal getPriceSumCha() {
		return priceSumCha;
	}

	public void setPriceSumCha(BigDecimal priceSumCha) {
		this.priceSumCha = priceSumCha;
	}

	public String getYearMonthDea() {
		return yearMonthDea;
	}

	public void setYearMonthDea(String yearMonthDea) {
		this.yearMonthDea = yearMonthDea;
	}

	public String getDebitCreditDea() {
		return debitCreditDea;
	}

	public void setDebitCreditDea(String debitCreditDea) {
		this.debitCreditDea = debitCreditDea;
	}

	public BigDecimal getPriceSumDea() {
		return priceSumDea;
	}

	public void setPriceSumDea(BigDecimal priceSumDea) {
		this.priceSumDea = priceSumDea;
	}

	public BigDecimal getSumMonthCha() {
		return sumMonthCha;
	}

	public void setSumMonthCha(BigDecimal sumMonthCha) {
		this.sumMonthCha = sumMonthCha;
	}

	public BigDecimal getSumMonthDea() {
		return sumMonthDea;
	}

	public void setSumMonthDea(BigDecimal sumMonthDea) {
		this.sumMonthDea = sumMonthDea;
	}

	public BigDecimal getSumAll() {
		return sumAll;
	}

	public void setSumAll(BigDecimal sumAll) {
		this.sumAll = sumAll;
	}

	@Override
	public String toString() {
		return "GenderLedgerDTO [yearMonthAll=" + yearMonthAll + ", yearMonthCha=" + yearMonthCha + ", debitCreditCha="
				+ debitCreditCha + ", priceSumCha=" + priceSumCha + ", yearMonthDea=" + yearMonthDea
				+ ", debitCreditDea=" + debitCreditDea + ", priceSumDea=" + priceSumDea + ", sumMonthCha=" + sumMonthCha
				+ ", sumMonthDea=" + sumMonthDea + ", sumAll=" + sumAll + "]";
	}

	
}

