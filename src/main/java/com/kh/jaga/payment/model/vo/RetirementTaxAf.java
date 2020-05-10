package com.kh.jaga.payment.model.vo;

import java.math.BigDecimal;

public class RetirementTaxAf {
	private String rtmCode;
	private BigDecimal beforeLongevity;/* 2013 이전 */
	private BigDecimal afterLongevity;/* 2013이후 */
	private BigDecimal calculSum;/* 합계 */
	private String calculCode;/* 10:과세표준안분 20:연평균과세표준 30:환산과세표준 40:환산산출세액 50:연평균산출세액 60:산출세액 */
	
	public RetirementTaxAf() {}

	public RetirementTaxAf(String rtmCode, BigDecimal beforeLongevity, BigDecimal afterLongevity, BigDecimal calculSum,
			String calculCode) {
		super();
		this.rtmCode = rtmCode;
		this.beforeLongevity = beforeLongevity;
		this.afterLongevity = afterLongevity;
		this.calculSum = calculSum;
		this.calculCode = calculCode;
	}

	public String getRtmCode() {
		return rtmCode;
	}

	public void setRtmCode(String rtmCode) {
		this.rtmCode = rtmCode;
	}

	public BigDecimal getBeforeLongevity() {
		return beforeLongevity;
	}

	public void setBeforeLongevity(BigDecimal beforeLongevity) {
		this.beforeLongevity = beforeLongevity;
	}

	public BigDecimal getAfterLongevity() {
		return afterLongevity;
	}

	public void setAfterLongevity(BigDecimal afterLongevity) {
		this.afterLongevity = afterLongevity;
	}

	public BigDecimal getCalculSum() {
		return calculSum;
	}

	public void setCalculSum(BigDecimal calculSum) {
		this.calculSum = calculSum;
	}

	public String getCalculCode() {
		return calculCode;
	}

	public void setCalculCode(String calculCode) {
		this.calculCode = calculCode;
	}

	@Override
	public String toString() {
		return "RetirementTaxAf [rtmCode=" + rtmCode + ", beforeLongevity=" + beforeLongevity + ", afterLongevity="
				+ afterLongevity + ", calculSum=" + calculSum + ", calculCode=" + calculCode + "]";
	}
	
	
}
