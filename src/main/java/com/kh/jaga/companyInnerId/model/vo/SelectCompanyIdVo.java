package com.kh.jaga.companyInnerId.model.vo;

/**
 * @author SWY
 * @comment 직원계정 정보 vo
 * @createDate 2020. 4. 16.
 */
public class SelectCompanyIdVo {
	private String comInnerIdNum;
	private String comCode;
	private String positionCode;
	private String id;
	private String pwd;
	private String email;
	private String name;
	private String fileName;
	
	public SelectCompanyIdVo() {}

	public SelectCompanyIdVo(String comInnerIdNum, String comCode, String positionCode, String id, String pwd,
			String email, String name, String fileName) {
		super();
		this.comInnerIdNum = comInnerIdNum;
		this.comCode = comCode;
		this.positionCode = positionCode;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.name = name;
		this.fileName = fileName;
	}

	public String getComInnerIdNum() {
		return comInnerIdNum;
	}

	public void setComInnerIdNum(String comInnerIdNum) {
		this.comInnerIdNum = comInnerIdNum;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	public String getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "SelectCompanyIdVo [comInnerIdNum=" + comInnerIdNum + ", comCode=" + comCode + ", positionCode="
				+ positionCode + ", id=" + id + ", pwd=" + pwd + ", email=" + email + ", name=" + name + ", fileName="
				+ fileName + "]";
	}
	
	
	
	
	
}



