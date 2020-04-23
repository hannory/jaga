package com.kh.jaga.payment.model.vo;

import java.util.List;

public class BusinessPayList {
	private List<BusinessPayment> bpList;
	
	public BusinessPayList() {}

	public BusinessPayList(List<BusinessPayment> bpList) {
		super();
		this.bpList = bpList;
	}

	public List<BusinessPayment> getBpList() {
		return bpList;
	}

	public void setBpList(List<BusinessPayment> bpList) {
		this.bpList = bpList;
	}

	@Override
	public String toString() {
		return "BusinessPayList [bpList=" + bpList + "]";
	}
	
	
}
