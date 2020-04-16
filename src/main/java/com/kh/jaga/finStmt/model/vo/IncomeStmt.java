package com.kh.jaga.finStmt.model.vo;

public class IncomeStmt implements java.io.Serializable {
	private int endingInvOfMdse;
	
	public IncomeStmt() {}

	public IncomeStmt(int endingInvOfMdse) {
		super();
		this.endingInvOfMdse = endingInvOfMdse;
	}

	public int getEndingInvOfMdse() {
		return endingInvOfMdse;
	}

	public void setEndingInvOfMdse(int endingInvOfMdse) {
		this.endingInvOfMdse = endingInvOfMdse;
	}

	@Override
	public String toString() {
		return "IncomeStmt [endingInvOfMdse=" + endingInvOfMdse + "]";
	}
	
	
}
