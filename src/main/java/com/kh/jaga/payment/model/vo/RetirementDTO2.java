package com.kh.jaga.payment.model.vo;

import java.math.BigDecimal;

public class RetirementDTO2 {
	private String attributeDate;/* 급여귀속일자 */
	private String thisMonthFirstday;
	private String thisMonthLastday;
	private BigDecimal salary;/* 급여 */
	private BigDecimal bonus; /* 상여 */
	private BigDecimal meals;/* 식대 */
	private BigDecimal drivingSubsidies;/* 자가운전보조금 */
	private BigDecimal childcareAllowance;/* 육아수당 */
	private BigDecimal nightpay;/* 야간근로 */
	private BigDecimal monthlypay;/* 월차 */
	private BigDecimal positionpay;/* 직책 */
	private BigDecimal sumThisMonth;
	private String bonusYear;
	private String bonusMonth;
	
	public RetirementDTO2() {}

	public RetirementDTO2(String attributeDate, String thisMonthFirstday, String thisMonthLastday, BigDecimal salary,
			BigDecimal bonus, BigDecimal meals, BigDecimal drivingSubsidies, BigDecimal childcareAllowance,
			BigDecimal nightpay, BigDecimal monthlypay, BigDecimal positionpay, BigDecimal sumThisMonth,
			String bonusYear, String bonusMonth) {
		super();
		this.attributeDate = attributeDate;
		this.thisMonthFirstday = thisMonthFirstday;
		this.thisMonthLastday = thisMonthLastday;
		this.salary = salary;
		this.bonus = bonus;
		this.meals = meals;
		this.drivingSubsidies = drivingSubsidies;
		this.childcareAllowance = childcareAllowance;
		this.nightpay = nightpay;
		this.monthlypay = monthlypay;
		this.positionpay = positionpay;
		this.sumThisMonth = sumThisMonth;
		this.bonusYear = bonusYear;
		this.bonusMonth = bonusMonth;
	}

	public String getAttributeDate() {
		return attributeDate;
	}

	public void setAttributeDate(String attributeDate) {
		this.attributeDate = attributeDate;
	}

	public String getThisMonthFirstday() {
		return thisMonthFirstday;
	}

	public void setThisMonthFirstday(String thisMonthFirstday) {
		this.thisMonthFirstday = thisMonthFirstday;
	}

	public String getThisMonthLastday() {
		return thisMonthLastday;
	}

	public void setThisMonthLastday(String thisMonthLastday) {
		this.thisMonthLastday = thisMonthLastday;
	}

	public BigDecimal getSalary() {
		return salary;
	}

	public void setSalary(BigDecimal salary) {
		this.salary = salary;
	}

	public BigDecimal getBonus() {
		return bonus;
	}

	public void setBonus(BigDecimal bonus) {
		this.bonus = bonus;
	}

	public BigDecimal getMeals() {
		return meals;
	}

	public void setMeals(BigDecimal meals) {
		this.meals = meals;
	}

	public BigDecimal getDrivingSubsidies() {
		return drivingSubsidies;
	}

	public void setDrivingSubsidies(BigDecimal drivingSubsidies) {
		this.drivingSubsidies = drivingSubsidies;
	}

	public BigDecimal getChildcareAllowance() {
		return childcareAllowance;
	}

	public void setChildcareAllowance(BigDecimal childcareAllowance) {
		this.childcareAllowance = childcareAllowance;
	}

	public BigDecimal getNightpay() {
		return nightpay;
	}

	public void setNightpay(BigDecimal nightpay) {
		this.nightpay = nightpay;
	}

	public BigDecimal getMonthlypay() {
		return monthlypay;
	}

	public void setMonthlypay(BigDecimal monthlypay) {
		this.monthlypay = monthlypay;
	}

	public BigDecimal getPositionpay() {
		return positionpay;
	}

	public void setPositionpay(BigDecimal positionpay) {
		this.positionpay = positionpay;
	}

	public BigDecimal getSumThisMonth() {
		return sumThisMonth;
	}

	public void setSumThisMonth(BigDecimal sumThisMonth) {
		this.sumThisMonth = sumThisMonth;
	}

	public String getBonusYear() {
		return bonusYear;
	}

	public void setBonusYear(String bonusYear) {
		this.bonusYear = bonusYear;
	}

	public String getBonusMonth() {
		return bonusMonth;
	}

	public void setBonusMonth(String bonusMonth) {
		this.bonusMonth = bonusMonth;
	}

	@Override
	public String toString() {
		return "RetirementDTO2 [attributeDate=" + attributeDate + ", thisMonthFirstday=" + thisMonthFirstday
				+ ", thisMonthLastday=" + thisMonthLastday + ", salary=" + salary + ", bonus=" + bonus + ", meals="
				+ meals + ", drivingSubsidies=" + drivingSubsidies + ", childcareAllowance=" + childcareAllowance
				+ ", nightpay=" + nightpay + ", monthlypay=" + monthlypay + ", positionpay=" + positionpay
				+ ", sumThisMonth=" + sumThisMonth + ", bonusYear=" + bonusYear + ", bonusMonth=" + bonusMonth + "]";
	}
	
	
}
