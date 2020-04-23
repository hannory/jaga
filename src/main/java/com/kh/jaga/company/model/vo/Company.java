package com.kh.jaga.company.model.vo;

import java.sql.Date;

public class Company implements java.io.Serializable {

	public Company() {}
	
	private String companyCode;
	private String companyPwd;
	private String companyPwd2;
	private String companyId;
	private String email;
	private String phone;
	private String bizName;
	private String bizNum;
	private String bossName;
	private String personalNum;
	private Date openDay;
	private String bizLocation;
	private String bossAddress;
	private String bizType;
	private Date enrollDate;
	private Date modifyDate;
	private String payStatus;
	private String enrollStatus;
	private Date gaeup;
	public Company(String companyCode, String companyPwd, String companyPwd2, String companyId, String email,
			String phone, String bizName, String bizNum, String bossName, String personalNum, Date openDay,
			String bizLocation, String bossAddress, String bizType, Date enrollDate, Date modifyDate, String payStatus,
			String enrollStatus, Date gaeup) {
		super();
		this.companyCode = companyCode;
		this.companyPwd = companyPwd;
		this.companyPwd2 = companyPwd2;
		this.companyId = companyId;
		this.email = email;
		this.phone = phone;
		this.bizName = bizName;
		this.bizNum = bizNum;
		this.bossName = bossName;
		this.personalNum = personalNum;
		this.openDay = openDay;
		this.bizLocation = bizLocation;
		this.bossAddress = bossAddress;
		this.bizType = bizType;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.payStatus = payStatus;
		this.enrollStatus = enrollStatus;
		this.gaeup = gaeup;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public String getCompanyPwd() {
		return companyPwd;
	}
	public void setCompanyPwd(String companyPwd) {
		this.companyPwd = companyPwd;
	}
	public String getCompanyPwd2() {
		return companyPwd2;
	}
	public void setCompanyPwd2(String companyPwd2) {
		this.companyPwd2 = companyPwd2;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBizName() {
		return bizName;
	}
	public void setBizName(String bizName) {
		this.bizName = bizName;
	}
	public String getBizNum() {
		return bizNum;
	}
	public void setBizNum(String bizNum) {
		this.bizNum = bizNum;
	}
	public String getBossName() {
		return bossName;
	}
	public void setBossName(String bossName) {
		this.bossName = bossName;
	}
	public String getPersonalNum() {
		return personalNum;
	}
	public void setPersonalNum(String personalNum) {
		this.personalNum = personalNum;
	}
	public Date getOpenDay() {
		return openDay;
	}
	public void setOpenDay(Date openDay) {
		this.openDay = openDay;
	}
	public String getBizLocation() {
		return bizLocation;
	}
	public void setBizLocation(String bizLocation) {
		this.bizLocation = bizLocation;
	}
	public String getBossAddress() {
		return bossAddress;
	}
	public void setBossAddress(String bossAddress) {
		this.bossAddress = bossAddress;
	}
	public String getBizType() {
		return bizType;
	}
	public void setBizType(String bizType) {
		this.bizType = bizType;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	public String getEnrollStatus() {
		return enrollStatus;
	}
	public void setEnrollStatus(String enrollStatus) {
		this.enrollStatus = enrollStatus;
	}
	public Date getGaeup() {
		return gaeup;
	}
	public void setGaeup(Date gaeup) {
		this.gaeup = gaeup;
	}
	@Override
	public String toString() {
		return "Company [companyCode=" + companyCode + ", companyPwd=" + companyPwd + ", companyPwd2=" + companyPwd2
				+ ", companyId=" + companyId + ", email=" + email + ", phone=" + phone + ", bizName=" + bizName
				+ ", bizNum=" + bizNum + ", bossName=" + bossName + ", personalNum=" + personalNum + ", openDay="
				+ openDay + ", bizLocation=" + bizLocation + ", bossAddress=" + bossAddress + ", bizType=" + bizType
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", payStatus=" + payStatus
				+ ", enrollStatus=" + enrollStatus + ", gaeup=" + gaeup + "]";
	}

	
}
