package com.kh.jaga.aggregateIncomeTax.model.dto;

public class AggregateCalculatedDto {
	
	private String stmtNo;
	private String comCode;
	private String yearOfAttr;
	
	private String v101;		//종합소득금액
	private String v102;		//소득공제계
	private String v103;		//과세표준(종합소득금액 - 소득공제계)
	private String v104;		//세율
	private String v105;		//산출세액
	private String v106;		//세액감면
	private String v107;		//세액공제
	private String v108;		//결정세액(산출세액 - 세액감면 - 세액공제)
	private String v109;		//가산세
	private String v110;		//추가납부세액
	private String v111;		//합계(결정세액 + 가산세 + 추가납부세액)
	private String v112;		//기납부세액
	private String v113;		//납부할 총 세액 (합계 - 기납부세액)
	private String v114;		//납부특례세액 차감
	private String v115;		//납부특례세액 가산
	private String v116;		//분할납세액 2개월 내
	private String v117;		//기한 이내 납부할 세액
	
	private String v118;		//안쓰는
	private String v119;		//칼럼
	private String v120;		//입니다.
	
	private String v201;
	private String v202;
	private String v203;
	private String v204;
	private String v205;
	private String v206;
	private String v207;
	private String v208;
	private String v209;
	private String v210;
	private String v211;
	private String v212;
	private String v213;
	private String v214;
	private String v215;
	private String v216;
	private String v217;
	private String v218;
	private String v219;
	private String v220;
	
	private String v301;
	private String v302;
	private String v303;
	private String v304;
	private String v305;
	private String v306;
	private String v307;
	private String v308;
	private String v309;
	private String v310;
	private String v311;
	private String v312;
	private String v313;
	private String v314;
	private String v315;
	private String v316;
	private String v317;
	private String v318;
	private String v319;
	private String v320;
	
	public AggregateCalculatedDto() {}

	public AggregateCalculatedDto(String stmtNo, String comCode, String yearOfAttr, String v101, String v102,
			String v103, String v104, String v105, String v106, String v107, String v108, String v109, String v110,
			String v111, String v112, String v113, String v114, String v115, String v116, String v117, String v118,
			String v119, String v120, String v201, String v202, String v203, String v204, String v205, String v206,
			String v207, String v208, String v209, String v210, String v211, String v212, String v213, String v214,
			String v215, String v216, String v217, String v218, String v219, String v220, String v301, String v302,
			String v303, String v304, String v305, String v306, String v307, String v308, String v309, String v310,
			String v311, String v312, String v313, String v314, String v315, String v316, String v317, String v318,
			String v319, String v320) {
		super();
		this.stmtNo = stmtNo;
		this.comCode = comCode;
		this.yearOfAttr = yearOfAttr;
		this.v101 = v101;
		this.v102 = v102;
		this.v103 = v103;
		this.v104 = v104;
		this.v105 = v105;
		this.v106 = v106;
		this.v107 = v107;
		this.v108 = v108;
		this.v109 = v109;
		this.v110 = v110;
		this.v111 = v111;
		this.v112 = v112;
		this.v113 = v113;
		this.v114 = v114;
		this.v115 = v115;
		this.v116 = v116;
		this.v117 = v117;
		this.v118 = v118;
		this.v119 = v119;
		this.v120 = v120;
		this.v201 = v201;
		this.v202 = v202;
		this.v203 = v203;
		this.v204 = v204;
		this.v205 = v205;
		this.v206 = v206;
		this.v207 = v207;
		this.v208 = v208;
		this.v209 = v209;
		this.v210 = v210;
		this.v211 = v211;
		this.v212 = v212;
		this.v213 = v213;
		this.v214 = v214;
		this.v215 = v215;
		this.v216 = v216;
		this.v217 = v217;
		this.v218 = v218;
		this.v219 = v219;
		this.v220 = v220;
		this.v301 = v301;
		this.v302 = v302;
		this.v303 = v303;
		this.v304 = v304;
		this.v305 = v305;
		this.v306 = v306;
		this.v307 = v307;
		this.v308 = v308;
		this.v309 = v309;
		this.v310 = v310;
		this.v311 = v311;
		this.v312 = v312;
		this.v313 = v313;
		this.v314 = v314;
		this.v315 = v315;
		this.v316 = v316;
		this.v317 = v317;
		this.v318 = v318;
		this.v319 = v319;
		this.v320 = v320;
	}

	public String getStmtNo() {
		return stmtNo;
	}

