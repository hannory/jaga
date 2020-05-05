package com.kh.jaga.vatDeem.model.vo;

public class Deem {

	private String deemedCode;
	private int yearOfAttr;
	private String vatTerm;
	private String deemedDiv;
	private String deadline;
	private String comCode;
	
	public Deem() {}

	public Deem(String deemedCode, int yearOfAttr, String vatTerm, String deemedDiv, String deadline, String comCode) {
		super();
		this.deemedCode = deemedCode;
		this.yearOfAttr = yearOfAttr;
		this.vatTerm = vatTerm;
		this.deemedDiv = deemedDiv;
		this.deadline = deadline;
		this.comCode = comCode;
	}

	public String getDeemedCode() {
		return deemedCode;
	}

	public void setDeemedCode(String deemedCode) {
		this.deemedCode = deemedCode;
	}

	public int getYearOfAttr() {
		return yearOfAttr;
	}

	public void setYearOfAttr(int yearOfAttr) {
		this.yearOfAttr = yearOfAttr;
	}

	public String getVatTerm() {
		return vatTerm;
	}

	public void setVatTerm(String vatTerm) {
		this.vatTerm = vatTerm;
	}

	public String getDeemedDiv() {
		return deemedDiv;
	}

	public void setDeemedDiv(String deemedDiv) {
		this.deemedDiv = deemedDiv;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	@Override
	public String toString() {
		return "Deem [deemedCode=" + deemedCode + ", yearOfAttr=" + yearOfAttr + ", vatTerm=" + vatTerm + ", deemedDiv="
				+ deemedDiv + ", deadline=" + deadline + ", comCode=" + comCode + "]";
	}
	
	
	
	
	
	
}
