package com.kh.jaga.vatSumTaxInv.model.vo;

import java.io.Serializable;
import java.util.List;

public class SumOfTaxInvDto implements Serializable{
	private String taxinvCode;		//계산서합계표코드
	private String tabletaxDiv;		//계산서 구분
	private int yearOfAttr;			//귀속연도
	private String reportTerm;		//기수
	private String reportType;		//신고종류
	private String purSales;		//매출매입구분
	private String deadline;		//마감여부
	private String comCode;			//회사코드
	private List<SumOfTaxInvDiv> SumOfTaxInvDivSales;	//세금계산서총합계_구분별 내용_매출
	private List<SumOfTaxInvDiv> SumOfTaxInvDivPur;		//세금계산서총합계_구분별 내용_매입
	private List<SumTaxInvDetail> SumTaxInvDetailSales;	//(세금)계산서합계표_세부사항_매출
	private List<SumTaxInvDetail> SumTaxInvDetailPur;	//(세금)계산서합계표_세부사항_매입
	
	public SumOfTaxInvDto() {}

	public SumOfTaxInvDto(String taxinvCode, String tabletaxDiv, int yearOfAttr, String reportTerm, String reportType,
			String purSales, String deadline, String comCode, List<SumOfTaxInvDiv> sumOfTaxInvDivSales,
			List<SumOfTaxInvDiv> sumOfTaxInvDivPur, List<SumTaxInvDetail> sumTaxInvDetailSales,
			List<SumTaxInvDetail> sumTaxInvDetailPur) {
		super();
		this.taxinvCode = taxinvCode;
		this.tabletaxDiv = tabletaxDiv;
		this.yearOfAttr = yearOfAttr;
		this.reportTerm = reportTerm;
		this.reportType = reportType;
		this.purSales = purSales;
		this.deadline = deadline;
		this.comCode = comCode;
		SumOfTaxInvDivSales = sumOfTaxInvDivSales;
		SumOfTaxInvDivPur = sumOfTaxInvDivPur;
		SumTaxInvDetailSales = sumTaxInvDetailSales;
		SumTaxInvDetailPur = sumTaxInvDetailPur;
	}

	public String getTaxinvCode() {
		return taxinvCode;
	}

	public void setTaxinvCode(String taxinvCode) {
		this.taxinvCode = taxinvCode;
	}

	public String getTabletaxDiv() {
		return tabletaxDiv;
	}

	public void setTabletaxDiv(String tabletaxDiv) {
		this.tabletaxDiv = tabletaxDiv;
	}

	public int getYearOfAttr() {
		return yearOfAttr;
	}

	public void setYearOfAttr(int yearOfAttr) {
		this.yearOfAttr = yearOfAttr;
	}

	public String getReportTerm() {
		return reportTerm;
	}

	public void setReportTerm(String reportTerm) {
		this.reportTerm = reportTerm;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public String getPurSales() {
		return purSales;
	}

	public void setPurSales(String purSales) {
		this.purSales = purSales;
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

	public List<SumOfTaxInvDiv> getSumOfTaxInvDivSales() {
		return SumOfTaxInvDivSales;
	}

	public void setSumOfTaxInvDivSales(List<SumOfTaxInvDiv> sumOfTaxInvDivSales) {
		SumOfTaxInvDivSales = sumOfTaxInvDivSales;
	}

	public List<SumOfTaxInvDiv> getSumOfTaxInvDivPur() {
		return SumOfTaxInvDivPur;
	}

	public void setSumOfTaxInvDivPur(List<SumOfTaxInvDiv> sumOfTaxInvDivPur) {
		SumOfTaxInvDivPur = sumOfTaxInvDivPur;
	}

	public List<SumTaxInvDetail> getSumTaxInvDetailSales() {
		return SumTaxInvDetailSales;
	}

	public void setSumTaxInvDetailSales(List<SumTaxInvDetail> sumTaxInvDetailSales) {
		SumTaxInvDetailSales = sumTaxInvDetailSales;
	}

	public List<SumTaxInvDetail> getSumTaxInvDetailPur() {
		return SumTaxInvDetailPur;
	}

	public void setSumTaxInvDetailPur(List<SumTaxInvDetail> sumTaxInvDetailPur) {
		SumTaxInvDetailPur = sumTaxInvDetailPur;
	}

	@Override
	public String toString() {
		return "SumOfTaxInvDto [taxinvCode=" + taxinvCode + ", tabletaxDiv=" + tabletaxDiv + ", yearOfAttr="
				+ yearOfAttr + ", reportTerm=" + reportTerm + ", reportType=" + reportType + ", purSales=" + purSales
				+ ", deadline=" + deadline + ", comCode=" + comCode + ", SumOfTaxInvDivSales=" + SumOfTaxInvDivSales
				+ ", SumOfTaxInvDivPur=" + SumOfTaxInvDivPur + ", SumTaxInvDetailSales=" + SumTaxInvDetailSales
				+ ", SumTaxInvDetailPur=" + SumTaxInvDetailPur + "]";
	}
	
	
	
}
