package com.kh.jaga.bugagachi.model.vo;

import java.sql.Date;

public class TnxHis {//거래내역
	private String slipCode; //전표번호
	private String silpDate; //거래날짜
	private String division; //구분(1:현금,2:복지,3:사업,4:신용)
	private String producer; //공급자
	private String proNum;	 //공급자 사업번호
	private String cardmemNum;//카드회원번호
	private int numOfTxn;	//거래건수
	private int valOfSupply; //공급가액
	private int tax; 			//세액
	private String rcptstmtCode;//수령명세서 코드
	
	public TnxHis() {}

	public TnxHis(String slipCode, String silpDate, String division, String producer, String proNum, String cardmemNum,
			int numOfTxn, int valOfSupply, int tax, String rcptstmtCode) {
		super();
		this.slipCode = slipCode;
		this.silpDate = silpDate;
		this.division = division;
		this.producer = producer;
		this.proNum = proNum;
		this.cardmemNum = cardmemNum;
		this.numOfTxn = numOfTxn;
		this.valOfSupply = valOfSupply;
		this.tax = tax;
		this.rcptstmtCode = rcptstmtCode;
	}

	public String getSlipCode() {
		return slipCode;
	}

	public void setSlipCode(String slipCode) {
		this.slipCode = slipCode;
	}

	public String getSilpDate() {
		return silpDate;
	}

	public void setSilpDate(String silpDate) {
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

	public String getProNum() {
		return proNum;
	}

	public void setProNum(String proNum) {
		this.proNum = proNum;
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
				+ producer + ", proNum=" + proNum + ", cardmemNum=" + cardmemNum + ", numOfTxn=" + numOfTxn
				+ ", valOfSupply=" + valOfSupply + ", tax=" + tax + ", rcptstmtCode=" + rcptstmtCode + "]";
	}

	
	
	
	
	
}
