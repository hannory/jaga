package com.kh.jaga.slip.model.vo;

public class AccountTitle {
	private String accountCode;
	private String accountTitle;
	private String character;
	private String realation;
	private String comCode;
	private String accountSystem;
	
	public AccountTitle() {}

	public AccountTitle(String accountCode, String accountTitle, String character, String realation, String comCode,
			String accountSystem) {
		super();
		this.accountCode = accountCode;
		this.accountTitle = accountTitle;
		this.character = character;
		this.realation = realation;
		this.comCode = comCode;
		this.accountSystem = accountSystem;
	}

	public String getAccountCode() {
		return accountCode;
	}

	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
	}

	public String getAccountTitle() {
		return accountTitle;
	}

	public void setAccountTitle(String accountTitle) {
		this.accountTitle = accountTitle;
	}

	public String getCharacter() {
		return character;
	}

	public void setCharacter(String character) {
		this.character = character;
	}

	public String getRealation() {
		return realation;
	}

	public void setRealation(String realation) {
		this.realation = realation;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	public String getAccountSystem() {
		return accountSystem;
	}

	public void setAccountSystem(String accountSystem) {
		this.accountSystem = accountSystem;
	}

	@Override
	public String toString() {
		return "AccountName [accountCode=" + accountCode + ", accountTitle=" + accountTitle + ", character=" + character
				+ ", realation=" + realation + ", comCode=" + comCode + ", accountSystem=" + accountSystem + "]";
	}
	
	
}
