package com.kh.jaga.finStmt.model.vo;

public class StmtDate implements java.io.Serializable {
	private int year;
	private int month;
	
	public StmtDate() {}

	public StmtDate(int year, int month) {
		super();
		this.year = year;
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	@Override
	public String toString() {
		return "StmtDate [year=" + year + ", month=" + month + "]";
	};
	
	
}
