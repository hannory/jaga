package com.kh.jaga.vatSumTaxInv.model.vo;

import java.io.Serializable;
import java.math.BigDecimal;

public class SumTaxInvDetail implements Serializable{

	  private String detaillistCode;		//상세리스트 코드
	  private String slipDate;				//거래날짜
	  private String venderCode;			//거래처코드
	  private String bizRegNum;				//사업자등록번호
	  private String venderName;			//거래처 대표자 이름
	  private int dealCount;				//매수
	  private BigDecimal valOfSupply;		//공급가액
	  private BigDecimal tax;				//세액
	  private String bossName;				//대표자이름
	  private String sellWay;				//거래처 업태명
	  private String sellTarget;			//거래처 종목명
	  private String taxinvCode;			//계산서합계표코드
	  private String purSales;				//계산서 매출매입 구분
	  
	  
	  public SumTaxInvDetail() {}


	public SumTaxInvDetail(String detaillistCode, String slipDate, String venderCode, String bizRegNum,
			String venderName, int dealCount, BigDecimal valOfSupply, BigDecimal tax, String bossName, String sellWay,
			String sellTarget, String taxinvCode, String purSales) {
		super();
		this.detaillistCode = detaillistCode;
		this.slipDate = slipDate;
		this.venderCode = venderCode;
		this.bizRegNum = bizRegNum;
		this.venderName = venderName;
		this.dealCount = dealCount;
		this.valOfSupply = valOfSupply;
		this.tax = tax;
		this.bossName = bossName;
		this.sellWay = sellWay;
		this.sellTarget = sellTarget;
		this.taxinvCode = taxinvCode;
		this.purSales = purSales;
	}


	public String getDetaillistCode() {
		return detaillistCode;
	}


	public void setDetaillistCode(String detaillistCode) {
		this.detaillistCode = detaillistCode;
	}


	public String getSlipDate() {
		return slipDate;
	}


	public void setSlipDate(String slipDate) {
		this.slipDate = slipDate;
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


	public String getVenderName() {
		return venderName;
	}


	public void setVenderName(String venderName) {
		this.venderName = venderName;
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


	public String getBossName() {
		return bossName;
	}


	public void setBossName(String bossName) {
		this.bossName = bossName;
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


	public String getTaxinvCode() {
		return taxinvCode;
	}


	public void setTaxinvCode(String taxinvCode) {
		this.taxinvCode = taxinvCode;
	}


	public String getPurSales() {
		return purSales;
	}


	public void setPurSales(String purSales) {
		this.purSales = purSales;
	}


	@Override
	public String toString() {
		return "SumTaxInvDetail [detaillistCode=" + detaillistCode + ", slipDate=" + slipDate + ", venderCode="
				+ venderCode + ", bizRegNum=" + bizRegNum + ", venderName=" + venderName + ", dealCount=" + dealCount
				+ ", valOfSupply=" + valOfSupply + ", tax=" + tax + ", bossName=" + bossName + ", sellWay=" + sellWay
				+ ", sellTarget=" + sellTarget + ", taxinvCode=" + taxinvCode + ", purSales=" + purSales + "]";
	}


	
	  
	  
}
