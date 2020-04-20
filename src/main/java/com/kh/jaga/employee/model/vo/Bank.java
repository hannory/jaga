package com.kh.jaga.employee.model.vo;

public class Bank {
	private String bankCode;
	private String bankName;
	
	public Bank() {}

	public Bank(String bankCode, String bankName) {
		super();
		this.bankCode = bankCode;
		this.bankName = bankName;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	@Override
	public String toString() {
		return "Bank [bankCode=" + bankCode + ", bankName=" + bankName + "]";
	}
	
	
}
