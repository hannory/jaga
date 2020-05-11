package com.kh.jaga.vatDeem.model.vo;

import java.io.Serializable;
import java.math.BigDecimal;

public class DeemOther implements Serializable{

	private String divCode;						//other pk
	private String deemedCode;					//의제매입 코드
	private String deemedType;               	 //추가해야함, 제조업인지 면세인지
	private BigDecimal asmtSum=BigDecimal.ZERO;					//과세표준 합계		
	private BigDecimal asmt1=BigDecimal.ZERO;					//과세표준 제 1기
	private BigDecimal asmt2=BigDecimal.ZERO;					//과세표준 제 2기
	private BigDecimal asmtScheduled=BigDecimal.ZERO;			//과제표준예정분
	private BigDecimal asmtConf=BigDecimal.ZERO;				//과세표준 확정분
	private BigDecimal targetRate=BigDecimal.ZERO;				//대상액한도계산 한도율
	private BigDecimal targetAmt=BigDecimal.ZERO;				//대상액한도계산 한도액
	private BigDecimal currPurAmt=BigDecimal.ZERO;				//당기매입액
	private BigDecimal dedAmt=BigDecimal.ZERO;					//공제대상금액
	private BigDecimal dedtaxRate=BigDecimal.ZERO;			//공제대상세액 공제율
	private BigDecimal dedtaxAmt=BigDecimal.ZERO;				//공제대상세액 공제대상금액
	private BigDecimal dedtaxSum=BigDecimal.ZERO;				//이미공제받은세액 합계
	private BigDecimal dedtaxScheduled=BigDecimal.ZERO;			//이미공제받은 예정신고분
	private BigDecimal dedtaxMonth=BigDecimal.ZERO;				//이미공제받은세액 월별조기분
	private BigDecimal dedtaxTotsum=BigDecimal.ZERO;			//이미공제받은세액 총합계
	private BigDecimal dedtax1=BigDecimal.ZERO;					//이미공제받은세액 제 1기
	private BigDecimal dedtax2Sum=BigDecimal.ZERO;				//이미공제받은세액 제2기 합계
	private BigDecimal dedtax2Scheduled=BigDecimal.ZERO;		//이미공제받은세액 제 2기 예정신고분
	private BigDecimal dedtax2Month=BigDecimal.ZERO;			//이미공제받은세액 제 2기 월별조기분
	private BigDecimal dedTaxrate1=BigDecimal.ZERO;					//공제(납부)할 세액
	private BigDecimal dedTaxLe=BigDecimal.ZERO;					//공제(납부)할 세액
	private BigDecimal year1AmtSum=BigDecimal.ZERO;				//1역년매입액 합계
	private BigDecimal year1Amt1=BigDecimal.ZERO;				//1역년매입액 제1기
	private BigDecimal year1Amt2=BigDecimal.ZERO;				//1역년매입액 제2기

	
	
	public DeemOther() {}