	public void setStmtNo(String stmtNo) {
		this.stmtNo = stmtNo;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	public String getYearOfAttr() {
		return yearOfAttr;
	}

	public void setYearOfAttr(String yearOfAttr) {
		this.yearOfAttr = yearOfAttr;
	}

	public String getV101() {
		return v101;
	}

	public void setV101(String v101) {
		this.v101 = v101;
	}

	public String getV102() {
		return v102;
	}

	public void setV102(String v102) {
		this.v102 = v102;
	}

	public String getV103() {
		return v103;
	}

	public void setV103(String v103) {
		this.v103 = v103;
	}

	public String getV104() {
		return v104;
	}

	public void setV104(String v104) {
		this.v104 = v104;
	}

	public String getV105() {
		return v105;
	}

	public void setV105(String v105) {
		this.v105 = v105;
	}

	public String getV106() {
		return v106;
	}

	public void setV106(String v106) {
		this.v106 = v106;
	}

	public String getV107() {
		return v107;
	}

	public void setV107(String v107) {
		this.v107 = v107;
	}

	public String getV108() {
		return v108;
	}

	public void setV108(String v108) {
		this.v108 = v108;
	}

	public String getV109() {
		return v109;
	}

	public void setV109(String v109) {
		this.v109 = v109;
	}

	public String getV110() {
		return v110;
	}

	public void setV110(String v110) {
		this.v110 = v110;
	}

	public String getV111() {
		return v111;
	}

	public void setV111(String v111) {
		this.v111 = v111;
	}

	public String getV112() {
		return v112;
	}

	public void setV112(String v112) {
		this.v112 = v112;
	}

	public String getV113() {
		return v113;
	}

	public void setV113(String v113) {
		this.v113 = v113;
	}

	public String getV114() {
		return v114;
	}

	public void setV114(String v114) {
		this.v114 = v114;
	}

	public String getV115() {
		return v115;
	}

	public void setV115(String v115) {
		this.v115 = v115;
	}

	public String getV116() {
		return v116;
	}

	public void setV116(String v116) {
		this.v116 = v116;
	}

	public String getV117() {
		return v117;
	}

	public void setV117(String v117) {
		this.v117 = v117;
	}

	public String getV118() {
		return v118;
	}

	public void setV118(String v118) {
		this.v118 = v118;
	}

	public String getV119() {
		return v119;
	}

	public void setV119(String v119) {
		this.v119 = v119;
	}

	public String getV120() {
		return v120;
	}

	public void setV120(String v120) {
		this.v120 = v120;
	}

	public String getV201() {
		return v201;
	}

	public void setV201(String v201) {
		this.v201 = v201;
	}

	public String getV202() {
		return v202;
	}

	public void setV202(String v202) {
		this.v202 = v202;
	}

	public String getV203() {
		return v203;
	}

	public void setV203(String v203) {
		this.v203 = v203;
	}

	public String getV204() {
		return v204;
	}

	public void setV204(String v204) {
		this.v204 = v204;
	}

	public String getV205() {
		return v205;
	}

	public void setV205(String v205) {
		this.v205 = v205;
	}

	public String getV206() {
		return v206;
	}

	public void setV206(String v206) {
		this.v206 = v206;
	}

	public String getV207() {
		return v207;
	}

	public void setV207(String v207) {
		this.v207 = v207;
	}

	public String getV208() {
		return v208;
	}

	public void setV208(String v208) {
		this.v208 = v208;
	}

	public String getV209() {
		return v209;
	}

	public void setV209(String v209) {
		this.v209 = v209;
	}

	public String getV210() {
		return v210;
	}

	public void setV210(String v210) {
		this.v210 = v210;
	}

	public String getV211() {
		return v211;
	}

	public void setV211(String v211) {
		this.v211 = v211;
	}

	public String getV212() {
		return v212;
	}

	public void setV212(String v212) {
		this.v212 = v212;
	}

	public String getV213() {
		return v213;
	}

	public void setV213(String v213) {
		this.v213 = v213;
	}

	public String getV214() {
		return v214;
	}

	public void setV214(String v214) {
		this.v214 = v214;
	}

	public String getV215() {
		return v215;
	}

	public void setV215(String v215) {
		this.v215 = v215;
	}

	public String getV216() {
		return v216;
	}

	public void setV216(String v216) {
		this.v216 = v216;
	}

	public String getV217() {
		return v217;
	}

	public void setV217(String v217) {
		this.v217 = v217;
	}

	public String getV218() {
		return v218;
	}

	public void setV218(String v218) {
		this.v218 = v218;
	}

	public String getV219() {
		return v219;
	}

	public void setV219(String v219) {
		this.v219 = v219;
	}

	public String getV220() {
		return v220;
	}

	public void setV220(String v220) {
		this.v220 = v220;
	}

	public String getV301() {
		return v301;
	}

	public void setV301(String v301) {
		this.v301 = v301;
	}

	public String getV302() {
		return v302;
	}

	public void setV302(String v302) {
		this.v302 = v302;
	}

	public String getV303() {
		return v303;
	}

	public void setV303(String v303) {
		this.v303 = v303;
	}

	public String getV304() {
		return v304;
	}

	public void setV304(String v304) {
		this.v304 = v304;
	}

	public String getV305() {
		return v305;
	}

	public void setV305(String v305) {
		this.v305 = v305;
	}

	public String getV306() {
		return v306;
	}

	public void setV306(String v306) {
		this.v306 = v306;
	}

	public String getV307() {
		return v307;
	}

	public void setV307(String v307) {
		this.v307 = v307;
	}

	public String getV308() {
		return v308;
	}

	public void setV308(String v308) {
		this.v308 = v308;
	}

	public String getV309() {
		return v309;
	}

	public void setV309(String v309) {
		this.v309 = v309;
	}

	public String getV310() {
		return v310;
	}

	public void setV310(String v310) {
		this.v310 = v310;
	}

	public String getV311() {
		return v311;
	}

	public void setV311(String v311) {
		this.v311 = v311;
	}

	public String getV312() {
		return v312;
	}

	public void setV312(String v312) {
		this.v312 = v312;
	}

	public String getV313() {
		return v313;
	}

	public void setV313(String v313) {
		this.v313 = v313;
	}

	public String getV314() {
		return v314;
	}

	public void setV314(String v314) {
		this.v314 = v314;
	}

	public String getV315() {
		return v315;
	}

	public void setV315(String v315) {
		this.v315 = v315;
	}

	public String getV316() {
		return v316;
	}

	public void setV316(String v316) {
		this.v316 = v316;
	}

	public String getV317() {
		return v317;
	}

	public void setV317(String v317) {
		this.v317 = v317;
	}

	public String getV318() {
		return v318;
	}

	public void setV318(String v318) {
		this.v318 = v318;
	}

	public String getV319() {
		return v319;
	}

	public void setV319(String v319) {
		this.v319 = v319;
	}

	public String getV320() {
		return v320;
	}

	public void setV320(String v320) {
		this.v320 = v320;
	}

	@Override
	public String toString() {
		return "AggregateCalculatedDto [stmtNo=" + stmtNo + ", comCode=" + comCode + ", yearOfAttr=" + yearOfAttr
				+ ", v101=" + v101 + ", v102=" + v102 + ", v103=" + v103 + ", v104=" + v104 + ", v105=" + v105
				+ ", v106=" + v106 + ", v107=" + v107 + ", v108=" + v108 + ", v109=" + v109 + ", v110=" + v110
				+ ", v111=" + v111 + ", v112=" + v112 + ", v113=" + v113 + ", v114=" + v114 + ", v115=" + v115
				+ ", v116=" + v116 + ", v117=" + v117 + ", v118=" + v118 + ", v119=" + v119 + ", v120=" + v120
				+ ", v201=" + v201 + ", v202=" + v202 + ", v203=" + v203 + ", v204=" + v204 + ", v205=" + v205
				+ ", v206=" + v206 + ", v207=" + v207 + ", v208=" + v208 + ", v209=" + v209 + ", v210=" + v210
				+ ", v211=" + v211 + ", v212=" + v212 + ", v213=" + v213 + ", v214=" + v214 + ", v215=" + v215
				+ ", v216=" + v216 + ", v217=" + v217 + ", v218=" + v218 + ", v219=" + v219 + ", v220=" + v220
				+ ", v301=" + v301 + ", v302=" + v302 + ", v303=" + v303 + ", v304=" + v304 + ", v305=" + v305
				+ ", v306=" + v306 + ", v307=" + v307 + ", v308=" + v308 + ", v309=" + v309 + ", v310=" + v310
				+ ", v311=" + v311 + ", v312=" + v312 + ", v313=" + v313 + ", v314=" + v314 + ", v315=" + v315
				+ ", v316=" + v316 + ", v317=" + v317 + ", v318=" + v318 + ", v319=" + v319 + ", v320=" + v320 + "]";
	}
	
	
	
	





}
