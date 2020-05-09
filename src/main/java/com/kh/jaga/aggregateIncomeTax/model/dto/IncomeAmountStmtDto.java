package com.kh.jaga.aggregateIncomeTax.model.dto;

public class IncomeAmountStmtDto {
	
	private String type;		//신고유형
	private String duty;		//기장의무
	
	private String v101;		//소득구분코드
	private String v102;		//
	private String v103;		//상호 또는 법인명
	private String v104;		//사업자 등록번호
	private String v105;		//주민등록번호
	private String v106;		//
	private String v107;		//주업종코드
	private String v108;		//총수입금액
	private String v109;		//필요경비
	private String v110;		//소득금액
	private String v111;		//원천징수액 소득세
	private String v112;		//이월결손금 공제 여부
	private String v113;		//공동사업장 여부
	
	private String v201;		//
	private String v202;		//
	private String v203;		//
	private String v204;		//
	private String v205;		//
	private String v206;		//
	private String v207;		//
	private String v208;		//
	private String v209;		//
	private String v210;		//
	private String v211;		//
	private String v212;		//
	private String v213;		//
	
	private String documentNo;
	private String yearOfAttr;	//귀속년도
	private String incomeTypeCode;
	private String totalIncome;
	private String necessaryExpense;
	private String incomeEtc;
	private String taxForIncome;
	private String carryForward;
	private String commonBiz;
	private String incomeForMinTax;
	private String startDate;
	private String endDate;
	private String location;
	private String domestic;
	private String modifyDate;
	private String bookKeepingCode;
	private String reportCode;
	private String comCode;
	
	public IncomeAmountStmtDto() {}

