package com.kh.jaga.vender.model.vo;

public class Vender implements java.io.Serializable {

	private String venderCode;
	private String comCode;
	private String bizRegNum;
	private String venderName;
	private String bossName;
	private String sellWay;
	private String sellTarget;
	private String venderAddress;
	private String venderTel;
	private String departmentIncharge;
	private String comManagerTel;
	private String remarks;
	private String status;
	private String venderFax;
	private String accountHolder;
	private String accountNum;
	private String personalNum;
	private String comManagerEmail; 
	private String farmersStatus;
	private String bankCode;
	
	public Vender() {}

	public Vender(String venderCode, String comCode, String bizRegNum, String venderName, String bossName,
			String sellWay, String sellTarget, String venderAddress, String venderTel, String departmentIncharge,
			String comManagerTel, String remarks, String status, String venderFax, String accountHolder,
			String accountNum, String personalNum, String comManagerEmail, String farmersStatus, String bankCode) {
		super();
		this.venderCode = venderCode;
		this.comCode = comCode;
		this.bizRegNum = bizRegNum;
		this.venderName = venderName;
		this.bossName = bossName;
		this.sellWay = sellWay;
		this.sellTarget = sellTarget;
		this.venderAddress = venderAddress;
		this.venderTel = venderTel;
		this.departmentIncharge = departmentIncharge;
		this.comManagerTel = comManagerTel;
		this.remarks = remarks;
		this.status = status;
		this.venderFax = venderFax;
		this.accountHolder = accountHolder;
		this.accountNum = accountNum;
		this.personalNum = personalNum;
		this.comManagerEmail = comManagerEmail;
		this.farmersStatus = farmersStatus;
		this.bankCode = bankCode;
	}

	public String getVenderCode() {
		return venderCode;
	}

	public void setVenderCode(String venderCode) {
		this.venderCode = venderCode;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	public String getBizRegNum() {
		return bizRegNum;
	}

	public void setBizRegNum(String bizRegNum) {
		this.bizRegNum = bizRegNum;
	}

	public String getVenderName() {
		return venderName;
	}

	public void setVenderName(String venderName) {
		this.venderName = venderName;
	}

	public String getBossName() {
		return bossName;
	}

	public void setBossName(String bossName) {
		this.bossName = bossName;
	}

	public String getSellWay() {
		return sellWay;
	}

	public void setSellWay(String sellWay) {
		this.sellWay = sellWay;
	}

	public String getSellTarget() {
		return sellTarget;
	}

	public void setSellTarget(String sellTarget) {
		this.sellTarget = sellTarget;
	}

	public String getVenderAddress() {
		return venderAddress;
	}

	public void setVenderAddress(String venderAddress) {
		this.venderAddress = venderAddress;
	}

	public String getVenderTel() {
		return venderTel;
	}

	public void setVenderTel(String venderTel) {
		this.venderTel = venderTel;
	}

	public String getDepartmentIncharge() {
		return departmentIncharge;
	}

	public void setDepartmentIncharge(String departmentIncharge) {
		this.departmentIncharge = departmentIncharge;
	}

	public String getComManagerTel() {
		return comManagerTel;
	}

	public void setComManagerTel(String comManagerTel) {
		this.comManagerTel = comManagerTel;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getVenderFax() {
		return venderFax;
	}

	public void setVenderFax(String venderFax) {
		this.venderFax = venderFax;
	}

	public String getAccountHolder() {
		return accountHolder;
	}

	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	public String getPersonalNum() {
		return personalNum;
	}

	public void setPersonalNum(String personalNum) {
		this.personalNum = personalNum;
	}

	public String getComManagerEmail() {
		return comManagerEmail;
	}

	public void setComManagerEmail(String comManagerEmail) {
		this.comManagerEmail = comManagerEmail;
	}

	public String getFarmersStatus() {
		return farmersStatus;
	}

	public void setFarmersStatus(String farmersStatus) {
		this.farmersStatus = farmersStatus;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	@Override
	public String toString() {
		return "Vender [venderCode=" + venderCode + ", comCode=" + comCode + ", bizRegNum=" + bizRegNum
				+ ", venderName=" + venderName + ", bossName=" + bossName + ", sellWay=" + sellWay + ", sellTarget="
				+ sellTarget + ", venderAddress=" + venderAddress + ", venderTel=" + venderTel + ", departmentIncharge="
				+ departmentIncharge + ", comManagerTel=" + comManagerTel + ", remarks=" + remarks + ", status="
				+ status + ", venderFax=" + venderFax + ", accountHolder=" + accountHolder + ", accountNum="
				+ accountNum + ", personalNum=" + personalNum + ", comManagerEmail=" + comManagerEmail
				+ ", farmersStatus=" + farmersStatus + ", bankCode=" + bankCode + "]";
	}
	
	
}
