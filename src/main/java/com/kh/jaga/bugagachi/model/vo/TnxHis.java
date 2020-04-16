package com.kh.jaga.bugagachi.model.vo;

import java.sql.Date;

public class TnxHis {//거래내역
	private String slipCode;
	private Date silpDate;
	private String division;
	private String producer;
	private String cardmemNum;
	private int numOfTxn;
	private int valOfSupply;
	private int tax;
	private String rcptstmtCode;
	
	public TnxHis() {}

	public TnxHis(String slipCode, Date silpDate, String division, String producer, String cardmemNum, int numOfTxn,
			int valOfSupply, int tax, String rcptstmtCode) {
		super();
		this.slipCode = slipCode;           //전표번호
		this.silpDate = silpDate; 			//거래날짜
		this.division = division;			//구분(1:현금,2:복지,3:사업,4:신용)
		this.producer = producer;			//공급자
		this.cardmemNum = cardmemNum;		//카드회원번호
		this.numOfTxn = numOfTxn;			//거래건수
		this.valOfSupply = valOfSupply;		//공급가액
		this.tax = tax;						//세액
		this.rcptstmtCode = rcptstmtCode;	//수령명세서 코드
	}

	public String getSlipCode() {
		return slipCode;
	}

	public void setSlipCode(String slipCode) {
		this.slipCode = slipCode;
	}

	public Date getSilpDate() {
		return silpDate;
	}

	public void setSilpDate(Date silpDate) {
		this.silpDate = silpDate;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public String getCardmemNum() {
		return cardmemNum;
	}

	public void setCardmemNum(String cardmemNum) {
		this.cardmemNum = cardmemNum;
	}

	public int getNumOfTxn() {
		return numOfTxn;
	}

	public void setNumOfTxn(int numOfTxn) {
		this.numOfTxn = numOfTxn;
	}

	public int getValOfSupply() {
		return valOfSupply;
	}

	public void setValOfSupply(int valOfSupply) {
		this.valOfSupply = valOfSupply;
	}

	public int getTax() {
		return tax;
	}

	public void setTax(int tax) {
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
		return "TnxHis [slipCode=" + slipCode + ", silpDate=" + silpDate + ", division=" + division + ", producer="
				+ producer + ", cardmemNum=" + cardmemNum + ", numOfTxn=" + numOfTxn + ", valOfSupply=" + valOfSupply
				+ ", tax=" + tax + ", rcptstmtCode=" + rcptstmtCode + "]";
	}
	
	
	
	
}
