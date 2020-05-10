package com.kh.jaga.vatDeem.model.vo;

import java.math.BigDecimal;

public class DeemSlip {

	private String DeemSlipCode;		//의제전표pk
	private String deemedCode;			//의제매입신고서 코드
	private String venderCode;			//거래처코드
	private String slipCode;			//전표코드
	private String venderName;			//거래처이름
	private String bizRegNum;			//사업자번호
	private String evidenceCode;		//계산서 가 20, 신카면세가 60 /groupby를 이아이로 하자
	private int proCount;				//매입처수
	private int count1;					//건수
	private BigDecimal purchasePrice;	//매입처수
	private BigDecimal deemTaxPrice;	//의제매입세액
	
	public DeemSlip() {}

	public DeemSlip(String deemSlipCode, String deemedCode, String venderCode, String slipCode, String venderName,
			String bizRegNum, String evidenceCode, int proCount, int count1, BigDecimal purchasePrice,
			BigDecimal deemTaxPrice) {
		super();
		DeemSlipCode = deemSlipCode;
		this.deemedCode = deemedCode;
		this.venderCode = venderCode;
		this.slipCode = slipCode;
		this.venderName = venderName;
		this.bizRegNum = bizRegNum;
		this.evidenceCode = evidenceCode;
		this.proCount = proCount;
		this.count1 = count1;
		this.purchasePrice = purchasePrice;
		this.deemTaxPrice = deemTaxPrice;
	}

	public String getDeemSlipCode() {
		return DeemSlipCode;
	}

	public void setDeemSlipCode(String deemSlipCode) {
		DeemSlipCode = deemSlipCode;
	}

	public String getDeemedCode() {
		return deemedCode;
	}

	public void setDeemedCode(String deemedCode) {
		this.deemedCode = deemedCode;
	}

	public String getVenderCode() {
		return venderCode;
	}

	public void setVenderCode(String venderCode) {
		this.venderCode = venderCode;
	}

	public String getSlipCode() {
		return slipCode;
	}

	public void setSlipCode(String slipCode) {
		this.slipCode = slipCode;
	}

	public String getVenderName() {
		return venderName;
	}

	public void setVenderName(String venderName) {
		this.venderName = venderName;
	}

	public String getBizRegNum() {
		return bizRegNum;
	}

	public void setBizRegNum(String bizRegNum) {
		this.bizRegNum = bizRegNum;
	}

	public String getEvidenceCode() {
		return evidenceCode;
	}

	public void setEvidenceCode(String evidenceCode) {
		this.evidenceCode = evidenceCode;
	}

	public int getProCount() {
		return proCount;
	}

	public void setProCount(int proCount) {
		this.proCount = proCount;
	}

	public int getCount1() {
		return count1;
	}

	public void setCount1(int count1) {
		this.count1 = count1;
	}

	public BigDecimal getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(BigDecimal purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public BigDecimal getDeemTaxPrice() {
		return deemTaxPrice;
	}

	public void setDeemTaxPrice(BigDecimal deemTaxPrice) {
		this.deemTaxPrice = deemTaxPrice;
	}

	@Override
	public String toString() {
		return "DeemSlip [DeemSlipCode=" + DeemSlipCode + ", deemedCode=" + deemedCode + ", venderCode=" + venderCode
				+ ", slipCode=" + slipCode + ", venderName=" + venderName + ", bizRegNum=" + bizRegNum
				+ ", evidenceCode=" + evidenceCode + ", proCount=" + proCount + ", count1=" + count1
				+ ", purchasePrice=" + purchasePrice + ", deemTaxPrice=" + deemTaxPrice + "]";
	}

	
	
	
	
	
}
