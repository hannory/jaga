package com.kh.jaga.taxInvoice.model.vo;

public class TaxInvoice {
	private String invoceCode;
	private String digitalCode;
	private String slipCode;
	private String division;
	private String venderCode;
	private String issueStatus;
	
	public TaxInvoice() {}

	public TaxInvoice(String invoceCode, String digitalCode, String slipCode, String division, String venderCode,
			String issueStatus) {
		super();
		this.invoceCode = invoceCode;
		this.digitalCode = digitalCode;
		this.slipCode = slipCode;
		this.division = division;
		this.venderCode = venderCode;
		this.issueStatus = issueStatus;
	}

	public String getInvoceCode() {
		return invoceCode;
	}

	public void setInvoceCode(String invoceCode) {
		this.invoceCode = invoceCode;
	}

	public String getDigitalCode() {
		return digitalCode;
	}

	public void setDigitalCode(String digitalCode) {
		this.digitalCode = digitalCode;
	}

	public String getSlipCode() {
		return slipCode;
	}

	public void setSlipCode(String slipCode) {
		this.slipCode = slipCode;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getVenderCode() {
		return venderCode;
	}

	public void setVenderCode(String venderCode) {
		this.venderCode = venderCode;
	}

	public String getIssueStatus() {
		return issueStatus;
	}

	public void setIssueStatus(String issueStatus) {
		this.issueStatus = issueStatus;
	}

	@Override
	public String toString() {
		return "TaxInvoice [invoceCode=" + invoceCode + ", digitalCode=" + digitalCode + ", slipCode=" + slipCode
				+ ", division=" + division + ", venderCode=" + venderCode + ", issueStatus=" + issueStatus + "]";
	}
	
	
	
}
