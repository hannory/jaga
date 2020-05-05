package com.kh.jaga.expendResolution.model.vo;

public class ExpendResolutionDetailVo implements java.io.Serializable{
	
		private String expendDetailNo;
		private String detailDate;
		private String detailBrief;
		private String detailVenderCode;
		private String detailPrice;
		private String detailMemo;
		private String expendResolutionNo;
		
		public ExpendResolutionDetailVo() {}

		public ExpendResolutionDetailVo(String expendDetailNo, String detailDate, String detailBrief,
				String detailVenderCode, String detailPrice, String detailMemo, String expendResolutionNo) {
			super();
			this.expendDetailNo = expendDetailNo;
			this.detailDate = detailDate;
			this.detailBrief = detailBrief;
			this.detailVenderCode = detailVenderCode;
			this.detailPrice = detailPrice;
			this.detailMemo = detailMemo;
			this.expendResolutionNo = expendResolutionNo;
		}

		public String getExpendDetailNo() {
			return expendDetailNo;
		}

		public void setExpendDetailNo(String expendDetailNo) {
			this.expendDetailNo = expendDetailNo;
		}

		public String getDetailDate() {
			return detailDate;
		}

		public void setDetailDate(String detailDate) {
			this.detailDate = detailDate;
		}

		public String getDetailBrief() {
			return detailBrief;
		}

		public void setDetailBrief(String detailBrief) {
			this.detailBrief = detailBrief;
		}

		public String getDetailVenderCode() {
			return detailVenderCode;
		}

		public void setDetailVenderCode(String detailVenderCode) {
			this.detailVenderCode = detailVenderCode;
		}

		public String getDetailPrice() {
			return detailPrice;
		}

		public void setDetailPrice(String detailPrice) {
			this.detailPrice = detailPrice;
		}

		public String getDetailMemo() {
			return detailMemo;
		}

		public void setDetailMemo(String detailMemo) {
			this.detailMemo = detailMemo;
		}

		public String getExpendResolutionNo() {
			return expendResolutionNo;
		}

		public void setExpendResolutionNo(String expendResolutionNo) {
			this.expendResolutionNo = expendResolutionNo;
		}

		@Override
		public String toString() {
			return "ExpendResolutionDetailVo [expendDetailNo=" + expendDetailNo + ", detailDate=" + detailDate
					+ ", detailBrief=" + detailBrief + ", detailVenderCode=" + detailVenderCode + ", detailPrice="
					+ detailPrice + ", detailMemo=" + detailMemo + ", expendResolutionNo=" + expendResolutionNo + "]";
		}
		
		
		
}
