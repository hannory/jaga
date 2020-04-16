package com.kh.jaga.slip.model.vo;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class Receiption {
	
	private String slipCode;		//전표코드
	private String slipDivision;	//전표구분
	private String division;		//구분
	private Date slipDate;			//전표일
	private String evidenceCode;	//증빙종류
	private String venderCode;		//거래처코드
	private BigDecimal supplyValue;		//공급가액
	private BigDecimal valueTax;			//부가세
	private String deemedStatus;	//의제여부
	private String resolutionCode;	//결의서코드
	private String brief;			//적요
	private String item;			//품목
	private String comCode;			//회사코드
	private String dateSlipCode;	//회사별, 일자별 전표번호
	private List<Journalize> journalizeList;
	
	public Receiption() {}

	public Receiption(String slipCode, String slipDivision, String division, Date slipDate, String evidenceCode,
			String venderCode, BigDecimal supplyValue, BigDecimal valueTax, String deemedStatus, String resolutionCode,
			String brief, String item, String comCode, String dateSlipCode, List<Journalize> journalizeList) {
		super();
		this.slipCode = slipCode;
		this.slipDivision = slipDivision;
		this.division = division;
		this.slipDate = slipDate;
		this.evidenceCode = evidenceCode;
		this.venderCode = venderCode;
		this.supplyValue = supplyValue;
		this.valueTax = valueTax;
		this.deemedStatus = deemedStatus;
		this.resolutionCode = resolutionCode;
		this.brief = brief;
		this.item = item;
		this.comCode = comCode;
		this.dateSlipCode = dateSlipCode;
		this.journalizeList = journalizeList;
	}

	public String getSlipCode() {
		return slipCode;
	}

	public void setSlipCode(String slipCode) {
		this.slipCode = slipCode;
	}

	public String getSlipDivision() {
		return slipDivision;
	}

	public void setSlipDivision(String slipDivision) {
		this.slipDivision = slipDivision;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public Date getSlipDate() {
		return slipDate;
	}

	public void setSlipDate(Date slipDate) {
		this.slipDate = slipDate;
	}

	public String getEvidenceCode() {
		return evidenceCode;
	}

	public void setEvidenceCode(String evidenceCode) {
		this.evidenceCode = evidenceCode;
	}

	public String getVenderCode() {
		return venderCode;
	}

	public void setVenderCode(String venderCode) {
		this.venderCode = venderCode;
	}

	public BigDecimal getSupplyValue() {
		return supplyValue;
	}

	public void setSupplyValue(BigDecimal supplyValue) {
		this.supplyValue = supplyValue;
	}

	public BigDecimal getValueTax() {
		return valueTax;
	}

	public void setValueTax(BigDecimal valueTax) {
		this.valueTax = valueTax;
	}

	public String getDeemedStatus() {
		return deemedStatus;
	}

	public void setDeemedStatus(String deemedStatus) {
		this.deemedStatus = deemedStatus;
	}

	public String getResolutionCode() {
		return resolutionCode;
	}

	public void setResolutionCode(String resolutionCode) {
		this.resolutionCode = resolutionCode;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
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

	public List<Journalize> getJournalizeList() {
		return journalizeList;
	}

	public void setJournalizeList(List<Journalize> journalizeList) {
		this.journalizeList = journalizeList;
	}

	@Override
	public String toString() {
		return "Receiption [slipCode=" + slipCode + ", slipDivision=" + slipDivision + ", division=" + division
				+ ", slipDate=" + slipDate + ", evidenceCode=" + evidenceCode + ", venderCode=" + venderCode
				+ ", supplyValue=" + supplyValue + ", valueTax=" + valueTax + ", deemedStatus=" + deemedStatus
				+ ", resolutionCode=" + resolutionCode + ", brief=" + brief + ", item=" + item + ", comCode=" + comCode
				+ ", dateSlipCode=" + dateSlipCode + ", journalizeList=" + journalizeList + "]";
	}

	
}
