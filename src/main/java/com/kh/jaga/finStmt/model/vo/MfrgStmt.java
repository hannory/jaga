package com.kh.jaga.finStmt.model.vo;

public class MfrgStmt implements java.io.Serializable {
	private int mfrgStmtCode;
	private String comCode;
	private int year;
	private int term;
	private String closing;
	private int val13;
	private int sum90;
	
	public MfrgStmt() {}

	public MfrgStmt(int mfrgStmtCode, String comCode, int year, int term, String closing, int val13, int sum90) {
		super();
		this.mfrgStmtCode = mfrgStmtCode;
		this.comCode = comCode;
		this.year = year;
		this.term = term;
		this.closing = closing;
		this.val13 = val13;
		this.sum90 = sum90;
	}

	public int getMfrgStmtCode() {
		return mfrgStmtCode;
	}

	public void setMfrgStmtCode(int mfrgStmtCode) {
		this.mfrgStmtCode = mfrgStmtCode;
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

	public int getVal13() {
		return val13;
	}

	public void setVal13(int val13) {
		this.val13 = val13;
	}

	public int getSum90() {
		return sum90;
	}

	public void setSum90(int sum90) {
		this.sum90 = sum90;
	}

	@Override
	public String toString() {
		return "MfrgStmt [mfrgStmtCode=" + mfrgStmtCode + ", comCode=" + comCode + ", year=" + year + ", term=" + term
				+ ", closing=" + closing + ", val13=" + val13 + ", sum90=" + sum90 + "]";
	}
	
	
}
