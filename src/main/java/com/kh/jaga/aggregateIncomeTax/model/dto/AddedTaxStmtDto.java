package com.kh.jaga.aggregateIncomeTax.model.dto;

import java.math.BigDecimal;

/**
 * @author SWY
 * @comment 종합소득세 > 가산명세서
 * @createDate 2020. 4. 29.
 */
public class AddedTaxStmtDto {
	String STMT_NO;
	String ATTR_YEAR;
	String COM_CODE;
	BigDecimal in101;
	BigDecimal in102;
	BigDecimal in103;
	BigDecimal in104;
	BigDecimal in201;
	BigDecimal in202;
	BigDecimal in203;
	BigDecimal in301;
	BigDecimal in302;
	BigDecimal in401;
	BigDecimal in402;
	BigDecimal in403;
	BigDecimal in404;
	BigDecimal in405;
	BigDecimal in406;
	BigDecimal in407;
	BigDecimal in408;
	BigDecimal in409;
	BigDecimal in410;
	BigDecimal in411;
	BigDecimal in412;
	BigDecimal in501;
	BigDecimal in502;
	BigDecimal in601;
	BigDecimal in602;
	BigDecimal in701;
	BigDecimal in702;
	BigDecimal in801;
	BigDecimal in802;
	BigDecimal in901;
	BigDecimal in1001;
	BigDecimal in1002;
	BigDecimal in1101;
	BigDecimal in1102;
	BigDecimal in1103;
	BigDecimal in1201;
	BigDecimal in1202;
	BigDecimal in1203;
	BigDecimal in1204;
	BigDecimal in1205;
	BigDecimal in1301;
	BigDecimal in1302;
	BigDecimal in1501;
	BigDecimal in1601;
	BigDecimal sumLeft;
	BigDecimal v101;
	BigDecimal v102;
	BigDecimal v103;
	BigDecimal v104;
	BigDecimal v201;
	BigDecimal v202;
	BigDecimal v203;
	BigDecimal v301;
	BigDecimal v302;
	BigDecimal v401;
	BigDecimal v402;
	BigDecimal v403;
	BigDecimal v404;
	BigDecimal v405;
	BigDecimal v406;
	BigDecimal v407;
	BigDecimal v408;
	BigDecimal v409;
	BigDecimal v410;
	BigDecimal v411;
	BigDecimal v412;
	BigDecimal v501;
	BigDecimal v502;
	BigDecimal v601;
	BigDecimal v602;
	BigDecimal v701;
	BigDecimal v702;
	BigDecimal v801;
	BigDecimal v802;
	BigDecimal v901;
	BigDecimal v1001;
	BigDecimal v1002;
	BigDecimal v1101;
	BigDecimal v1102;
	BigDecimal v1103;
	BigDecimal v1201;
	BigDecimal v1202;
	BigDecimal v1203;
	BigDecimal v1204;
	BigDecimal v1205;
	BigDecimal v1301;
	BigDecimal v1302;
	BigDecimal v1501;
	BigDecimal v1601;
	BigDecimal sumRight;

	public AddedTaxStmtDto() {
	} // 기본생성자

