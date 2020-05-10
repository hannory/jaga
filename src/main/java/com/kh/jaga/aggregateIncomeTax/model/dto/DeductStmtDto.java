package com.kh.jaga.aggregateIncomeTax.model.dto;

public class DeductStmtDto {

	private String stmtNo;
	private String comCode;
	private String createDate;
	private String totalDeduct;
	private String yearOfAttr;

	public DeductStmtDto() {}

	public DeductStmtDto(String stmtNo, String comCode, String createDate, String totalDeduct, String yearOfAttr) {
		super();
		this.stmtNo = stmtNo;
		this.comCode = comCode;
		this.createDate = createDate;
		this.totalDeduct = totalDeduct;
		this.yearOfAttr = yearOfAttr;
	}

	public String getStmtNo() {
		return stmtNo;
	}

	public void setStmtNo(String stmtNo) {
		this.stmtNo = stmtNo;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getTotalDeduct() {
		return totalDeduct;
	}

	public void setTotalDeduct(String totalDeduct) {
		this.totalDeduct = totalDeduct;
	}

	public String getYearOfAttr() {
		return yearOfAttr;
	}

	public void setYearOfAttr(String yearOfAttr) {
		this.yearOfAttr = yearOfAttr;
	}

	@Override
	public String toString() {
		return "DeductStmtDto [stmtNo=" + stmtNo + ", comCode=" + comCode + ", createDate=" + createDate
				+ ", totalDeduct=" + totalDeduct + ", yearOfAttr=" + yearOfAttr + "]";
	}

	
	
	
}
