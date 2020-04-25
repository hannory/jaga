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
	  
	  
	  public SumTaxInvDetail() {}


	public SumTaxInvDetail(String detaillistCode, String slipDate, String venderCode, String bizRerNum,
			String venderName, int deal_count, BigDecimal valOfSupply, BigDecimal tax, String bossName, String sellWay,
			String sellTarget, String taxinvCode) {
		super();
		this.detaillistCode = detaillistCode;
		this.slipDate = slipDate;
		this.venderCode = venderCode;
		this.bizRegNum = bizRerNum;
		this.venderName = venderName;
		this.dealCount = deal_count;
		this.valOfSupply = valOfSupply;
		this.tax = tax;
		this.bossName = bossName;
		this.sellWay = sellWay;
		this.sellTarget = sellTarget;
		this.taxinvCode = taxinvCode;
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


	public void setSlipDate(String silpDate) {
		this.slipDate = silpDate;
	}


	public String getVenderCode() {
		return venderCode;
	}


	public void setVenderCode(String venderCode) {
		this.venderCode = venderCode;
	}


	public String getBizRerNum() {
		return bizRegNum;
	}


	public void setBizRerNum(String bizRerNum) {
		this.bizRegNum = bizRerNum;
	}


	public String getVenderName() {
		return venderName;
	}


	public void setVenderName(String venderName) {
		this.venderName = venderName;
	}


	public int getDeal_count() {
		return dealCount;
	}


	public void setDeal_count(int deal_count) {
		this.dealCount = deal_count;
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


	@Override
	public String toString() {
		return "SumTaxInvDetail [detaillistCode=" + detaillistCode + ", silpDate=" + slipDate + ", venderCode="
				+ venderCode + ", bizRerNum=" + bizRegNum + ", venderName=" + venderName + ", deal_count=" + dealCount
				+ ", valOfSupply=" + valOfSupply + ", tax=" + tax + ", bossName=" + bossName + ", sellWay=" + sellWay
				+ ", sellTarget=" + sellTarget + ", taxinvCode=" + taxinvCode + "]";
	}
	  
	
	  
	  
}