	public AddedTaxStmtDto(String sTMT_NO, String aTTR_YEAR, String cOM_CODE, BigDecimal in101, BigDecimal in102,
			BigDecimal in103, BigDecimal in104, BigDecimal in201, BigDecimal in202, BigDecimal in203, BigDecimal in301,
			BigDecimal in302, BigDecimal in401, BigDecimal in402, BigDecimal in403, BigDecimal in404, BigDecimal in405,
			BigDecimal in406, BigDecimal in407, BigDecimal in408, BigDecimal in409, BigDecimal in410, BigDecimal in411,
			BigDecimal in412, BigDecimal in501, BigDecimal in502, BigDecimal in601, BigDecimal in602, BigDecimal in701,
			BigDecimal in702, BigDecimal in801, BigDecimal in802, BigDecimal in901, BigDecimal in1001,
			BigDecimal in1002, BigDecimal in1101, BigDecimal in1102, BigDecimal in1103, BigDecimal in1201,
			BigDecimal in1202, BigDecimal in1203, BigDecimal in1204, BigDecimal in1205, BigDecimal in1301,
			BigDecimal in1302, BigDecimal in1501, BigDecimal in1601, BigDecimal sumLeft, BigDecimal v101,
			BigDecimal v102, BigDecimal v103, BigDecimal v104, BigDecimal v201, BigDecimal v202, BigDecimal v203,
			BigDecimal v301, BigDecimal v302, BigDecimal v401, BigDecimal v402, BigDecimal v403, BigDecimal v404,
			BigDecimal v405, BigDecimal v406, BigDecimal v407, BigDecimal v408, BigDecimal v409, BigDecimal v410,
			BigDecimal v411, BigDecimal v412, BigDecimal v501, BigDecimal v502, BigDecimal v601, BigDecimal v602,
			BigDecimal v701, BigDecimal v702, BigDecimal v801, BigDecimal v802, BigDecimal v901, BigDecimal v1001,
			BigDecimal v1002, BigDecimal v1101, BigDecimal v1102, BigDecimal v1103, BigDecimal v1201, BigDecimal v1202,
			BigDecimal v1203, BigDecimal v1204, BigDecimal v1205, BigDecimal v1301, BigDecimal v1302, BigDecimal v1501,
			BigDecimal v1601, BigDecimal sumRight) {
		super();
		STMT_NO = sTMT_NO;
		ATTR_YEAR = aTTR_YEAR;
		COM_CODE = cOM_CODE;
		this.in101 = in101;
		this.in102 = in102;
		this.in103 = in103;
		this.in104 = in104;
		this.in201 = in201;
		this.in202 = in202;
		this.in203 = in203;
		this.in301 = in301;
		this.in302 = in302;
		this.in401 = in401;
		this.in402 = in402;
		this.in403 = in403;
		this.in404 = in404;
		this.in405 = in405;
		this.in406 = in406;
		this.in407 = in407;
		this.in408 = in408;
		this.in409 = in409;
		this.in410 = in410;
		this.in411 = in411;
		this.in412 = in412;
		this.in501 = in501;
		this.in502 = in502;
		this.in601 = in601;
		this.in602 = in602;
		this.in701 = in701;
		this.in702 = in702;
		this.in801 = in801;
		this.in802 = in802;
		this.in901 = in901;
		this.in1001 = in1001;
		this.in1002 = in1002;
		this.in1101 = in1101;
		this.in1102 = in1102;
		this.in1103 = in1103;
		this.in1201 = in1201;
		this.in1202 = in1202;
		this.in1203 = in1203;
		this.in1204 = in1204;
		this.in1205 = in1205;
		this.in1301 = in1301;
		this.in1302 = in1302;
		this.in1501 = in1501;
		this.in1601 = in1601;
		this.sumLeft = sumLeft;
		this.v101 = v101;
		this.v102 = v102;
		this.v103 = v103;
		this.v104 = v104;
		this.v201 = v201;
		this.v202 = v202;
		this.v203 = v203;
		this.v301 = v301;
		this.v302 = v302;
		this.v401 = v401;
		this.v402 = v402;
		this.v403 = v403;
		this.v404 = v404;
		this.v405 = v405;
		this.v406 = v406;
		this.v407 = v407;
		this.v408 = v408;
		this.v409 = v409;
		this.v410 = v410;
		this.v411 = v411;
		this.v412 = v412;
		this.v501 = v501;
		this.v502 = v502;
		this.v601 = v601;
		this.v602 = v602;
		this.v701 = v701;
		this.v702 = v702;
		this.v801 = v801;
		this.v802 = v802;
		this.v901 = v901;
		this.v1001 = v1001;
		this.v1002 = v1002;
		this.v1101 = v1101;
		this.v1102 = v1102;
		this.v1103 = v1103;
		this.v1201 = v1201;
		this.v1202 = v1202;
		this.v1203 = v1203;
		this.v1204 = v1204;
		this.v1205 = v1205;
		this.v1301 = v1301;
		this.v1302 = v1302;
		this.v1501 = v1501;
		this.v1601 = v1601;
		this.sumRight = sumRight;
	}

	public String getSTMT_NO() {
		return STMT_NO;
	}