	public DeemOther(String divCode, String deemedCode, String deemedType, BigDecimal asmtSum, BigDecimal asmt1,
			BigDecimal asmt2, BigDecimal asmtScheduled, BigDecimal asmtConf, BigDecimal targetRate,
			BigDecimal targetAmt, BigDecimal currPurAmt, BigDecimal dedAmt, BigDecimal dedtaxRate, BigDecimal dedtaxAmt,
			BigDecimal dedtaxSum, BigDecimal dedtaxScheduled, BigDecimal dedtaxMonth, BigDecimal dedtaxTotsum,
			BigDecimal dedtax1, BigDecimal dedtax2Sum, BigDecimal dedtax2Scheduled, BigDecimal dedtax2Month,
			BigDecimal dedTaxrate1, BigDecimal dedTaxLe, BigDecimal year1AmtSum, BigDecimal year1Amt1,
			BigDecimal year1Amt2) {
		super();
		this.divCode = divCode;
		this.deemedCode = deemedCode;
		this.deemedType = deemedType;
		this.asmtSum = asmtSum;
		this.asmt1 = asmt1;
		this.asmt2 = asmt2;
		this.asmtScheduled = asmtScheduled;
		this.asmtConf = asmtConf;
		this.targetRate = targetRate;
		this.targetAmt = targetAmt;
		this.currPurAmt = currPurAmt;
		this.dedAmt = dedAmt;
		this.dedtaxRate = dedtaxRate;
		this.dedtaxAmt = dedtaxAmt;
		this.dedtaxSum = dedtaxSum;
		this.dedtaxScheduled = dedtaxScheduled;
		this.dedtaxMonth = dedtaxMonth;
		this.dedtaxTotsum = dedtaxTotsum;
		this.dedtax1 = dedtax1;
		this.dedtax2Sum = dedtax2Sum;
		this.dedtax2Scheduled = dedtax2Scheduled;
		this.dedtax2Month = dedtax2Month;
		this.dedTaxrate1 = dedTaxrate1;
		this.dedTaxLe = dedTaxLe;
		this.year1AmtSum = year1AmtSum;
		this.year1Amt1 = year1Amt1;
		this.year1Amt2 = year1Amt2;
	}



	public String getDivCode() {
		return divCode;
	}



	public void setDivCode(String divCode) {
		this.divCode = divCode;
	}



	public String getDeemedCode() {
		return deemedCode;
	}



	public void setDeemedCode(String deemedCode) {
		this.deemedCode = deemedCode;
	}



	public String getDeemedType() {
		return deemedType;
	}



	public void setDeemedType(String deemedType) {
		this.deemedType = deemedType;
	}



	public BigDecimal getAsmtSum() {
		return asmtSum;
	}



	public void setAsmtSum(BigDecimal asmtSum) {
		this.asmtSum = asmtSum;
	}



	public BigDecimal getAsmt1() {
		return asmt1;
	}



	public void setAsmt1(BigDecimal asmt1) {
		this.asmt1 = asmt1;
	}



	public BigDecimal getAsmt2() {
		return asmt2;
	}



	public void setAsmt2(BigDecimal asmt2) {
		this.asmt2 = asmt2;
	}



	public BigDecimal getAsmtScheduled() {
		return asmtScheduled;
	}



	public void setAsmtScheduled(BigDecimal asmtScheduled) {
		this.asmtScheduled = asmtScheduled;
	}



	public BigDecimal getAsmtConf() {
		return asmtConf;
	}



	public void setAsmtConf(BigDecimal asmtConf) {
		this.asmtConf = asmtConf;
	}



	public BigDecimal getTargetRate() {
		return targetRate;
	}



	public void setTargetRate(BigDecimal targetRate) {
		this.targetRate = targetRate;
	}



	public BigDecimal getTargetAmt() {
		return targetAmt;
	}



	public void setTargetAmt(BigDecimal targetAmt) {
		this.targetAmt = targetAmt;
	}



	public BigDecimal getCurrPurAmt() {
		return currPurAmt;
	}



	public void setCurrPurAmt(BigDecimal currPurAmt) {
		this.currPurAmt = currPurAmt;
	}



	public BigDecimal getDedAmt() {
		return dedAmt;
	}



	public void setDedAmt(BigDecimal dedAmt) {
		this.dedAmt = dedAmt;
	}



	public BigDecimal getDedtaxRate() {
		return dedtaxRate;
	}



	public void setDedtaxRate(BigDecimal dedtaxRate) {
		this.dedtaxRate = dedtaxRate;
	}



	public BigDecimal getDedtaxAmt() {
		return dedtaxAmt;
	}



	public void setDedtaxAmt(BigDecimal dedtaxAmt) {
		this.dedtaxAmt = dedtaxAmt;
	}



	public BigDecimal getDedtaxSum() {
		return dedtaxSum;
	}



	public void setDedtaxSum(BigDecimal dedtaxSum) {
		this.dedtaxSum = dedtaxSum;
	}



	public BigDecimal getDedtaxScheduled() {
		return dedtaxScheduled;
	}



