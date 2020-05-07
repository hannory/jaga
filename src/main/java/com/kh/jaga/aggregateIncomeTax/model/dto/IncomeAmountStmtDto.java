package com.kh.jaga.aggregateIncomeTax.model.dto;

public class IncomeAmountStmtDto {
	
	private String v01;
	private String v02;
	private String v03;
	private String v04;
	private String v05;
	private String v06;
	private String v07;
	private String v08;
	private String v09;
	private String v10;
	private String v11;
	private String v12;
	private String v13;
	
	private String DOCUMENT_NO;
	private String YEAR_OF_ATTR;
	private String INCOME_TYPE_CODE;
	private String TOTAL_INCOME;
	private String NECESSARY_EXPENSE;
	private String INCOME_ETC;
	private String TAX_FOR_INCOME;
	private String CARRY_FORWARD;
	private String COMMON_BIZ;
	private String INCOME_FOR_MIN_TAX;
	private String START_DATE;
	private String END_DATE;
	private String LOCATION;
	private String DOMESTIC;
	private String MODIFY_DATE;
	private String BOOK_KEEPING_CODE;
	private String REPORT_CODE;
	private String COM_CODE;
	
	public IncomeAmountStmtDto() {}

	public IncomeAmountStmtDto(String v01, String v02, String v03, String v04, String v05, String v06, String v07,
			String v08, String v09, String v10, String v11, String v12, String v13, String dOCUMENT_NO,
			String yEAR_OF_ATTR, String iNCOME_TYPE_CODE, String tOTAL_INCOME, String nECESSARY_EXPENSE,
			String iNCOME_ETC, String tAX_FOR_INCOME, String cARRY_FORWARD, String cOMMON_BIZ,
			String iNCOME_FOR_MIN_TAX, String sTART_DATE, String eND_DATE, String lOCATION, String dOMESTIC,
			String mODIFY_DATE, String bOOK_KEEPING_CODE, String rEPORT_CODE, String cOM_CODE) {
		super();
		this.v01 = v01;
		this.v02 = v02;
		this.v03 = v03;
		this.v04 = v04;
		this.v05 = v05;
		this.v06 = v06;
		this.v07 = v07;
		this.v08 = v08;
		this.v09 = v09;
		this.v10 = v10;
		this.v11 = v11;
		this.v12 = v12;
		this.v13 = v13;
		DOCUMENT_NO = dOCUMENT_NO;
		YEAR_OF_ATTR = yEAR_OF_ATTR;
		INCOME_TYPE_CODE = iNCOME_TYPE_CODE;
		TOTAL_INCOME = tOTAL_INCOME;
		NECESSARY_EXPENSE = nECESSARY_EXPENSE;
		INCOME_ETC = iNCOME_ETC;
		TAX_FOR_INCOME = tAX_FOR_INCOME;
		CARRY_FORWARD = cARRY_FORWARD;
		COMMON_BIZ = cOMMON_BIZ;
		INCOME_FOR_MIN_TAX = iNCOME_FOR_MIN_TAX;
		START_DATE = sTART_DATE;
		END_DATE = eND_DATE;
		LOCATION = lOCATION;
		DOMESTIC = dOMESTIC;
		MODIFY_DATE = mODIFY_DATE;
		BOOK_KEEPING_CODE = bOOK_KEEPING_CODE;
		REPORT_CODE = rEPORT_CODE;
		COM_CODE = cOM_CODE;
	}

	public String getV01() {
		return v01;
	}

	public void setV01(String v01) {
		this.v01 = v01;
	}

	public String getV02() {
		return v02;
	}

	public void setV02(String v02) {
		this.v02 = v02;
	}

	public String getV03() {
		return v03;
	}

	public void setV03(String v03) {
		this.v03 = v03;
	}

	public String getV04() {
		return v04;
	}

	public void setV04(String v04) {
		this.v04 = v04;
	}

	public String getV05() {
		return v05;
	}

	public void setV05(String v05) {
		this.v05 = v05;
	}

	public String getV06() {
		return v06;
	}

	public void setV06(String v06) {
		this.v06 = v06;
	}

	public String getV07() {
		return v07;
	}

	public void setV07(String v07) {
		this.v07 = v07;
	}

	public String getV08() {
		return v08;
	}

	public void setV08(String v08) {
		this.v08 = v08;
	}

	public String getV09() {
		return v09;
	}

	public void setV09(String v09) {
		this.v09 = v09;
	}

	public String getV10() {
		return v10;
	}

	public void setV10(String v10) {
		this.v10 = v10;
	}

	public String getV11() {
		return v11;
	}

	public void setV11(String v11) {
		this.v11 = v11;
	}

	public String getV12() {
		return v12;
	}

	public void setV12(String v12) {
		this.v12 = v12;
	}

	public String getV13() {
		return v13;
	}

	public void setV13(String v13) {
		this.v13 = v13;
	}

	public String getDOCUMENT_NO() {
		return DOCUMENT_NO;
	}

	public void setDOCUMENT_NO(String dOCUMENT_NO) {
		DOCUMENT_NO = dOCUMENT_NO;
	}

	public String getYEAR_OF_ATTR() {
		return YEAR_OF_ATTR;
	}