	public void setSTMT_NO(String sTMT_NO) {
		STMT_NO = sTMT_NO;
	}

	public String getATTR_YEAR() {
		return ATTR_YEAR;
	}

	public void setATTR_YEAR(String aTTR_YEAR) {
		ATTR_YEAR = aTTR_YEAR;
	}

	public String getCOM_CODE() {
		return COM_CODE;
	}

	public void setCOM_CODE(String cOM_CODE) {
		COM_CODE = cOM_CODE;
	}

	public BigDecimal getIn101() {
		return in101;
	}

	public void setIn101(BigDecimal in101) {
		this.in101 = in101;
	}

	public BigDecimal getIn102() {
		return in102;
	}

	public void setIn102(BigDecimal in102) {
		this.in102 = in102;
	}

	public BigDecimal getIn103() {
		return in103;
	}

	public void setIn103(BigDecimal in103) {
		this.in103 = in103;
	}

	public BigDecimal getIn104() {
		return in104;
	}

	public void setIn104(BigDecimal in104) {
		this.in104 = in104;
	}

	public BigDecimal getIn201() {
		return in201;
	}

	public void setIn201(BigDecimal in201) {
		this.in201 = in201;
	}

	public BigDecimal getIn202() {
		return in202;
	}

	public void setIn202(BigDecimal in202) {
		this.in202 = in202;
	}

	public BigDecimal getIn203() {
		return in203;
	}

	public void setIn203(BigDecimal in203) {
		this.in203 = in203;
	}

	public BigDecimal getIn301() {
		return in301;
	}

	public void setIn301(BigDecimal in301) {
		this.in301 = in301;
	}

	public BigDecimal getIn302() {
		return in302;
	}

	public void setIn302(BigDecimal in302) {
		this.in302 = in302;
	}

	public BigDecimal getIn401() {
		return in401;
	}

	public void setIn401(BigDecimal in401) {
		this.in401 = in401;
	}

	public BigDecimal getIn402() {
		return in402;
	}

	public void setIn402(BigDecimal in402) {
		this.in402 = in402;
	}

	public BigDecimal getIn403() {
		return in403;
	}

	public void setIn403(BigDecimal in403) {
		this.in403 = in403;
	}

	public BigDecimal getIn404() {
		return in404;
	}

	public void setIn404(BigDecimal in404) {
		this.in404 = in404;
	}

	public BigDecimal getIn405() {
		return in405;
	}

	public void setIn405(BigDecimal in405) {
		this.in405 = in405;
	}

	public BigDecimal getIn406() {
		return in406;
	}

	public void setIn406(BigDecimal in406) {
		this.in406 = in406;
	}

	public BigDecimal getIn407() {
		return in407;
	}

	public void setIn407(BigDecimal in407) {
		this.in407 = in407;
	}

	public BigDecimal getIn408() {
		return in408;
	}

	public void setIn408(BigDecimal in408) {
		this.in408 = in408;
	}

	public BigDecimal getIn409() {
		return in409;
	}

	public void setIn409(BigDecimal in409) {
		this.in409 = in409;
	}

	public BigDecimal getIn410() {
		return in410;
	}

	public void setIn410(BigDecimal in410) {
		this.in410 = in410;
	}

	public BigDecimal getIn411() {
		return in411;
	}

	public void setIn411(BigDecimal in411) {
		this.in411 = in411;
	}

	public BigDecimal getIn412() {
		return in412;
	}

	public void setIn412(BigDecimal in412) {
		this.in412 = in412;
	}

	public BigDecimal getIn501() {
		return in501;
	}

	public void setIn501(BigDecimal in501) {
		this.in501 = in501;
	}

	public BigDecimal getIn502() {
		return in502;
	}

	public void setIn502(BigDecimal in502) {
		this.in502 = in502;
	}

	public BigDecimal getIn601() {
		return in601;
	}

	public void setIn601(BigDecimal in601) {
		this.in601 = in601;
	}

	public BigDecimal getIn602() {
		return in602;
	}

	public void setIn602(BigDecimal in602) {
		this.in602 = in602;
	}

	public BigDecimal getIn701() {
		return in701;
	}

