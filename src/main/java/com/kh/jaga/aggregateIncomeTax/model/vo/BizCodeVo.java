package com.kh.jaga.aggregateIncomeTax.model.vo;

public class BizCodeVo {
	
	private String typeOfBizCode;	//업종 코드
	private String sellWayName;		//업태명
	private String sellTargetName;	//종목명
	private String tobcPkCode;		//구분 코드
	
	public BizCodeVo() {}

	public BizCodeVo(String typeOfBizCode, String sellWayName, String sellTargetName, String tobcPkCode) {
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

	public String getTobcPkCode() {
		return tobcPkCode;
	}

	public void setTobcPkCode(String tobcPkCode) {
		this.tobcPkCode = tobcPkCode;
	}

	@Override
	public String toString() {
		return "BizCodeVo [typeOfBizCode=" + typeOfBizCode + ", sellWayName=" + sellWayName + ", sellTargetName="
				+ sellTargetName + ", tobcPkCode=" + tobcPkCode + "]";
	}
	
	

}
