package com.kh.jaga.bugagachi.model.vo;

import java.util.ArrayList;
import java.util.List;

public class CcSalesSlip {
	private String rcptstmtCode; //수령명세서 코드
	private int yearOfAttr;		 //귀속연도
	private String termDiv;		 //기수구분
	private String deadline;		//마감여부
	private String comCode;			//회사코드
	private List<CcSalesSlipDetail> cssDetail; //CcSalesSlipDetail
	private List<TnxHis> cssTnxHis; //TnxHis
	
	public CcSalesSlip() {
		cssDetail=new ArrayList<CcSalesSlipDetail>();
		cssTnxHis=new ArrayList<TnxHis>();
	}

	public CcSalesSlip(String rcptstmtCode, int yearOfAttr, String termDiv, String deadline, String comCode,
			List<CcSalesSlipDetail> cssDetail, List<TnxHis> cssTnxHis) {
		super();
		this.rcptstmtCode = rcptstmtCode;
		this.yearOfAttr = yearOfAttr;
		this.termDiv = termDiv;
		this.deadline = deadline;
		this.comCode = comCode;
		this.cssDetail = cssDetail;
		this.cssTnxHis = cssTnxHis;
	}

	public String getRcptstmtCode() {
		return rcptstmtCode;
	}

	public void setRcptstmtCode(String rcptstmtCode) {
		this.rcptstmtCode = rcptstmtCode;
	}

	public int getYearOfAttr() {
		return yearOfAttr;
	}

	public void setYearOfAttr(int yearOfAttr) {
		this.yearOfAttr = yearOfAttr;
	}

	public String getTermDiv() {
		return termDiv;
	}

	public void setTermDiv(String termDiv) {
		this.termDiv = termDiv;
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

	public List<CcSalesSlipDetail> getCssDetail() {
		return cssDetail;
	}

	public void setCssDetail(List<CcSalesSlipDetail> cssDetail) {
		this.cssDetail = cssDetail;
	}

	public List<TnxHis> getCssTnxHis() {
		return cssTnxHis;
	}

	public void setCssTnxHis(List<TnxHis> cssTnxHis) {
		this.cssTnxHis = cssTnxHis;
	}

	@Override
	public String toString() {
		return "CcSalesSlip [rcptstmtCode=" + rcptstmtCode + ", yearOfAttr=" + yearOfAttr + ", termDiv=" + termDiv
				+ ", deadline=" + deadline + ", comCode=" + comCode + ", cssDetail=" + cssDetail + ", cssTnxHis="
				+ cssTnxHis + "]";
	}
	
	
}
