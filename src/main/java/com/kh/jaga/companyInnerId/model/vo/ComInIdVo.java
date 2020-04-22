package com.kh.jaga.companyInnerId.model.vo;

public class ComInIdVo implements java.io.Serializable{
	
	private String comInnerIdNum;		//사내계정코드
	private String comCode;				//회사코드
	private String positionCode;		//직급코드
	private String id;					//사내계정아이디
	private String pwd;					//비밀번호
	private String email;				//이메일
	private String name;				//이름
	private String fileName;			//서명파일
	
	private String positionName;		//직급명		 
	
	public ComInIdVo() {}

	public ComInIdVo(String comInnerIdNum, String comCode, String positionCode, String id, String pwd, String email,
			String name, String fileName, String positionName) {
		super();
		this.comInnerIdNum = comInnerIdNum;
		this.comCode = comCode;
		this.positionCode = positionCode;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.name = name;
		this.fileName = fileName;
		this.positionName = positionName;
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

	public String getPositionName() {
		return positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	@Override
	public String toString() {
		return "ComInIdVo [comInnerIdNum=" + comInnerIdNum + ", comCode=" + comCode + ", positionCode=" + positionCode
				+ ", id=" + id + ", pwd=" + pwd + ", email=" + email + ", name=" + name + ", fileName=" + fileName
				+ ", positionName=" + positionName + "]";
	}

	
	
	
	
}
