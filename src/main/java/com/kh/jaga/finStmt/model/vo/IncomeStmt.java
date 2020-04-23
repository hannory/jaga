package com.kh.jaga.finStmt.model.vo;

public class IncomeStmt implements java.io.Serializable {
	private String comCode;					//회사코드
	private int year;						//연도
	private int term;						//기수
	private int sales;						//매출액
	private int salesOfMerchandise;			//상품매출
	private int salesOfFinishedGoods;		//제품매출
	private int costOfSales;				//매출원가
	private int costOfMerchandisesSold;		//상품매출원가
	private int beginningInvOfMerchandise;	//기초상품재고액 
	private int costOfMerchandisePurchased;	//당기상품매입액
	private int endingInvOfMerchandise;		//기말상품재고액
	private int costOfFinishedGoods;		//제품매출원가
	private int grossProfit;				//매출총이익
	private int sellingAndAdminExpense;		//판매비와관리비
	private int consumablesExpenses;		//소모품비
	private int operatingIncome;			//영업이익
	private int nonOperatingRevenue;		//영업외수익
	private int nonOperatingExpense;		//영업외비용
	private int incomeBeforeIncomeTax;		//소득세차감전이익
	private int incomeTax;					//소득세
	private int netIncome;					//당기순이익
		
	public IncomeStmt() {}

