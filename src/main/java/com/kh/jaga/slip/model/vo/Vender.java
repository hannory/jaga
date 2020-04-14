package com.kh.jaga.slip.model.vo;

public class Vender {
	private String venderCode;			//거래처코드
	private String comCode;				//회사코드
	private String bizRegNum;			//거래처 사업자등록번호
	private String venderName;			//거래처명
	private String bossName;			//거래처사장이름
	private String sellWay;				//거래처 업태명
	private String sellTarget;			//거래처 종목명
	private String venderAddress;		//거래처 주소
	private String venderTel;			//거래처 전화번호
	private String departmentIncharge;	//담당자
	private String comManagerTel;		//담당자번호
	private String remarks;				//비고
	private String status;				//사용여부
	private String venderFax;			//팩스번호
	private String accountHolder;		//예금주
	private String accountNum;			//계좌번호
	private String personalNum;			//거래처 대표자 번호	
	private String comManagerEmail;		//업체담당자이메일
	private String bankCode;			//은행코드
	private String farmersStatus;		//농어민여부
	
	public Vender() {}

	public Vender(String venderCode, String comCode, String bizRegNum, String venderName, String bossName,
			String sellWay, String sellTarget, String venderAddress, String venderTel, String departmentIncharge,
			String comManagerTel, String remarks, String status, String venderFax, String accountHolder,
			String accountNum, String personalNum, String comManagerEmail, String bankCode, String farmersStatus) {
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
		this.bankCode = bankCode;
		this.farmersStatus = farmersStatus;
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

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getFarmersStatus() {
		return farmersStatus;
	}

	public void setFarmersStatus(String farmersStatus) {
		this.farmersStatus = farmersStatus;
	}

	@Override
	public String toString() {
		return "Vender [venderCode=" + venderCode + ", comCode=" + comCode + ", bizRegNum=" + bizRegNum
				+ ", venderName=" + venderName + ", bossName=" + bossName + ", sellWay=" + sellWay + ", sellTarget="
				+ sellTarget + ", venderAddress=" + venderAddress + ", venderTel=" + venderTel + ", departmentIncharge="
				+ departmentIncharge + ", comManagerTel=" + comManagerTel + ", remarks=" + remarks + ", status="
				+ status + ", venderFax=" + venderFax + ", accountHolder=" + accountHolder + ", accountNum="
				+ accountNum + ", personalNum=" + personalNum + ", comManagerEmail=" + comManagerEmail + ", bankCode="
				+ bankCode + ", farmersStatus=" + farmersStatus + "]";
	}
	
	
}