	public void setYEAR_OF_ATTR(String yEAR_OF_ATTR) {
		YEAR_OF_ATTR = yEAR_OF_ATTR;
	}

	public String getINCOME_TYPE_CODE() {
		return INCOME_TYPE_CODE;
	}

	public void setINCOME_TYPE_CODE(String iNCOME_TYPE_CODE) {
		INCOME_TYPE_CODE = iNCOME_TYPE_CODE;
	}

	public String getTOTAL_INCOME() {
		return TOTAL_INCOME;
	}

	public void setTOTAL_INCOME(String tOTAL_INCOME) {
		TOTAL_INCOME = tOTAL_INCOME;
	}

	public String getNECESSARY_EXPENSE() {
		return NECESSARY_EXPENSE;
	}

	public void setNECESSARY_EXPENSE(String nECESSARY_EXPENSE) {
		NECESSARY_EXPENSE = nECESSARY_EXPENSE;
	}

	public String getINCOME_ETC() {
		return INCOME_ETC;
	}

	public void setINCOME_ETC(String iNCOME_ETC) {
		INCOME_ETC = iNCOME_ETC;
	}

	public String getTAX_FOR_INCOME() {
		return TAX_FOR_INCOME;
	}

	public void setTAX_FOR_INCOME(String tAX_FOR_INCOME) {
		TAX_FOR_INCOME = tAX_FOR_INCOME;
	}

	public String getCARRY_FORWARD() {
		return CARRY_FORWARD;
	}

	public void setCARRY_FORWARD(String cARRY_FORWARD) {
		CARRY_FORWARD = cARRY_FORWARD;
	}

	public String getCOMMON_BIZ() {
		return COMMON_BIZ;
	}

	public void setCOMMON_BIZ(String cOMMON_BIZ) {
		COMMON_BIZ = cOMMON_BIZ;
	}

	public String getINCOME_FOR_MIN_TAX() {
		return INCOME_FOR_MIN_TAX;
	}

	public void setINCOME_FOR_MIN_TAX(String iNCOME_FOR_MIN_TAX) {
		INCOME_FOR_MIN_TAX = iNCOME_FOR_MIN_TAX;
	}

	public String getSTART_DATE() {
		return START_DATE;
	}

	public void setSTART_DATE(String sTART_DATE) {
		START_DATE = sTART_DATE;
	}

	public String getEND_DATE() {
		return END_DATE;
	}

	public void setEND_DATE(String eND_DATE) {
		END_DATE = eND_DATE;
	}

	public String getLOCATION() {
		return LOCATION;
	}

	public void setLOCATION(String lOCATION) {
		LOCATION = lOCATION;
	}

	public String getDOMESTIC() {
		return DOMESTIC;
	}

	public void setDOMESTIC(String dOMESTIC) {
		DOMESTIC = dOMESTIC;
	}

	public String getMODIFY_DATE() {
		return MODIFY_DATE;
	}

	public void setMODIFY_DATE(String mODIFY_DATE) {
		MODIFY_DATE = mODIFY_DATE;
	}

	public String getBOOK_KEEPING_CODE() {
		return BOOK_KEEPING_CODE;
	}

	public void setBOOK_KEEPING_CODE(String bOOK_KEEPING_CODE) {
		BOOK_KEEPING_CODE = bOOK_KEEPING_CODE;
	}

	public String getREPORT_CODE() {
		return REPORT_CODE;
	}

	public void setREPORT_CODE(String rEPORT_CODE) {
		REPORT_CODE = rEPORT_CODE;
	}

	public String getCOM_CODE() {
		return COM_CODE;
	}

	public void setCOM_CODE(String cOM_CODE) {
		COM_CODE = cOM_CODE;
	}

	@Override
	public String toString() {
		return "IncomeAmountStmtDto [v01=" + v01 + ", v02=" + v02 + ", v03=" + v03 + ", v04=" + v04 + ", v05=" + v05
				+ ", v06=" + v06 + ", v07=" + v07 + ", v08=" + v08 + ", v09=" + v09 + ", v10=" + v10 + ", v11=" + v11
				+ ", v12=" + v12 + ", v13=" + v13 + ", DOCUMENT_NO=" + DOCUMENT_NO + ", YEAR_OF_ATTR=" + YEAR_OF_ATTR
				+ ", INCOME_TYPE_CODE=" + INCOME_TYPE_CODE + ", TOTAL_INCOME=" + TOTAL_INCOME + ", NECESSARY_EXPENSE="
				+ NECESSARY_EXPENSE + ", INCOME_ETC=" + INCOME_ETC + ", TAX_FOR_INCOME=" + TAX_FOR_INCOME
				+ ", CARRY_FORWARD=" + CARRY_FORWARD + ", COMMON_BIZ=" + COMMON_BIZ + ", INCOME_FOR_MIN_TAX="
				+ INCOME_FOR_MIN_TAX + ", START_DATE=" + START_DATE + ", END_DATE=" + END_DATE + ", LOCATION="
				+ LOCATION + ", DOMESTIC=" + DOMESTIC + ", MODIFY_DATE=" + MODIFY_DATE + ", BOOK_KEEPING_CODE="
				+ BOOK_KEEPING_CODE + ", REPORT_CODE=" + REPORT_CODE + ", COM_CODE=" + COM_CODE + "]";
	}
	
	

	
	
}