	public IncomeStmt(String comCode, int year, int term, int sales, int salesOfMerchandise, int salesOfFinishedGoods,
			int costOfSales, int costOfMerchandisesSold, int beginningInvOfMerchandise, int costOfMerchandisePurchased,
			int endingInvOfMerchandise, int costOfFinishedGoods, int grossProfit, int sellingAndAdminExpense,
			int consumablesExpenses, int operatingIncome, int nonOperatingRevenue, int nonOperatingExpense,
			int incomeBeforeIncomeTax, int incomeTax, int netIncome) {
		super();
		this.comCode = comCode;
		this.year = year;
		this.term = term;
		this.sales = sales;
		this.salesOfMerchandise = salesOfMerchandise;
		this.salesOfFinishedGoods = salesOfFinishedGoods;
		this.costOfSales = costOfSales;
		this.costOfMerchandisesSold = costOfMerchandisesSold;
		this.beginningInvOfMerchandise = beginningInvOfMerchandise;
		this.costOfMerchandisePurchased = costOfMerchandisePurchased;
		this.endingInvOfMerchandise = endingInvOfMerchandise;
		this.costOfFinishedGoods = costOfFinishedGoods;
		this.grossProfit = grossProfit;
		this.sellingAndAdminExpense = sellingAndAdminExpense;
		this.consumablesExpenses = consumablesExpenses;
		this.operatingIncome = operatingIncome;
		this.nonOperatingRevenue = nonOperatingRevenue;
		this.nonOperatingExpense = nonOperatingExpense;
		this.incomeBeforeIncomeTax = incomeBeforeIncomeTax;
		this.incomeTax = incomeTax;
		this.netIncome = netIncome;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getTerm() {
		return term;
	}

	public void setTerm(int term) {
		this.term = term;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getSalesOfMerchandise() {
		return salesOfMerchandise;
	}

	public void setSalesOfMerchandise(int salesOfMerchandise) {
		this.salesOfMerchandise = salesOfMerchandise;
	}

	public int getSalesOfFinishedGoods() {
		return salesOfFinishedGoods;
	}

	public void setSalesOfFinishedGoods(int salesOfFinishedGoods) {
		this.salesOfFinishedGoods = salesOfFinishedGoods;
	}

	public int getCostOfSales() {
		return costOfSales;
	}

	public void setCostOfSales(int costOfSales) {
		this.costOfSales = costOfSales;
	}

	public int getCostOfMerchandisesSold() {
		return costOfMerchandisesSold;
	}

	public void setCostOfMerchandisesSold(int costOfMerchandisesSold) {
		this.costOfMerchandisesSold = costOfMerchandisesSold;
	}

	public int getBeginningInvOfMerchandise() {
		return beginningInvOfMerchandise;
	}

	public void setBeginningInvOfMerchandise(int beginningInvOfMerchandise) {
		this.beginningInvOfMerchandise = beginningInvOfMerchandise;
	}

	public int getCostOfMerchandisePurchased() {
		return costOfMerchandisePurchased;
	}

	public void setCostOfMerchandisePurchased(int costOfMerchandisePurchased) {
		this.costOfMerchandisePurchased = costOfMerchandisePurchased;
	}

	public int getEndingInvOfMerchandise() {
		return endingInvOfMerchandise;
	}

	public void setEndingInvOfMerchandise(int endingInvOfMerchandise) {
		this.endingInvOfMerchandise = endingInvOfMerchandise;
	}

	public int getCostOfFinishedGoods() {
		return costOfFinishedGoods;
	}

	public void setCostOfFinishedGoods(int costOfFinishedGoods) {
		this.costOfFinishedGoods = costOfFinishedGoods;
	}

	public int getGrossProfit() {
		return grossProfit;
	}

	public void setGrossProfit(int grossProfit) {
		this.grossProfit = grossProfit;
	}

	public int getSellingAndAdminExpense() {
		return sellingAndAdminExpense;
	}

	public void setSellingAndAdminExpense(int sellingAndAdminExpense) {
		this.sellingAndAdminExpense = sellingAndAdminExpense;
	}

	public int getConsumablesExpenses() {
		return consumablesExpenses;
	}

	public void setConsumablesExpenses(int consumablesExpenses) {
		this.consumablesExpenses = consumablesExpenses;
	}

	public int getOperatingIncome() {
		return operatingIncome;
	}

	public void setOperatingIncome(int operatingIncome) {
		this.operatingIncome = operatingIncome;
	}

	public int getNonOperatingRevenue() {
		return nonOperatingRevenue;
	}

	public void setNonOperatingRevenue(int nonOperatingRevenue) {
		this.nonOperatingRevenue = nonOperatingRevenue;
	}

	public int getNonOperatingExpense() {
		return nonOperatingExpense;
	}

	public void setNonOperatingExpense(int nonOperatingExpense) {
		this.nonOperatingExpense = nonOperatingExpense;
	}

	public int getIncomeBeforeIncomeTax() {
		return incomeBeforeIncomeTax;
	}

	public void setIncomeBeforeIncomeTax(int incomeBeforeIncomeTax) {
		this.incomeBeforeIncomeTax = incomeBeforeIncomeTax;
	}

	public int getIncomeTax() {
		return incomeTax;
	}

	public void setIncomeTax(int incomeTax) {
		this.incomeTax = incomeTax;
	}

	public int getNetIncome() {
		return netIncome;
	}

	public void setNetIncome(int netIncome) {
		this.netIncome = netIncome;
	}

	@Override
	public String toString() {
		return "IncomeStmt [comCode=" + comCode + ", year=" + year + ", term=" + term + ", sales=" + sales
				+ ", salesOfMerchandise=" + salesOfMerchandise + ", salesOfFinishedGoods=" + salesOfFinishedGoods
				+ ", costOfSales=" + costOfSales + ", costOfMerchandisesSold=" + costOfMerchandisesSold
				+ ", beginningInvOfMerchandise=" + beginningInvOfMerchandise + ", costOfMerchandisePurchased="
				+ costOfMerchandisePurchased + ", endingInvOfMerchandise=" + endingInvOfMerchandise
				+ ", costOfFinishedGoods=" + costOfFinishedGoods + ", grossProfit=" + grossProfit
				+ ", sellingAndAdminExpense=" + sellingAndAdminExpense + ", consumablesExpenses=" + consumablesExpenses
				+ ", operatingIncome=" + operatingIncome + ", nonOperatingRevenue=" + nonOperatingRevenue
				+ ", nonOperatingExpense=" + nonOperatingExpense + ", incomeBeforeIncomeTax=" + incomeBeforeIncomeTax
				+ ", incomeTax=" + incomeTax + ", netIncome=" + netIncome + "]";
	}

	
}
