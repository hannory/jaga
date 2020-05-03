package com.kh.jaga.companyInnerId.model.dto;

public class CreateCompanyInnerIdDto {
	private String id;
	private String pwd;
	private String email;
	private String name;
	private String position;
	private String sign;
	private String companyCode;
	
	public CreateCompanyInnerIdDto() {}

	public CreateCompanyInnerIdDto(String id, String pwd, String email, String name, String position, String sign,
			String companyCode) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.name = name;
		this.position = position;
		this.sign = sign;
		this.companyCode = companyCode;
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

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	@Override
	public String toString() {
		return "CreateCompanyInnerIdDto [id=" + id + ", pwd=" + pwd + ", email=" + email + ", name=" + name
				+ ", position=" + position + ", sign=" + sign + ", companyCode=" + companyCode + "]";
	}
	
	


	
	
	
}