	public void setDedtaxScheduled(BigDecimal dedtaxScheduled) {
		this.dedtaxScheduled = dedtaxScheduled;
	}



	public BigDecimal getDedtaxMonth() {
		return dedtaxMonth;
	}



	public void setDedtaxMonth(BigDecimal dedtaxMonth) {
		this.dedtaxMonth = dedtaxMonth;
	}



	public BigDecimal getDedtaxTotsum() {
		return dedtaxTotsum;
	}



	public void setDedtaxTotsum(BigDecimal dedtaxTotsum) {
		this.dedtaxTotsum = dedtaxTotsum;
	}



	public BigDecimal getDedtax1() {
		return dedtax1;
	}



	public void setDedtax1(BigDecimal dedtax1) {
		this.dedtax1 = dedtax1;
	}



	public BigDecimal getDedtax2Sum() {
		return dedtax2Sum;
	}



	public void setDedtax2Sum(BigDecimal dedtax2Sum) {
		this.dedtax2Sum = dedtax2Sum;
	}



	public BigDecimal getDedtax2Scheduled() {
		return dedtax2Scheduled;
	}



	public void setDedtax2Scheduled(BigDecimal dedtax2Scheduled) {
		this.dedtax2Scheduled = dedtax2Scheduled;
	}



	public BigDecimal getDedtax2Month() {
		return dedtax2Month;
	}



	public void setDedtax2Month(BigDecimal dedtax2Month) {
		this.dedtax2Month = dedtax2Month;
	}



	public BigDecimal getDedTaxrate1() {
		return dedTaxrate1;
	}



	public void setDedTaxrate1(BigDecimal dedTaxrate1) {
		this.dedTaxrate1 = dedTaxrate1;
	}



	public BigDecimal getDedTaxLe() {
		return dedTaxLe;
	}



	public void setDedTaxLe(BigDecimal dedTaxLe) {
		this.dedTaxLe = dedTaxLe;
	}



	public BigDecimal getYear1AmtSum() {
		return year1AmtSum;
	}



	public void setYear1AmtSum(BigDecimal year1AmtSum) {
		this.year1AmtSum = year1AmtSum;
	}



	public BigDecimal getYear1Amt1() {
		return year1Amt1;
	}



	public void setYear1Amt1(BigDecimal year1Amt1) {
		this.year1Amt1 = year1Amt1;
	}



	public BigDecimal getYear1Amt2() {
		return year1Amt2;
	}



	public void setYear1Amt2(BigDecimal year1Amt2) {
		this.year1Amt2 = year1Amt2;
	}



	@Override
	public String toString() {
		return "DeemOther [divCode=" + divCode + ", deemedCode=" + deemedCode + ", deemedType=" + deemedType
				+ ", asmtSum=" + asmtSum + ", asmt1=" + asmt1 + ", asmt2=" + asmt2 + ", asmtScheduled=" + asmtScheduled
				+ ", asmtConf=" + asmtConf + ", targetRate=" + targetRate + ", targetAmt=" + targetAmt + ", currPurAmt="
				+ currPurAmt + ", dedAmt=" + dedAmt + ", dedtaxRate=" + dedtaxRate + ", dedtaxAmt=" + dedtaxAmt
				+ ", dedtaxSum=" + dedtaxSum + ", dedtaxScheduled=" + dedtaxScheduled + ", dedtaxMonth=" + dedtaxMonth
				+ ", dedtaxTotsum=" + dedtaxTotsum + ", dedtax1=" + dedtax1 + ", dedtax2Sum=" + dedtax2Sum
				+ ", dedtax2Scheduled=" + dedtax2Scheduled + ", dedtax2Month=" + dedtax2Month + ", dedTaxrate1="
				+ dedTaxrate1 + ", dedTaxLe=" + dedTaxLe + ", year1AmtSum=" + year1AmtSum + ", year1Amt1=" + year1Amt1
				+ ", year1Amt2=" + year1Amt2 + "]";
	}








	
	
}
