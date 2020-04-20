package com.kh.jaga.finStmt.model.vo;

public class IncomeStmt implements java.io.Serializable {
	private int curEndingInvOfMdse;			//기말상품재고액
	private int curSuppliesExpenses;		//소모품비
	
	public IncomeStmt() {}

	public IncomeStmt(int curEndingInvOfMdse, int curSuppliesExpenses) {
		super();
		this.curEndingInvOfMdse = curEndingInvOfMdse;
		this.curSuppliesExpenses = curSuppliesExpenses;
	}

	public int getCurEndingInvOfMdse() {
		return curEndingInvOfMdse;
	}

	public void setCurEndingInvOfMdse(int curEndingInvOfMdse) {
		this.curEndingInvOfMdse = curEndingInvOfMdse;
	}

	public int getCurSuppliesExpenses() {
		return curSuppliesExpenses;
	}

	public void setCurSuppliesExpenses(int curSuppliesExpenses) {
		this.curSuppliesExpenses = curSuppliesExpenses;
	}

	@Override
	public String toString() {
		return "IncomeStmt [curEndingInvOfMdse=" + curEndingInvOfMdse + ", curSuppliesExpenses=" + curSuppliesExpenses
				+ "]";
	}

	
	
	
}
