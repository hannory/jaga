package com.kh.jaga.vatSumTaxInv.model.vo;

import java.io.Serializable;
import java.math.BigDecimal;

public class SumOfTaxInvDiv implements Serializable{				//매출(입)세금계산서 총합계 1번쨰 표
	  private String divCotCode;			//구분별 내용 코드
	  private int acctCodeCt;				//매출(입) 처수
	  private int dealCount;				//매수
	  private BigDecimal valOfSupply;		//공급자액
	  private BigDecimal tax;				//세액
	  private String purSales;				//매출매입구분
	  private String divisionCode;			//구분코드
	  private String taxinvCode;			//계산서합계표코드
	  public SumOfTaxInvDiv() {}
	public SumOfTaxInvDiv(String divCotCode, int acctCodeCt, int dealCount, BigDecimal valOfSupply, BigDecimal tax,
			String purSales, String divisionCode, String taxinvCode) {
		super();
		this.divCotCode = divCotCode;
		this.acctCodeCt = acctCodeCt;
		this.dealCount = dealCount;
		this.valOfSupply = valOfSupply;
		this.tax = tax;
		this.purSales = purSales;
		this.divisionCode = divisionCode;
		this.taxinvCode = taxinvCode;
	}
	public String getDivCotCode() {
		return divCotCode;
	}
	public void setDivCotCode(String divCotCode) {
		this.divCotCode = divCotCode;
	}
	public int getAcctCodeCt() {
		return acctCodeCt;
	}
	public void setAcctCodeCt(int acctCodeCt) {
		this.acctCodeCt = acctCodeCt;
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
	public String getPurSales() {
		return purSales;
	}
	public void setPurSales(String purSales) {
		this.purSales = purSales;
	}
	public String getDivisionCode() {
		return divisionCode;
	}
	public void setDivisionCode(String divisionCode) {
		this.divisionCode = divisionCode;
	}
	public String getTaxinvCode() {
		return taxinvCode;
	}
	public void setTaxinvCode(String taxinvCode) {
		this.taxinvCode = taxinvCode;
	}
	@Override
	public String toString() {
		return "SumOfTaxInvDiv [divCotCode=" + divCotCode + ", acctCodeCt=" + acctCodeCt + ", dealCount=" + dealCount
				+ ", valOfSupply=" + valOfSupply + ", tax=" + tax + ", purSales=" + purSales + ", divisionCode="
				+ divisionCode + ", taxinvCode=" + taxinvCode + "]";
	}
	
	
	  
	  
}
