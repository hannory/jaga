package com.kh.jaga.expendResolution.model.vo;

public class DepartmentVo implements java.io.Serializable {
	private String deptCode;
	private String deptName;
	
	public DepartmentVo() {}

	public DepartmentVo(String deptCode, String deptName) {
		super();
		this.deptCode = deptCode;
		this.deptName = deptName;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Override
	public String toString() {
		return "DepartmentVo [deptCode=" + deptCode + ", deptName=" + deptName + "]";
	}
	
	
}
