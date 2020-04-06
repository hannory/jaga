package com.kh.jaga.company.model.vo;

public class Company implements java.io.Serializable {

	public Company() {}
	
	private int companyCode;
	private String companyId;
	private String companyPwd;
	public Company(int companyCode, String companyId, String companyPwd) {
		super();
		this.companyCode = companyCode;
		this.companyId = companyId;
		this.companyPwd = companyPwd;
	}
	public int getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(int companyCode) {
		this.companyCode = companyCode;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getCompanyPwd() {
		return companyPwd;
	}
	public void setCompanyPwd(String companyPwd) {
		this.companyPwd = companyPwd;
	}
	@Override
	public String toString() {
		return "Company [companyCode=" + companyCode + ", companyId=" + companyId + ", companyPwd=" + companyPwd + "]";
	}

	
}
