package com.kh.jaga.bugagachi.model.vo;

import java.io.Serializable;
import java.math.BigDecimal;

public class CcSalesSlipDetail implements Serializable{

	private String ccrcptCode;
	private String eventDiv;
	private int dealCount;
	private BigDecimal valOfSupply;
	private BigDecimal tax;
	private String rcptstmtCode;
	
	public CcSalesSlipDetail() {}
	
	public CcSalesSlipDetail(String ccrcptCode, String eventDiv, int dealCount, BigDecimal valOfSupply, BigDecimal tax,
			String rcptstmtCode) {
		super();
		this.ccrcptCode = ccrcptCode;
		this.eventDiv = eventDiv;
		this.dealCount = dealCount;
		this.valOfSupply = valOfSupply;
		this.tax = tax;
		this.rcptstmtCode = rcptstmtCode;
	}
	public String getCcrcptCode() {
		return ccrcptCode;
	}
	public void setCcrcptCode(String ccrcptCode) {
		this.ccrcptCode = ccrcptCode;
	}
	public String getEventDiv() {
		return eventDiv;
	}
	public void setEventDiv(String eventDiv) {
		this.eventDiv = eventDiv;
	}
	public int getDealCount() {
		return dealCount;
	}
	public void setDealCount(int dealCount) {
		this.dealCount = dealCount;
	}
	public BigDecimal getValOfSupply() {
		return valOfSupply;
	}
	public void setValOfSupply(BigDecimal valOfSupply) {
		this.valOfSupply = valOfSupply;
	}
	public BigDecimal getTax() {
		return tax;
	}
	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}
	public String getRcptstmtCode() {
		return rcptstmtCode;
	}
	public void setRcptstmtCode(String rcptstmtCode) {
		this.rcptstmtCode = rcptstmtCode;
	}
	@Override
	public String toString() {
		return "CcSalesSlipDetail [ccrcptCode=" + ccrcptCode + ", eventDiv=" + eventDiv + ", dealCount=" + dealCount
				+ ", valOfSupply=" + valOfSupply + ", tax=" + tax + ", rcptstmtCode=" + rcptstmtCode + "]";
	}
	
	
}
