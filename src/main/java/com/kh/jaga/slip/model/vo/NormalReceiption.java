package com.kh.jaga.slip.model.vo;

import java.sql.Date;

public class NormalReceiption {
	
	private String slipCode;
	private String slipDivision;
	private String division;
	private Date slipDate;
	private String evidenceCode;
	private String venderCode;
	private int supplyValue;
	private int valueTax;
	private String deemedStatus;
	private String resolutionCode;
	private String brief;
	private String item;
	private String comCode;
	private String dateSlipCode;
	
	public NormalReceiption() {}

	public NormalReceiption(String slipCode, String slipDivision, String division, Date slipDate, String evidenceCode,
			String venderCode, int supplyValue, int valueTax, String deemedStatus, String resolutionCode, String brief,
			String item, String comCode, String dateSlipCode) {
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

	public int getSupplyValue() {
		return supplyValue;
	}

	public void setSupplyValue(int supplyValue) {
		this.supplyValue = supplyValue;
	}

	public int getValueTax() {
		return valueTax;
	}

	public void setValueTax(int valueTax) {
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

	@Override
	public String toString() {
		return "normalReceiption [slipCode=" + slipCode + ", slipDivision=" + slipDivision + ", division=" + division
				+ ", slipDate=" + slipDate + ", evidenceCode=" + evidenceCode + ", venderCode=" + venderCode
				+ ", supplyValue=" + supplyValue + ", valueTax=" + valueTax + ", deemedStatus=" + deemedStatus
				+ ", resolutionCode=" + resolutionCode + ", brief=" + brief + ", item=" + item + ", comCode=" + comCode
				+ ", dateSlipCode=" + dateSlipCode + "]";
	}
	
	
}