	public IncomeAmountStmtDto(String type, String duty, String v101, String v102, String v103, String v104,
			String v105, String v106, String v107, String v108, String v109, String v110, String v111, String v112,
			String v113, String v201, String v202, String v203, String v204, String v205, String v206, String v207,
			String v208, String v209, String v210, String v211, String v212, String v213, String documentNo,
			String yearOfAttr, String incomeTypeCode, String totalIncome, String necessaryExpense, String incomeEtc,
			String taxForIncome, String carryForward, String commonBiz, String incomeForMinTax, String startDate,
			String endDate, String location, String domestic, String modifyDate, String bookKeepingCode,
			String reportCode, String comCode) {
		super();
		this.type = type;
		this.duty = duty;
		this.v101 = v101;
		this.v102 = v102;
		this.v103 = v103;
		this.v104 = v104;
		this.v105 = v105;
		this.v106 = v106;
		this.v107 = v107;
		this.v108 = v108;
		this.v109 = v109;
		this.v110 = v110;
		this.v111 = v111;
		this.v112 = v112;
		this.v113 = v113;
		this.v201 = v201;
		this.v202 = v202;
		this.v203 = v203;
		this.v204 = v204;
		this.v205 = v205;
		this.v206 = v206;
		this.v207 = v207;
		this.v208 = v208;
		this.v209 = v209;
		this.v210 = v210;
		this.v211 = v211;
		this.v212 = v212;
		this.v213 = v213;
		this.documentNo = documentNo;
		this.yearOfAttr = yearOfAttr;
		this.incomeTypeCode = incomeTypeCode;
		this.totalIncome = totalIncome;
		this.necessaryExpense = necessaryExpense;
		this.incomeEtc = incomeEtc;
		this.taxForIncome = taxForIncome;
		this.carryForward = carryForward;
		this.commonBiz = commonBiz;
		this.incomeForMinTax = incomeForMinTax;
		this.startDate = startDate;
		this.endDate = endDate;
		this.location = location;
		this.domestic = domestic;
		this.modifyDate = modifyDate;
		this.bookKeepingCode = bookKeepingCode;
		this.reportCode = reportCode;
		this.comCode = comCode;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getV101() {
		return v101;
	}

	public void setV101(String v101) {
		this.v101 = v101;
	}

	public String getV102() {
		return v102;
	}

	public void setV102(String v102) {
		this.v102 = v102;
	}

	public String getV103() {
		return v103;
	}

	public void setV103(String v103) {
		this.v103 = v103;
	}

	public String getV104() {
		return v104;
	}

	public void setV104(String v104) {
		this.v104 = v104;
	}

	public String getV105() {
		return v105;
	}

	public void setV105(String v105) {
		this.v105 = v105;
	}

	public String getV106() {
		return v106;
	}

	public void setV106(String v106) {
		this.v106 = v106;
	}

	public String getV107() {
		return v107;
	}

	public void setV107(String v107) {
		this.v107 = v107;
	}

	public String getV108() {
		return v108;
	}

	public void setV108(String v108) {
		this.v108 = v108;
	}

	public String getV109() {
		return v109;
	}

	public void setV109(String v109) {
		this.v109 = v109;
	}

	public String getV110() {
		return v110;
	}

	public void setV110(String v110) {
		this.v110 = v110;
	}

	public String getV111() {
		return v111;
	}

	public void setV111(String v111) {
		this.v111 = v111;
	}

	public String getV112() {
		return v112;
	}

	public void setV112(String v112) {
		this.v112 = v112;
	}

	public String getV113() {
		return v113;
	}

	public void setV113(String v113) {
		this.v113 = v113;
	}

	public String getV201() {
		return v201;
	}

	public void setV201(String v201) {
		this.v201 = v201;
	}

	public String getV202() {
		return v202;
	}

	public void setV202(String v202) {
		this.v202 = v202;
	}

	public String getV203() {
		return v203;
	}

	public void setV203(String v203) {
		this.v203 = v203;
	}

	public String getV204() {
		return v204;
	}

	public void setV204(String v204) {
		this.v204 = v204;
	}

	public String getV205() {
		return v205;
	}

	public void setV205(String v205) {
		this.v205 = v205;
	}

	public String getV206() {
		return v206;
	}

	public void setV206(String v206) {
		this.v206 = v206;
	}

	public String getV207() {
		return v207;
	}

	public void setV207(String v207) {
		this.v207 = v207;
	}

	public String getV208() {
		return v208;
	}

	public void setV208(String v208) {
		this.v208 = v208;
	}

	public String getV209() {
		return v209;
	}

	public void setV209(String v209) {
		this.v209 = v209;
	}

	public String getV210() {
		return v210;
	}

	public void setV210(String v210) {
		this.v210 = v210;
	}

	public String getV211() {
		return v211;
	}

	public void setV211(String v211) {
		this.v211 = v211;
	}

	public String getV212() {
		return v212;
	}

	public void setV212(String v212) {
		this.v212 = v212;
	}

	public String getV213() {
		return v213;
	}

	public void setV213(String v213) {
		this.v213 = v213;
	}

	public String getDocumentNo() {
		return documentNo;
	}

	public void setDocumentNo(String documentNo) {
		this.documentNo = documentNo;
	}

	public String getYearOfAttr() {
		return yearOfAttr;
	}

	public void setYearOfAttr(String yearOfAttr) {
		this.yearOfAttr = yearOfAttr;
	}

	public String getIncomeTypeCode() {
		return incomeTypeCode;
	}

	public void setIncomeTypeCode(String incomeTypeCode) {
		this.incomeTypeCode = incomeTypeCode;
	}

	public String getTotalIncome() {
		return totalIncome;
	}

	public void setTotalIncome(String totalIncome) {
		this.totalIncome = totalIncome;
	}

	public String getNecessaryExpense() {
		return necessaryExpense;
	}

	public void setNecessaryExpense(String necessaryExpense) {
		this.necessaryExpense = necessaryExpense;
	}

	public String getIncomeEtc() {
		return incomeEtc;
	}

	public void setIncomeEtc(String incomeEtc) {
		this.incomeEtc = incomeEtc;
	}

	public String getTaxForIncome() {
		return taxForIncome;
	}

	public void setTaxForIncome(String taxForIncome) {
		this.taxForIncome = taxForIncome;
	}

	public String getCarryForward() {
		return carryForward;
	}

	public void setCarryForward(String carryForward) {
		this.carryForward = carryForward;
	}

	public String getCommonBiz() {
		return commonBiz;
	}

	public void setCommonBiz(String commonBiz) {
		this.commonBiz = commonBiz;
	}

	public String getIncomeForMinTax() {
		return incomeForMinTax;
	}

	public void setIncomeForMinTax(String incomeForMinTax) {
		this.incomeForMinTax = incomeForMinTax;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDomestic() {
		return domestic;
	}

	public void setDomestic(String domestic) {
		this.domestic = domestic;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getBookKeepingCode() {
		return bookKeepingCode;
	}

	public void setBookKeepingCode(String bookKeepingCode) {
		this.bookKeepingCode = bookKeepingCode;
	}

	public String getReportCode() {
		return reportCode;
	}

	public void setReportCode(String reportCode) {
		this.reportCode = reportCode;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	@Override
	public String toString() {
		return "IncomeAmountStmtDto [type=" + type + ", duty=" + duty + ", v101=" + v101 + ", v102=" + v102 + ", v103="
				+ v103 + ", v104=" + v104 + ", v105=" + v105 + ", v106=" + v106 + ", v107=" + v107 + ", v108=" + v108
				+ ", v109=" + v109 + ", v110=" + v110 + ", v111=" + v111 + ", v112=" + v112 + ", v113=" + v113
				+ ", v201=" + v201 + ", v202=" + v202 + ", v203=" + v203 + ", v204=" + v204 + ", v205=" + v205
				+ ", v206=" + v206 + ", v207=" + v207 + ", v208=" + v208 + ", v209=" + v209 + ", v210=" + v210
				+ ", v211=" + v211 + ", v212=" + v212 + ", v213=" + v213 + ", documentNo=" + documentNo
				+ ", yearOfAttr=" + yearOfAttr + ", incomeTypeCode=" + incomeTypeCode + ", totalIncome=" + totalIncome
				+ ", necessaryExpense=" + necessaryExpense + ", incomeEtc=" + incomeEtc + ", taxForIncome="
				+ taxForIncome + ", carryForward=" + carryForward + ", commonBiz=" + commonBiz + ", incomeForMinTax="
				+ incomeForMinTax + ", startDate=" + startDate + ", endDate=" + endDate + ", location=" + location
				+ ", domestic=" + domestic + ", modifyDate=" + modifyDate + ", bookKeepingCode=" + bookKeepingCode
				+ ", reportCode=" + reportCode + ", comCode=" + comCode + "]";
	}
	
	
	
	

	

	
	
}
