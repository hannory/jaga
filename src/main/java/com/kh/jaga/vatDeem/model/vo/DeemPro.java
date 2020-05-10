package com.kh.jaga.vatDeem.model.vo;

import java.io.Serializable;
import java.math.BigDecimal;

public class DeemPro implements Serializable{

	private String farmFishPurCode; //pk
	private String deemedCode;		//의제매입 코드
	private String venderName;		//공급자명
	private String venderCode;		//거래처 코드	
	private String bizRegNum;		//주민번호(사업자번호)
	private int numofTxn;			//건수
	private String prodName;		//품명
	private int countFf;				//수량
	private BigDecimal purchasePrice;	//매입가액
	
	public DeemPro() {}

	public DeemPro(String farmFishPurCode, String deemedCode, String venderName, String venderCode, String bizRegNum,
			int numofTxn, String prodName, int countFf, BigDecimal purchasePrice) {
		super();
		this.farmFishPurCode = farmFishPurCode;
		this.deemedCode = deemedCode;
		this.venderName = venderName;
		this.venderCode = venderCode;
		this.bizRegNum = bizRegNum;
		this.numofTxn = numofTxn;
		this.prodName = prodName;
		this.countFf = countFf;
		this.purchasePrice = purchasePrice;
	}

	public String getFarmFishPurCode() {
		return farmFishPurCode;
	}

	public void setFarmFishPurCode(String farmFishPurCode) {
		this.farmFishPurCode = farmFishPurCode;
	}

	public String getDeemedCode() {
		return deemedCode;
	}

	public void setDeemedCode(String deemedCode) {
		this.deemedCode = deemedCode;
	}

	public String getVenderName() {
		return venderName;
	}

	public void setVenderName(String venderName) {
		this.venderName = venderName;
	}

	public String getVenderCode() {
		return venderCode;
	}

	public void setVenderCode(String venderCode) {
		this.venderCode = venderCode;
	}

	public String getBizRegNum() {
		return bizRegNum;
	}

	public void setBizRegNum(String bizRegNum) {
		this.bizRegNum = bizRegNum;
	}

	public int getNumofTxn() {
		return numofTxn;
	}

	public void setNumofTxn(int numofTxn) {
		this.numofTxn = numofTxn;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getCountFf() {
		return countFf;
	}

	public void setCountFf(int countFf) {
		this.countFf = countFf;
	}

	public BigDecimal getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(BigDecimal purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	@Override
	public String toString() {
		return "DeemPro [farmFishPurCode=" + farmFishPurCode + ", deemedCode=" + deemedCode + ", venderName="
				+ venderName + ", venderCode=" + venderCode + ", bizRegNum=" + bizRegNum + ", numofTxn=" + numofTxn
				+ ", prodName=" + prodName + ", countFf=" + countFf + ", purchasePrice=" + purchasePrice + "]";
	}

	
	
	
	
}
