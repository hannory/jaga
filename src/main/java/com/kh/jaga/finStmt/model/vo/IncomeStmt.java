package com.kh.jaga.finStmt.model.vo;

public class IncomeStmt implements java.io.Serializable {
	private String comCode;					//회사코드
	private int year;						//연도
	private int term;						//기수
	private String closing;					//마감여부
	private int sum10;
	private int v40100;
	private int val213;
	private int sum30;
	private int sum40;
	private int sum50;
	private int sum100;	
	
//	private int sales;						//매출액
//	private int salesOfMerchandise;			//상품매출
//	private int salesOfFinishedGoods;		//제품매출
//	private int costOfSales;				//매출원가
//	private int costOfMerchandisesSold;		//상품매출원가
//	private int beginningInvOfMerchandise;	//기초상품재고액 
//	private int costOfMerchandisePurchased;	//당기상품매입액
//	private int endingInvOfMerchandise;		//기말상품재고액
//	private int costOfFinishedGoods;		//제품매출원가
//	private int grossProfit;				//매출총이익
//	private int sellingAndAdminExpense;		//판매비와관리비
//	private int consumablesExpenses;		//소모품비
//	private int operatingIncome;			//영업이익
//	private int nonOperatingRevenue;		//영업외수익
//	private int nonOperatingExpense;		//영업외비용
//	private int incomeBeforeIncomeTax;		//소득세차감전이익
//	private int incomeTax;					//소득세
//	private int netIncome;					//당기순이익
		
	public IncomeStmt() {}

	public IncomeStmt(String comCode, int year, int term, String closing, int sum10, int v40100, int val213, int sum30,
		int sum40, int sum50, int sum100) {
		super();
		this.comCode = comCode;
		this.year = year;
		this.term = term;
		this.closing = closing;
		this.sum10 = sum10;
		this.v40100 = v40100;
		this.val213 = val213;
		this.sum30 = sum30;
		this.sum40 = sum40;
		this.sum50 = sum50;
		this.sum100 = sum100;
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

	public String getClosing() {
		return closing;
	}

	public void setClosing(String closing) {
		this.closing = closing;
	}

	public int getSum10() {
		return sum10;
	}

	public void setSum10(int sum10) {
		this.sum10 = sum10;
	}

	public int getVal213() {
		return val213;
	}

	public void setVal213(int val213) {
		this.val213 = val213;
	}

	public int getSum30() {
		return sum30;
	}

	public void setSum30(int sum30) {
		this.sum30 = sum30;
	}

	public int getSum40() {
		return sum40;
	}

	public void setSum40(int sum40) {
		this.sum40 = sum40;
	}

	public int getSum50() {
		return sum50;
	}

	public void setSum50(int sum50) {
		this.sum50 = sum50;
	}

	public int getSum100() {
		return sum100;
	}

	public void setSum100(int sum100) {
		this.sum100 = sum100;
	}
	
	public int getV40100() {
		return v40100;
	}

	public void setV40100(int v40100) {
		this.v40100 = v40100;
	}

	@Override
	public String toString() {
		return "IncomeStmt [comCode=" + comCode + ", year=" + year + ", term=" + term + ", closing=" + closing
				+ ", sum10=" + sum10 + ", v40100=" + v40100 + ", val213=" + val213 + ", sum30=" + sum30 + ", sum40="
				+ sum40 + ", sum50=" + sum50 + ", sum100=" + sum100 + "]";
	}

}
