package com.kh.jaga.company.model.vo;

public class TypeOfBiz implements java.io.Serializable {

	public TypeOfBiz(){}
	private String typeOfBizCode;
	private String sellWayName;
	private String sellTargetName;
	private int tobcPkCode;
	public TypeOfBiz(String typeOfBizCode, String sellWayName, String sellTargetName, int tobcPkCode) {
		super();
		this.typeOfBizCode = typeOfBizCode;
		this.sellWayName = sellWayName;
		this.sellTargetName = sellTargetName;
		this.tobcPkCode = tobcPkCode;
	}
	public String getTypeOfBizCode() {
		return typeOfBizCode;
	}
	public void setTypeOfBizCode(String typeOfBizCode) {
		this.typeOfBizCode = typeOfBizCode;
	}
	public String getSellWayName() {
		return sellWayName;
	}
	public void setSellWayName(String sellWayName) {
		this.sellWayName = sellWayName;
	}
	public String getSellTargetName() {
		return sellTargetName;
	}
	public void setSellTargetName(String sellTargetName) {
		this.sellTargetName = sellTargetName;
	}
	public int getTobcPkCode() {
		return tobcPkCode;
	}
	public void setTobcPkCode(int tobcPkCode) {
		this.tobcPkCode = tobcPkCode;
	}
	@Override
	public String toString() {
		return "TypeOfBiz [typeOfBizCode=" + typeOfBizCode + ", sellWayName=" + sellWayName + ", sellTargetName="
				+ sellTargetName + ", tobcPkCode=" + tobcPkCode + "]";
	}
	
	
	
}
