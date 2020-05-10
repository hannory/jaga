package com.kh.jaga.finStmt.model.vo;

public class IncomeStmt implements java.io.Serializable {
	private String comCode;			//회사코드
	private int year;				//연도
	private int term;				//기수
	private String closing;			//마감여부
	
	private int sum10;				//매출액
	private int v40100;				//상품매출
	private int sum20;				//매출원가 
	private int val211;				//기초상품재고액
	private int val213;				//기말상품재고액
	private int val221;				//기초제품재고액
	private int val223;				//기말제품재고액
	private int sum30;				//매출총이익
	private int sum40;				//판매비와관리비
	private int sum50;				//영업이익
	private int sum100;				//당기순이익

	private int lastSum10;			//전기 매출액
	private int lastSum20;			//전기 매출원가
	private int lastVal211;			//전기 기초상품재고액
	private int lastVal213;			//전기 기말상품재고액
	private int lastVal221;			//전기 기초제품재고액
	private int lastVal223;			//전기 기말제품제고액
	private int lastSum30;			//전기 매출총이익
	private int lastSum40;			//전기 판매비와관리비
	private int lastSum50;			//전기 영업이익
	private int lastSum60;			//전기 영업외수익
	private int lastSum70;			//전기 영업외비용
	private int lastSum80;			//전기 소득세차감전이익
	private int lastSum90;			//전기 소득세등
	private int lastSum100;			//전기 당기순이익
	
	public IncomeStmt() {}

	public IncomeStmt(String comCode, int year, int term, String closing, int sum10, int v40100, int sum20, int val211,
			int val213, int val221, int val223, int sum30, int sum40, int sum50, int sum100, int lastSum10,
			int lastSum20, int lastVal211, int lastVal213, int lastVal221, int lastVal223, int lastSum30, int lastSum40,
			int lastSum50, int lastSum60, int lastSum70, int lastSum80, int lastSum90, int lastSum100) {
		super();
		this.comCode = comCode;
		this.year = year;
		this.term = term;
		this.closing = closing;
		this.sum10 = sum10;
		this.v40100 = v40100;
		this.sum20 = sum20;
		this.val211 = val211;
		this.val213 = val213;
		this.val221 = val221;
		this.val223 = val223;
		this.sum30 = sum30;
		this.sum40 = sum40;
		this.sum50 = sum50;
		this.sum100 = sum100;
		this.lastSum10 = lastSum10;
		this.lastSum20 = lastSum20;
		this.lastVal211 = lastVal211;
		this.lastVal213 = lastVal213;
		this.lastVal221 = lastVal221;
		this.lastVal223 = lastVal223;
		this.lastSum30 = lastSum30;
		this.lastSum40 = lastSum40;
		this.lastSum50 = lastSum50;
		this.lastSum60 = lastSum60;
		this.lastSum70 = lastSum70;
		this.lastSum80 = lastSum80;
		this.lastSum90 = lastSum90;
		this.lastSum100 = lastSum100;
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

	public int getV40100() {
		return v40100;
	}

	public void setV40100(int v40100) {
		this.v40100 = v40100;
	}

	public int getSum20() {
		return sum20;
	}

	public void setSum20(int sum20) {
		this.sum20 = sum20;
	}

	public int getVal211() {
		return val211;
	}

	public void setVal211(int val211) {
		this.val211 = val211;
	}

	public int getVal213() {
		return val213;
	}

	public void setVal213(int val213) {
		this.val213 = val213;
	}

	public int getVal221() {
		return val221;
	}

	public void setVal221(int val221) {
		this.val221 = val221;
	}

	public int getVal223() {
		return val223;
	}

	public void setVal223(int val223) {
		this.val223 = val223;
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

	public int getLastSum10() {
		return lastSum10;
	}

	public void setLastSum10(int lastSum10) {
		this.lastSum10 = lastSum10;
	}

	public int getLastSum20() {
		return lastSum20;
	}

	public void setLastSum20(int lastSum20) {
		this.lastSum20 = lastSum20;
	}

	public int getLastVal211() {
		return lastVal211;
	}

	public void setLastVal211(int lastVal211) {
		this.lastVal211 = lastVal211;
	}

	public int getLastVal213() {
		return lastVal213;
	}

	public void setLastVal213(int lastVal213) {
		this.lastVal213 = lastVal213;
	}

	public int getLastVal221() {
		return lastVal221;
	}

	public void setLastVal221(int lastVal221) {
		this.lastVal221 = lastVal221;
	}

	public int getLastVal223() {
		return lastVal223;
	}

	public void setLastVal223(int lastVal223) {
		this.lastVal223 = lastVal223;
	}

	public int getLastSum30() {
		return lastSum30;
	}

	public void setLastSum30(int lastSum30) {
		this.lastSum30 = lastSum30;
	}

	public int getLastSum40() {
		return lastSum40;
	}

	public void setLastSum40(int lastSum40) {
		this.lastSum40 = lastSum40;
	}

	public int getLastSum50() {
		return lastSum50;
	}

	public void setLastSum50(int lastSum50) {
		this.lastSum50 = lastSum50;
	}

	public int getLastSum60() {
		return lastSum60;
	}

	public void setLastSum60(int lastSum60) {
		this.lastSum60 = lastSum60;
	}

	public int getLastSum70() {
		return lastSum70;
	}

	public void setLastSum70(int lastSum70) {
		this.lastSum70 = lastSum70;
	}

	public int getLastSum80() {
		return lastSum80;
	}

	public void setLastSum80(int lastSum80) {
		this.lastSum80 = lastSum80;
	}

	public int getLastSum90() {
		return lastSum90;
	}

	public void setLastSum90(int lastSum90) {
		this.lastSum90 = lastSum90;
	}

	public int getLastSum100() {
		return lastSum100;
	}

	public void setLastSum100(int lastSum100) {
		this.lastSum100 = lastSum100;
	}

	@Override
	public String toString() {
		return "IncomeStmt [comCode=" + comCode + ", year=" + year + ", term=" + term + ", closing=" + closing
				+ ", sum10=" + sum10 + ", v40100=" + v40100 + ", sum20=" + sum20 + ", val211=" + val211 + ", val213="
				+ val213 + ", val221=" + val221 + ", val223=" + val223 + ", sum30=" + sum30 + ", sum40=" + sum40
				+ ", sum50=" + sum50 + ", sum100=" + sum100 + ", lastSum10=" + lastSum10 + ", lastSum20=" + lastSum20
				+ ", lastVal211=" + lastVal211 + ", lastVal213=" + lastVal213 + ", lastVal221=" + lastVal221
				+ ", lastVal223=" + lastVal223 + ", lastSum30=" + lastSum30 + ", lastSum40=" + lastSum40
				+ ", lastSum50=" + lastSum50 + ", lastSum60=" + lastSum60 + ", lastSum70=" + lastSum70 + ", lastSum80="
				+ lastSum80 + ", lastSum90=" + lastSum90 + ", lastSum100=" + lastSum100 + "]";
	}

}
