package com.kh.jaga.employee.model.vo;

public class incomeTax implements java.io.Serializable {

	
	public incomeTax() {}
	
	private int min;
	private int max;
	private int result;
	public incomeTax(int min, int max, int result) {
		super();
		this.min = min;
		this.max = max;
		this.result = result;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "incomeTax [min=" + min + ", max=" + max + ", result=" + result + "]";
	}
	
	
}
