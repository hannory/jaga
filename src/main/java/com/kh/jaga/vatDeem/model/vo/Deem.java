package com.kh.jaga.vatDeem.model.vo;

import java.io.Serializable;

public class Deem implements Serializable{

	private String deemedCode;		//의제매입 코드
	private int yearOfAttr;			//귀속년월
	private String vatTerm;			//부가가치세 기수( 1기확정, 2기확정)
	private String deemedDiv;		//의제매입세액 구분(매입시기 집중, 제조업면세 농산물)
	private String deadline;		//마감여부
	private String comCode;			//회사코드
	
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