	public void setIn701(BigDecimal in701) {
		this.in701 = in701;
	}

	public BigDecimal getIn702() {
		return in702;
	}

	public void setIn702(BigDecimal in702) {
		this.in702 = in702;
	}

	public BigDecimal getIn801() {
		return in801;
	}

	public void setIn801(BigDecimal in801) {
		this.in801 = in801;
	}

	public BigDecimal getIn802() {
		return in802;
	}

	public void setIn802(BigDecimal in802) {
		this.in802 = in802;
	}

	public BigDecimal getIn901() {
		return in901;
	}

	public void setIn901(BigDecimal in901) {
		this.in901 = in901;
	}

	public BigDecimal getIn1001() {
		return in1001;
	}

	public void setIn1001(BigDecimal in1001) {
		this.in1001 = in1001;
	}

	public BigDecimal getIn1002() {
		return in1002;
	}

	public void setIn1002(BigDecimal in1002) {
		this.in1002 = in1002;
	}

	public BigDecimal getIn1101() {
		return in1101;
	}

	public void setIn1101(BigDecimal in1101) {
		this.in1101 = in1101;
	}

	public BigDecimal getIn1102() {
		return in1102;
	}

	public void setIn1102(BigDecimal in1102) {
		this.in1102 = in1102;
	}

	public BigDecimal getIn1103() {
		return in1103;
	}

	public void setIn1103(BigDecimal in1103) {
		this.in1103 = in1103;
	}

	public BigDecimal getIn1201() {
		return in1201;
	}

	public void setIn1201(BigDecimal in1201) {
		this.in1201 = in1201;
	}

	public BigDecimal getIn1202() {
		return in1202;
	}

	public void setIn1202(BigDecimal in1202) {
		this.in1202 = in1202;
	}

	public BigDecimal getIn1203() {
		return in1203;
	}

	public void setIn1203(BigDecimal in1203) {
		this.in1203 = in1203;
	}

	public BigDecimal getIn1204() {
		return in1204;
	}

	public void setIn1204(BigDecimal in1204) {
		this.in1204 = in1204;
	}

	public BigDecimal getIn1205() {
		return in1205;
	}

	public void setIn1205(BigDecimal in1205) {
		this.in1205 = in1205;
	}

	public BigDecimal getIn1301() {
		return in1301;
	}

	public void setIn1301(BigDecimal in1301) {
		this.in1301 = in1301;
	}

	public BigDecimal getIn1302() {
		return in1302;
	}

	public void setIn1302(BigDecimal in1302) {
		this.in1302 = in1302;
	}

	public BigDecimal getIn1501() {
		return in1501;
	}

	public void setIn1501(BigDecimal in1501) {
		this.in1501 = in1501;
	}

	public BigDecimal getIn1601() {
		return in1601;
	}

	public void setIn1601(BigDecimal in1601) {
		this.in1601 = in1601;
	}

	public BigDecimal getSumLeft() {
		return sumLeft;
	}

	public void setSumLeft(BigDecimal sumLeft) {
		this.sumLeft = sumLeft;
	}

	public BigDecimal getV101() {
		return v101;
	}

	public void setV101(BigDecimal v101) {
		this.v101 = v101;
	}

	public BigDecimal getV102() {
		return v102;
	}

	public void setV102(BigDecimal v102) {
		this.v102 = v102;
	}

	public BigDecimal getV103() {
		return v103;
	}

	public void setV103(BigDecimal v103) {
		this.v103 = v103;
	}

	public BigDecimal getV104() {
		return v104;
	}

	public void setV104(BigDecimal v104) {
		this.v104 = v104;
	}

	public BigDecimal getV201() {
		return v201;
	}

	public void setV201(BigDecimal v201) {
		this.v201 = v201;
	}

	public BigDecimal getV202() {
		return v202;
	}

	public void setV202(BigDecimal v202) {
		this.v202 = v202;
	}

	public BigDecimal getV203() {
		return v203;
	}

	public void setV203(BigDecimal v203) {
		this.v203 = v203;
	}

	public BigDecimal getV301() {
		return v301;
	}

	public void setV301(BigDecimal v301) {
		this.v301 = v301;
	}

	public BigDecimal getV302() {
		return v302;
	}

