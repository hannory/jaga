package com.kh.jaga.taxInvoice.model.vo;

import java.math.BigDecimal;

public class TaxInvoicePrintDTO {
	private String slipCode;		//전표번호
	private String slipDate;		//전표일자
	private String supplyValue;		//공급가액
	private String valueTax;		//부가세
	private String bizRegNum;		//거래처사업자등록번호
    private String venderName;		//거래처상호명
    private String venderBossName;	//거래처사업주
    private String sellWay;			//거래처업태
    private String sellTarget;		//거래처종목
    private String venderAddress;	//거래처주소
    private String bizName;			//상호
    private String bossName;		//사업주
    private String bizLocation;		//주소지
    private String bizNum;			//사업자등록번호
    private String sellWayName; 	//업태
    private String sellTargetName; 	//종목
    private int year;
    private int month;
    private int date;
    private BigDecimal supplyDeaga;
    
    public TaxInvoicePrintDTO() {}

	public TaxInvoicePrintDTO(String slipCode, String slipDate, String supplyValue, String valueTax, String bizRegNum,
			String venderName, String venderBossName, String sellWay, String sellTarget, String venderAddress,
			String bizName, String bossName, String bizLocation, String bizNum, String sellWayName,
			String sellTargetName, int year, int month, int date, BigDecimal supplyDeaga) {
		super();
		this.slipCode = slipCode;
		this.slipDate = slipDate;
		this.supplyValue = supplyValue;
		this.valueTax = valueTax;
		this.bizRegNum = bizRegNum;
		this.venderName = venderName;
		this.venderBossName = venderBossName;
		this.sellWay = sellWay;
		this.sellTarget = sellTarget;
		this.venderAddress = venderAddress;
		this.bizName = bizName;
		this.bossName = bossName;
		this.bizLocation = bizLocation;
		this.bizNum = bizNum;
		this.sellWayName = sellWayName;
		this.sellTargetName = sellTargetName;
		this.year = year;
		this.month = month;
		this.date = date;
		this.supplyDeaga = supplyDeaga;
	}

	public String getSlipCode() {
		return slipCode;
	}

	public void setSlipCode(String slipCode) {
		this.slipCode = slipCode;
	}

	public String getSlipDate() {
		return slipDate;
	}

	public void setSlipDate(String slipDate) {
		this.slipDate = slipDate;
	}

	public String getSupplyValue() {
		return supplyValue;
	}

	public void setSupplyValue(String supplyValue) {
		this.supplyValue = supplyValue;
	}

	public String getValueTax() {
		return valueTax;
	}

	public void setValueTax(String valueTax) {
		this.valueTax = valueTax;
	}

	public String getBizRegNum() {
		return bizRegNum;
	}

	public void setBizRegNum(String bizRegNum) {
		this.bizRegNum = bizRegNum;
	}

	public String getVenderName() {
		return venderName;
	}

	public void setVenderName(String venderName) {
		this.venderName = venderName;
	}

	public String getVenderBossName() {
		return venderBossName;
	}

	public void setVenderBossName(String venderBossName) {
		this.venderBossName = venderBossName;
	}

	public String getSellWay() {
		return sellWay;
	}

	public void setSellWay(String sellWay) {
		this.sellWay = sellWay;
	}

	public String getSellTarget() {
		return sellTarget;
	}

	public void setSellTarget(String sellTarget) {
		this.sellTarget = sellTarget;
	}

	public String getVenderAddress() {
		return venderAddress;
	}

	public void setVenderAddress(String venderAddress) {
		this.venderAddress = venderAddress;
	}

	public String getBizName() {
		return bizName;
	}

	public void setBizName(String bizName) {
		this.bizName = bizName;
	}

	public String getBossName() {
		return bossName;
	}

	public void setBossName(String bossName) {
		this.bossName = bossName;
	}

	public String getBizLocation() {
		return bizLocation;
	}

	public void setBizLocation(String bizLocation) {
		this.bizLocation = bizLocation;
	}

	public String getBizNum() {
		return bizNum;
	}

	public void setBizNum(String bizNum) {
		this.bizNum = bizNum;
	}

	public String getSellWayName() {
		return sellWayName;
	}

	public void setSellWayName(String sellWayName) {
		this.sellWayName = sellWayName;
	}

	public String getSellTargetName() {
		return sellTargetName;
	}

	public void setSellTargetName(String sellTargetName) {
		this.sellTargetName = sellTargetName;
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

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public BigDecimal getSupplyDeaga() {
		return supplyDeaga;
	}

	public void setSupplyDeaga(BigDecimal supplyDeaga) {
		this.supplyDeaga = supplyDeaga;
	}

	@Override
	public String toString() {
		return "TaxInvoicePrintDTO [slipCode=" + slipCode + ", slipDate=" + slipDate + ", supplyValue=" + supplyValue
				+ ", valueTax=" + valueTax + ", bizRegNum=" + bizRegNum + ", venderName=" + venderName
				+ ", venderBossName=" + venderBossName + ", sellWay=" + sellWay + ", sellTarget=" + sellTarget
				+ ", venderAddress=" + venderAddress + ", bizName=" + bizName + ", bossName=" + bossName
				+ ", bizLocation=" + bizLocation + ", bizNum=" + bizNum + ", sellWayName=" + sellWayName
				+ ", sellTargetName=" + sellTargetName + ", year=" + year + ", month=" + month + ", date=" + date
				+ ", supplyDeaga=" + supplyDeaga + "]";
	}

    
    
}
