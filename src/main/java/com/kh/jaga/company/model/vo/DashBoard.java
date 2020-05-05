package com.kh.jaga.company.model.vo;

import java.math.BigDecimal;

public class DashBoard {
	private BigDecimal profit;
	private BigDecimal sale;
	private BigDecimal buy;
	
	private BigDecimal supplyValue;
	private BigDecimal taxValue;
	private BigDecimal sumValue;
	private String item;
	
	private BigDecimal totalVender;
	private String venderName;
	
	public DashBoard() {}

	public DashBoard(BigDecimal profit, BigDecimal sale, BigDecimal buy, BigDecimal supplyValue, BigDecimal taxValue,
			BigDecimal sumValue, String item, BigDecimal totalVender, String venderName) {
		super();
		this.profit = profit;
		this.sale = sale;
		this.buy = buy;
		this.supplyValue = supplyValue;
		this.taxValue = taxValue;
		this.sumValue = sumValue;
		this.item = item;
		this.totalVender = totalVender;
		this.venderName = venderName;
	}

	public BigDecimal getProfit() {
		return profit;
	}

	public void setProfit(BigDecimal profit) {
		this.profit = profit;
	}

	public BigDecimal getSale() {
		return sale;
	}

	public void setSale(BigDecimal sale) {
		this.sale = sale;
	}

	public BigDecimal getBuy() {
		return buy;
	}

	public void setBuy(BigDecimal buy) {
		this.buy = buy;
	}

	public BigDecimal getSupplyValue() {
		return supplyValue;
	}

	public void setSupplyValue(BigDecimal supplyValue) {
		this.supplyValue = supplyValue;
	}

	public BigDecimal getTaxValue() {
		return taxValue;
	}

	public void setTaxValue(BigDecimal taxValue) {
		this.taxValue = taxValue;
	}

	public BigDecimal getSumValue() {
		return sumValue;
	}

	public void setSumValue(BigDecimal sumValue) {
		this.sumValue = sumValue;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public BigDecimal getTotalVender() {
		return totalVender;
	}

	public void setTotalVender(BigDecimal totalVender) {
		this.totalVender = totalVender;
	}

	public String getVenderName() {
		return venderName;
	}

	public void setVenderName(String venderName) {
		this.venderName = venderName;
	}

	@Override
	public String toString() {
		return "DashBoard [profit=" + profit + ", sale=" + sale + ", buy=" + buy + ", supplyValue=" + supplyValue
				+ ", taxValue=" + taxValue + ", sumValue=" + sumValue + ", item=" + item + ", totalVender="
				+ totalVender + ", venderName=" + venderName + "]";
	}

	
	
}