	public void setV302(BigDecimal v302) {
		this.v302 = v302;
	}

	public BigDecimal getV401() {
		return v401;
	}

	public void setV401(BigDecimal v401) {
		this.v401 = v401;
	}

	public BigDecimal getV402() {
		return v402;
	}

	public void setV402(BigDecimal v402) {
		this.v402 = v402;
	}

	public BigDecimal getV403() {
		return v403;
	}

	public void setV403(BigDecimal v403) {
		this.v403 = v403;
	}

	public BigDecimal getV404() {
		return v404;
	}

	public void setV404(BigDecimal v404) {
		this.v404 = v404;
	}

	public BigDecimal getV405() {
		return v405;
	}

	public void setV405(BigDecimal v405) {
		this.v405 = v405;
	}

	public BigDecimal getV406() {
		return v406;
	}

	public void setV406(BigDecimal v406) {
		this.v406 = v406;
	}

	public BigDecimal getV407() {
		return v407;
	}

	public void setV407(BigDecimal v407) {
		this.v407 = v407;
	}

	public BigDecimal getV408() {
		return v408;
	}

	public void setV408(BigDecimal v408) {
		this.v408 = v408;
	}

	public BigDecimal getV409() {
		return v409;
	}

	public void setV409(BigDecimal v409) {
		this.v409 = v409;
	}

	public BigDecimal getV410() {
		return v410;
	}

	public void setV410(BigDecimal v410) {
		this.v410 = v410;
	}

	public BigDecimal getV411() {
		return v411;
	}

	public void setV411(BigDecimal v411) {
		this.v411 = v411;
	}

	public BigDecimal getV412() {
		return v412;
	}

	public void setV412(BigDecimal v412) {
		this.v412 = v412;
	}

	public BigDecimal getV501() {
		return v501;
	}

	public void setV501(BigDecimal v501) {
		this.v501 = v501;
	}

	public BigDecimal getV502() {
		return v502;
	}

	public void setV502(BigDecimal v502) {
		this.v502 = v502;
	}

	public BigDecimal getV601() {
		return v601;
	}

	public void setV601(BigDecimal v601) {
		this.v601 = v601;
	}

	public BigDecimal getV602() {
		return v602;
	}

	public void setV602(BigDecimal v602) {
		this.v602 = v602;
	}

	public BigDecimal getV701() {
		return v701;
	}

	public void setV701(BigDecimal v701) {
		this.v701 = v701;
	}

	public BigDecimal getV702() {
		return v702;
	}

	public void setV702(BigDecimal v702) {
		this.v702 = v702;
	}

	public BigDecimal getV801() {
		return v801;
	}

	public void setV801(BigDecimal v801) {
		this.v801 = v801;
	}

	public BigDecimal getV802() {
		return v802;
	}

	public void setV802(BigDecimal v802) {
		this.v802 = v802;
	}

	public BigDecimal getV901() {
		return v901;
	}

	public void setV901(BigDecimal v901) {
		this.v901 = v901;
	}

	public BigDecimal getV1001() {
		return v1001;
	}

	public void setV1001(BigDecimal v1001) {
		this.v1001 = v1001;
	}

	public BigDecimal getV1002() {
		return v1002;
	}

	public void setV1002(BigDecimal v1002) {
		this.v1002 = v1002;
	}

	public BigDecimal getV1101() {
		return v1101;
	}

	public void setV1101(BigDecimal v1101) {
		this.v1101 = v1101;
	}

	public BigDecimal getV1102() {
		return v1102;
	}

	public void setV1102(BigDecimal v1102) {
		this.v1102 = v1102;
	}

	public BigDecimal getV1103() {
		return v1103;
	}

	public void setV1103(BigDecimal v1103) {
		this.v1103 = v1103;
	}

	public BigDecimal getV1201() {
		return v1201;
	}

	public void setV1201(BigDecimal v1201) {
		this.v1201 = v1201;
	}

	public BigDecimal getV1202() {
		return v1202;
	}

	public void setV1202(BigDecimal v1202) {
		this.v1202 = v1202;
	}

	public BigDecimal getV1203() {
		return v1203;
	}

