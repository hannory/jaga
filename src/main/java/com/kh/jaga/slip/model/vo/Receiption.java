package com.kh.jaga.slip.model.vo;

import java.sql.Date;
import java.util.List;

public class Receiption {
	
	private String slipCode;		//전표코드
	private String slipDivision;	//전표구분
	private String division;		//구분
	private Date slipDate;			//전표일
	private String evidenceCode;	//증빙종류
	private String venderCode;		//거래처코드
	private int supplyValue;		//공급가액
	private int valueTax;			//부가세
	private String deemedStatus;	//의제여부
	private String resolutionCode;	//결의서코드
	private String brief;			//적요
	private String item;			//품목
	private String comCode;			//회사코드
	private String dateSlipCode;	//회사별, 일자별 전표번호
	private List<Receiption> normalReceiptionList;
	private String journalCode;		//분개번호
	private String debitCredit;		//차대구분
	private int price;				//금액
	private String accountCode;		//계정코드
	
	public Receiption() {}

	public Receiption(String slipCode, String slipDivision, String division, Date slipDate, String evidenceCode,
			String venderCode, int supplyValue, int valueTax, String deemedStatus, String resolutionCode, String brief,
			String item, String comCode, String dateSlipCode, List<Receiption> normalReceiptionList, String journalCode,
			String debitCredit, int price, String accountCode) {
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
		this.normalReceiptionList = normalReceiptionList;
		this.journalCode = journalCode;
		this.debitCredit = debitCredit;
		this.price = price;
		this.accountCode = accountCode;
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

	public List<Receiption> getNormalReceiptionList() {
		return normalReceiptionList;
	}

	public void setNormalReceiptionList(List<Receiption> normalReceiptionList) {
		this.normalReceiptionList = normalReceiptionList;
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
		return "Receiption [slipCode=" + slipCode + ", slipDivision=" + slipDivision + ", division=" + division
				+ ", slipDate=" + slipDate + ", evidenceCode=" + evidenceCode + ", venderCode=" + venderCode
				+ ", supplyValue=" + supplyValue + ", valueTax=" + valueTax + ", deemedStatus=" + deemedStatus
				+ ", resolutionCode=" + resolutionCode + ", brief=" + brief + ", item=" + item + ", comCode=" + comCode
				+ ", dateSlipCode=" + dateSlipCode + ", normalReceiptionList=" + normalReceiptionList + ", journalCode="
				+ journalCode + ", debitCredit=" + debitCredit + ", price=" + price + ", accountCode=" + accountCode
				+ "]";
	}
	
	
}