	public void setV1203(BigDecimal v1203) {
		this.v1203 = v1203;
	}

	public BigDecimal getV1204() {
		return v1204;
	}

	public void setV1204(BigDecimal v1204) {
		this.v1204 = v1204;
	}

	public BigDecimal getV1205() {
		return v1205;
	}

	public void setV1205(BigDecimal v1205) {
		this.v1205 = v1205;
	}

	public BigDecimal getV1301() {
		return v1301;
	}

	public void setV1301(BigDecimal v1301) {
		this.v1301 = v1301;
	}

	public BigDecimal getV1302() {
		return v1302;
	}

	public void setV1302(BigDecimal v1302) {
		this.v1302 = v1302;
	}

	public BigDecimal getV1501() {
		return v1501;
	}

	public void setV1501(BigDecimal v1501) {
		this.v1501 = v1501;
	}

	public BigDecimal getV1601() {
		return v1601;
	}

	public void setV1601(BigDecimal v1601) {
		this.v1601 = v1601;
	}

	public BigDecimal getSumRight() {
		return sumRight;
	}

	public void setSumRight(BigDecimal sumRight) {
		this.sumRight = sumRight;
	}

	@Override
	public String toString() {
		return "AddedTaxStmtDto [STMT_NO=" + STMT_NO + ", ATTR_YEAR=" + ATTR_YEAR + ", COM_CODE=" + COM_CODE
				+ ", in101=" + in101 + ", in102=" + in102 + ", in103=" + in103 + ", in104=" + in104 + ", in201=" + in201
				+ ", in202=" + in202 + ", in203=" + in203 + ", in301=" + in301 + ", in302=" + in302 + ", in401=" + in401
				+ ", in402=" + in402 + ", in403=" + in403 + ", in404=" + in404 + ", in405=" + in405 + ", in406=" + in406
				+ ", in407=" + in407 + ", in408=" + in408 + ", in409=" + in409 + ", in410=" + in410 + ", in411=" + in411
				+ ", in412=" + in412 + ", in501=" + in501 + ", in502=" + in502 + ", in601=" + in601 + ", in602=" + in602
				+ ", in701=" + in701 + ", in702=" + in702 + ", in801=" + in801 + ", in802=" + in802 + ", in901=" + in901
				+ ", in1001=" + in1001 + ", in1002=" + in1002 + ", in1101=" + in1101 + ", in1102=" + in1102
				+ ", in1103=" + in1103 + ", in1201=" + in1201 + ", in1202=" + in1202 + ", in1203=" + in1203
				+ ", in1204=" + in1204 + ", in1205=" + in1205 + ", in1301=" + in1301 + ", in1302=" + in1302
				+ ", in1501=" + in1501 + ", in1601=" + in1601 + ", sumLeft=" + sumLeft + ", v101=" + v101 + ", v102="
				+ v102 + ", v103=" + v103 + ", v104=" + v104 + ", v201=" + v201 + ", v202=" + v202 + ", v203=" + v203
				+ ", v301=" + v301 + ", v302=" + v302 + ", v401=" + v401 + ", v402=" + v402 + ", v403=" + v403
				+ ", v404=" + v404 + ", v405=" + v405 + ", v406=" + v406 + ", v407=" + v407 + ", v408=" + v408
				+ ", v409=" + v409 + ", v410=" + v410 + ", v411=" + v411 + ", v412=" + v412 + ", v501=" + v501
				+ ", v502=" + v502 + ", v601=" + v601 + ", v602=" + v602 + ", v701=" + v701 + ", v702=" + v702
				+ ", v801=" + v801 + ", v802=" + v802 + ", v901=" + v901 + ", v1001=" + v1001 + ", v1002=" + v1002
				+ ", v1101=" + v1101 + ", v1102=" + v1102 + ", v1103=" + v1103 + ", v1201=" + v1201 + ", v1202=" + v1202
				+ ", v1203=" + v1203 + ", v1204=" + v1204 + ", v1205=" + v1205 + ", v1301=" + v1301 + ", v1302=" + v1302
				+ ", v1501=" + v1501 + ", v1601=" + v1601 + ", sumRight=" + sumRight + "]";
	}

}// class
