<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가경리</title>
<style>
#searchBtn{
		background: none;
		border: none;
		outline: none;
	}
#wrapp1 {
	float: left;
	width: 20%;
}

#wrapp2 {
	float: right;
	width: 70%;
}

#bonusArea {
	width: 100%;
}

#wrapp3 {
	display: inline-block;
	width: 35%;
}

#wrapp4 {
	display: inline-block;
	width: 60%;
}

#wrapp5 {
	float: left;
	width: 25%;
}

#wrapp6 {
	margin-left: 30px;
	float: left;
	width: 25%;
}

#wrapp7 {

	float: right;
	width: 45%;
	margin-bottom: 25px;
}

#wrapp8 {
	float: left;
	width: 35%;
}

#wrapp9 {
	margin-left: 30px;
	float: right;
	width: 60%;
}

#wrapp10 {
	margin-left: 30px;
	margin-top: 30px;
	float: right;
	width: 60%;
}

#taxArea {
	width: 100%;
}

main td {
	height: 30px;
}

main tr {
	height: 30px;
}

#empList {
	width: 100%;
	font-weight: bold;
	color: #4C4C4C;
}

#empList tr {
	border-bottom: 1px solid black;
	padding: 10px;
}

#empList td {
	padding: 10px;
}

#infoTable {
	width: 100%;
}

#infoTable td {
	padding-left: 5px;
	padding-bottom: 10px;
	padding-top: 10px;
}

#infoTable th:first-child {
	text-align: right;
	color: #4C4C4C;
	padding-right: 5px;
}

#infoTable th:nth-child(3) {
	text-align: right;
	color: #4C4C4C;
	padding-right: 5px;
}

#retireTable {
	width: 100%;
}

#retireTable td {
	padding-left: 5px;
	padding-bottom: 10px;
	padding-top: 10px;
}

#retireTable th:first-child {
	text-align: right;
	color: #4C4C4C;
	padding-right: 5px;
}

#retireTable th:nth-child(3) {
	text-align: right;
	color: #4C4C4C;
	padding-right: 5px;
}

#tabList {
	padding-top: 30px;
	padding-bottom: 30px;
}

#detailList {
	padding-top: 30px;
	padding-bottom: 30px;
}

#salaryTable {
	width: 60%;
}

#salaryTable th {
	background: #D9E3E3;
	text-align: center;
}
#salaryTable2 {
	width: 70%;
}

#salaryTable2 th {
	background: #D9E3E3;
	text-align: center;
}

#bonustable {
	width: 100%;
}

#caculTable {
	width: 100%;
	float: right;
	padding-top: 10px;
}

#retirePayTable {
	width: 100%;
}

#taxTable {
	width: 100%;
}

#calculDateTable {
	width: 100%;
}

#boundary {
	width: 100%;
	padding-bottom: 25px;
}

#taxArea th {
	background: #D9E3E3;
	text-align: center;
}

#boundaryTable {
	width: 100%;
}
#boundTable1 {
	width: 100%;
}
#boundTable2 {
	width: 100%;
}
#boundTable3 {
	width: 100%;
}

input {
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border: 1px solid lightgray;
}

#bonustable th {
	background: #D9E3E3;
	text-align: center;
}

#retireBtn {
	background: #296355;
	color: white;
	border: 1px solid #296355;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

#salaryBtn {
	background: #296355;
	color: white;
	border: 1px solid #296355;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

#bonusBtn{
	background: #296355;
	color: white;
	border: 1px solid #296355;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

#taxBtn{
	background: #296355;
	color: white;
	border: 1px solid #296355;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

#taxArea {
	display: none;
}
#bonusArea {
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<!-- 로딩? -->
	<div id="loading">
        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
    </div>
	<main>
	<div class="container-fluid">
		<h2 class="mt-4">퇴직금계산</h2>
		<div class="card mb-4">
			<div class="card-body">
				<div id="wrapp1">
					<form action="">
						<input type="text">
						<button id="searchBtn">
							<img alt="" src="${contextPath}/resources/images/search.PNG"
								width="20px" height="20px">
						</button>
					</form>
					<br>
					<table id="empList" style="text-align: center;">
						<c:forEach var="e" items="${ empList }" >
							<tr>
								<td><input type="checkbox" id="checkk"></td>
								<td>
								<a href="#" onclick="detail('${e.employeeCode}')"><c:out value="${ e.employeeNum }"/></a>
								</td>
								<td>
								<a href="#" onclick="detail('${e.employeeCode}')"><c:out value="${ e.employeeName }"/></a>
								</td>
							</tr>				
						</c:forEach>
					</table>

				</div>
				<form action="insertRetirement.rt" method="post">
				<input type="hidden" id="empCode" name="employeeCode">
				<div id="wrapp2">
				<button>확인</button>
					<table id="infoTable">
						<tr>
							<th>입사(정산시작)일</th>
							<td><input type="text" name="startDate" id="startDate"></td>
							<th>퇴사(정산종료)일</th>
							<td colspan="3"><input type="text" name="endDate" id="endDate"></td>
						</tr>
						<tr>
							<th>근속기간</th>
							<td><input type="text" name="longevity" id="longevity"></td>
							<th>제외월수</th>
							<td><input type="text" value="0"></td>
							<th>가산월수</th>
							<td><input type="text" value="0"></td>
						</tr>
						<tr>
							<th>실제 년/월/일별 근무월수</th>
							<td colspan="5"><input type="text" id="allYear">&nbsp;년/ <input
								type="text" id="allMonth">&nbsp;개월/ <input type="text" id="allDay">&nbsp;일
							</td>
						</tr>
					</table>

					<div id="tabList">
						<button type="button" id="retireBtn">퇴직금 계산</button>
						<button type="button"  id="taxBtn">소득세 계산</button>
					</div>

					<div id="retireArea">
						<table id="retireTable">
							<tr>
								<th rowspan="2">급여산정</th>
								<td colspan="3">①기간 <input type="text" name="totalSalaryStart" id="totalSalaryStart"> ~ <input
									type="text" name="totalSalaryEnd" id="totalSalaryEnd"></td>
							</tr>
							<tr>
								<td colspan="3">②산정계 <input type="text" id="totalSalary" name="totalSalary"> = (급여) <input
									type="text" name="salary" id="salary"> + (상여) <input type="text" id="bonus" name="bonus">
								</td>
							</tr>
							<tr>
								<th>평균임금</th>
								<td><input type="text" id="salaryAvg" name="salaryAvg"></td>
								<th>예상퇴직금</th>
								<td><input type="text" name="anticipateRtm" id="anticipateRtm"></td>
							</tr>
						</table>

						<div id="detailList">
							<button type="button"  id="salaryBtn">급여내역</button>
							<button  type="button" id="bonusBtn">상여내역</button>
						</div>

						<div id="salaryArea">
							<table id="salaryTable" border="1">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
									<col width="20%">
								</colgroup>
								<tr>
									<th>기간(에서)</th>
									<th></th>
									<th></th>
									<th></th>
									<th rowspan="2">합계</th>
								</tr>
								<tr>
									<th>기간(까지)</th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
								<tr>
									<th>일수</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
								<tr>
									<th>기본급</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>식대</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>자가운전보조금</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>육아보조금</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>야간근로수당</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>월차수당</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>직책수당</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>합계</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</table>
							<table id="salaryTable2" border="1" style="display:none;">
								<colgroup>
									<col width="20%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
								</colgroup>
								<tr>
									<th>기간(에서)</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th rowspan="2">합계</th>
								</tr>
								<tr>
									<th>기간(까지)</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
								<tr>
									<th>일수</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
								<tr>
									<th>기본급</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>식대</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>자가운전보조금</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>육아보조금</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>야간근로수당</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>월차수당</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>직책수당</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>합계</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</table>
						</div>

						<div id="bonusArea">
							<div id="wrapp3">
								<table id="bonustable" border="1">
									<colgroup>
										<col width="30%">
										<col width="30%">
									</colgroup>
									<thead>
									<tr>
										<th colspan="3">상여지급내역</th>
									</tr>
									<tr>
										<th>기간(년)</th>
										<th>기간(월)</th>
										<th>상여금</th>
									</tr>
									</thead>
									
									<tbody>
									
									</tbody>
									<tfoot>
									<tr>
										<th>합계</th>
										<th></th>
										<th></th>
									</tr>
									</tfoot>
								</table>
							</div>


							<div id="wrapp4">

								<table id="caculTable">
									<tr>
										<th colspan="2" style="background: #D9E3E3;">※ 예상퇴직금 계산식</th>
									</tr>
									<tr>
										<th>1.</th>
										<th>산정급여</th>
									</tr>
									<tr>
										<td></td>
										<td><input type="text" id="account1" style="width:100%;"></td>
									</tr>
									<tr>
										<th>2.</th>
										<th>산정상여(상여+연차수당)</th>
									</tr>
									<tr>
										<td></td>
										<td><input type="text" id="account2" style="width:100%;"></td>
									</tr>
									<tr>
										<th>3.</th>
										<th>산정계(1+2)</th>
									</tr>
									<tr>
										<td></td>
										<td><input type="text" id="account3" style="width:100%;"></td>
									</tr>
									<tr>
										<th>4.</th>
										<th>평균임금</th>
									</tr>
									<tr>
										<td></td>
										<td><input type="text" id="account4" style="width:100%;"></td>
									</tr>
									<tr>
										<th>5.</th>
										<th>예상퇴직금</th>
									</tr>
									<tr>
										<td></td>
										<td><input type="text" id="account5" style="width:100%;"></td>
									</tr>
									<tr>
										<th>※</th>
										<th>상여내역은 급여산정기간 종료월로부터 과거 1년까지의<br> 상여총액이 반영(단,
											계산방법 4.기간은 제외)
										</th>
									</tr>
								</table>
							</div>
						</div>
					</div>

					<div id="taxArea">
						<div id="wrapp5">
							<table id="retirePayTable" border="1">
								<colgroup>
									<col width="50%">
									<col width="50%">
								</colgroup>
								<tr>
									<th colspan="2">퇴직금 지급</th>
								</tr>
								<tr>
									<th>퇴직금</th>
									<td></td>
								</tr>
								<tr>
									<th>퇴직보험금</th>
									<td></td>
								</tr>
								<tr>
									<th>비과세소득</th>
									<td></td>
								</tr>
								<tr>
									<th>퇴직금지급계</th>
									<td></td>
								</tr>
							</table>
						</div>
						<div id="wrapp6">
							<table id="taxTable" border="1">
								<colgroup>
									<col width="50%">
									<col width="50%">
								</colgroup>
								<tr>
									<th colspan="2">공제 내역</th>
								</tr>
								<tr>
									<th>소득세</th>
									<td><input type="text" name="incomeTax" id="incomeTax" style="width:100%;"></td>
								</tr>
								<tr>
									<th>지방소득세</th>
									<td><input type="text" name="localIncomeTax" id="localIncomeTax" style="width:100%;"></td>
								</tr>
								<tr>
									<th>공제계</th>
									<td></td>
								</tr>
								<tr>
									<th>실제지급액</th>
									<td><input type="text" name="realRetirement" id="realRetirement" style="width:100%;"></td>
								</tr>
							</table>
						</div>
						<div id="wrapp7">
							<table id="calculDateTable" border="1">
								<tr>
									<th style="background: #24574A; color: white;">근속연수 계산</th>
								</tr>
								<tr>
									<td>1. 전체 근속연수<br> 개월 = 년 개월 = 년<br>
										2. 2012.12.31 이전 근속 년수/월수/일수<br> 개월 = 년 개월 = 년<br>
										3. 2013.01.01 이후 근속 년수/월수/일수<br> 개월 = 년 개월 = 년
									</td>
								</tr>
							</table>
						</div>
						
						<div id="boundary">
	
							<table id="boundaryTable" border="1">
								<tr>
									<th style="background: #24574A; color: white;">소득세 산출</th>
								</tr>
							</table>
						
						</div>
						
						<div id="wrapp8">
							<table id="boundTable1" border="1">
							<colgroup>
								<col width="50%">
								<col width="50%">
							</colgroup>
								<tr>
									<th colspan="2">퇴직과세표준계산(종전규정)</th>
								</tr>
								<tr>
									<th>퇴직소득</th>
									<td><input type="text" name="rtmBf" id="rtmBf" style="width:100%;"></td>
								</tr>
								<tr>
									<th>퇴직소득정률공제</th>
									<td><input type="text" name="rtmDecliningBf" id="rtmDecliningBf" style="width:100%;"></td>
								</tr>
								<tr>
									<th>근속연수공제</th>
									<td><input type="text" name="longevityDdcBf" id="longevityDdcBf" style="width:100%;"></td>
								</tr>
								<tr>
									<th>퇴직소득과세표준</th>
									<td><input type="text" name="rtmStdTaxBf" id="rtmStdTaxBf" style="width:100%;"></td>
								</tr>
								<tr>
									<th colspan="2">퇴직과세표준계산(개정규정)</th>
								</tr>
								<tr>
									<th>퇴직소득</th>
									<td><input type="text" name="rtmAf" id="rtmAf" style="width:100%;"></td>
								</tr>
								<tr>
									<th>근속연수공제</th>
									<td><input type="text" name="longevityDdcAf" id="longevityDdcAf" style="width:100%;"></td>
								</tr>
								<tr>
									<th>환산급여</th>
									<td><input type="text" name="exchangePymtAf" id="exchangePymtAf" style="width:100%;"></td>
								</tr>
								<tr>
									<th>환산급여별공제</th>
									<td><input type="text" name="exchPymtDdcAf" id="exchPymtDdcAf" style="width:100%;"></td>
								</tr>
								<tr>
									<th>퇴직소득과세표준</th>
									<td><input type="text" name="retireStdTaxAf" id="retireStdTaxAf" style="width:100%;"></td>
								</tr>
							</table>
						</div>
						
						<div id="wrapp9">
							<table id="boundTable2" border="1">
							<colgroup>
								<col width="25%">
								<col width="25%">
								<col width="25%">
									<col width="25%">
							</colgroup>
								<tr>
									<th>퇴직소득세액계산</th>
									<th>12.12.31 이전</th>
									<th>12.12.31 이후</th>
									<th>합계</th>
								</tr>
								<tr>
									<th>과세표준안분</th>
									<input type="hidden" name="rtaList[0].calculCode" value="10">
									<td><input type="text" name="rtaList[0].beforeLongevity" id="beforeLongevity0" style="width:100%;"></td>
									<td><input type="text" name="rtaList[0].afterLongevity" id="afterLongevity0" style="width:100%;"></td>
									<td><input type="text" name="rtaList[0].calculSum" id="calculSum0" style="width:100%;"></td>
								</tr>
								<tr>
									<th>연평균과세표준</th>
									<input type="hidden" name="rtaList[1].calculCode" value="20">
									<td><input type="text" name="rtaList[1].beforeLongevity" id="beforeLongevity1" style="width:100%;"></td>
									<td><input type="text" name="rtaList[1].afterLongevity" id="afterLongevity1" style="width:100%;"></td>
									<td><input type="text" name="rtaList[1].calculSum" id="calculSum1" style="width:100%;"></td>
								</tr>
								<tr>
									<th>환산과세표준</th>
									<input type="hidden" name="rtaList[2].calculCode" value="30">
									<td><input type="text" name="rtaList[2].beforeLongevity" id="beforeLongevity2" style="width:100%;"></td>
									<td><input type="text" name="rtaList[2].afterLongevity" id="afterLongevity2" style="width:100%;"></td>
									<td><input type="text" name="rtaList[2].calculSum" id="calculSum2" style="width:100%;"></td>
								</tr>
								<tr>
									<th>환산산출세액</th>
									<input type="hidden" name="rtaList[3].calculCode" value="40">
									<td><input type="text" name="rtaList[3].beforeLongevity" id="beforeLongevity3" style="width:100%;"></td>
									<td><input type="text" name="rtaList[3].afterLongevity" id="afterLongevity3" style="width:100%;"></td>
									<td><input type="text" name="rtaList[3].calculSum" id="calculSum3" style="width:100%;"></td>
								</tr>
								<tr>
									<th>연평균산출세액</th>
									<input type="hidden" name="rtaList[4].calculCode" value="50">
									<td><input type="text" name="rtaList[4].beforeLongevity" id="beforeLongevity4" style="width:100%;"></td>
									<td><input type="text" name="rtaList[4].afterLongevity" id="afterLongevity4" style="width:100%;"></td>
									<td><input type="text" name="rtaList[4].calculSum" id="calculSum4" style="width:100%;"></td>
								</tr>
								<tr>
									<th>산출세액</th>
									<input type="hidden" name="rtaList[5].calculCode" value="60">
									<td><input type="text" name="rtaList[5].beforeLongevity" id="beforeLongevity5" style="width:100%;"></td>
									<td><input type="text" name="rtaList[5].afterLongevity" id="afterLongevity5" style="width:100%;"></td>
									<td><input type="text" name="rtaList[5].calculSum" id="calculSum5" style="width:100%;"></td>
								</tr>
							</table>
						</div>
						
						<div id="wrapp10">
							<table id="boundTable3" border="1">
							<colgroup>
								<col width="50%">
								<col width="50%">
							</colgroup>
								<tr>
									<th colspan="2">개정규정에 따른 계산방법</th>
								</tr>
								<tr>
									<th>환산산출세액</th>
									<td><input type="text" name="exchCalculTaxAf" id="exchCalculTaxAf" style="width:100%;"></td>
								</tr>
								<tr>
									<th>환산산출세액</th>
									<td><input type="text" name="calculTaxAf" id="calculTaxAf" style="width:100%;"></td>
								</tr>
								<tr>
									<th colspan="2">퇴직소득 세액계산</th>
								</tr>
								<tr>
									<th>과세연도</th>
									<td><input type="text" name="rtmYear" id="rtmYear" style="width:100%;"></td>
								</tr>
								<tr>
									<th>퇴직소득세 산출세액</th>
									<td><input type="text" name="rtmCalculTax" id="rtmCalculTax" style="width:100%;"></td>
								</tr>
							</table>
						</div>
					</div>

					<div id="middleArea">
					
					</div>
				</div>
				</form>
			</div>
		</div>
		
		
		<script>
			/* 콤마 찍기 */
			function comma(str) {
				str = String(str);
				return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
			}
			
			/* 콤마 등 숫자 이외의 입력값 제거 */
			function uncomma(str) {
				str = String(str);
				return str.replace(/[^\d]+/g, "");
			}
			
			/* 값 입력시 콤마 찍기 */
			function inputNumberFormat(str) {
				$(str).val($(str).val().replace('+', '000'));
			    $(str).val(comma(uncomma($(str).val())));
			}
		
			var empCode = null;
			$(function(){
				$("#retireBtn").click(function(){
					$("#retireArea").css("display", "block");
					$("#taxArea").css("display", "none");
					$("#middleArea").css("display", "none");
					$("#salaryArea").css("display", "block");
					$("#bonusArea").css("display", "none");
				});
				$("#taxBtn").click(function(){
					$("#retireArea").css("display", "none");
					$("#taxArea").css("display", "block");
					$("#middleArea").css("display", "none");
				});
				$("#middleBtn").click(function(){
					$("#retireArea").css("display", "none");
					$("#taxArea").css("display", "none");
					$("#middleArea").css("display", "block");
				});
				$("#salaryBtn").click(function(){
					$("#retireArea").css("display", "block");
					$("#taxArea").css("display", "none");
					$("#middleArea").css("display", "none");
					$("#salaryArea").css("display", "block");
					$("#bonusArea").css("display", "none");
				});
				$("#bonusBtn").click(function(){
					$("#retireArea").css("display", "block");
					$("#taxArea").css("display", "none");
					$("#middleArea").css("display", "none");
					$("#salaryArea").css("display", "none");
					$("#bonusArea").css("display", "block");
					
					$.ajax({
						url:"bonusSearch.rt",
						data : {empCode:empCode},
						success:function(data){
							console.log(data);
							var list = data.bonusList;
							$("#bonustable tbody tr").remove();
							var $tbody = $("#bonustable tbody");
							
							for(var i = 0; i < list.length; i++){
								var $tr = $("<tr>");
								
								var $td1 = $("<td>").text(list[i].bonusYear + "년");
								var $td2 = $("<td>").text(list[i].bonusMonth + "월");
								var $td3 = $("<td>").text(comma(list[i].bonus));
								
								$tr.append($td1);
								$tr.append($td2);
								$tr.append($td3);
								$tbody.append($tr);
							}
							
						}
					});
					
				});
			});
			
			function detail(code){
				empCode = code;
				$.ajax({
					url:"detailRetirement.rt",
					data:{empCode:code},
					success:function(data){
						var info = data.info;
						var r = data.retirement;
						console.log(r);
						
						$("#empCode").val(info.employeeCode);
						$("#startDate").val(info.enrollDate);
						$("#endDate").val(info.leaveDate);
						$("#bonus").val(comma(info.avgBonus));
						$("#allYear").val(info.allYear);
						$("#allMonth").val(info.allMonth);
						$("#allDay").val(info.allDay);
						$("#longevity").val(info.year + " 년 " + info.month + " 월 " + info.day + " 일");
						$("#totalSalaryStart").val(info.threeBeforeMonth);
						$("#totalSalaryEnd").val(info.leaveDate);
						$("#salary").val(comma(info.sumAllSalary));
						$("#totalSalary").val(comma(info.sumAllSalary+info.avgBonus));
						$("#salaryAvg").val(comma(data.salaryAvg));
						$("#anticipateRtm").val(comma(data.anticipateRtm));
						
						$("#realRetirement").val(comma(r.realRetirement));
						$("#incomeTax").val(comma(r.incomeTax));
						$("#localIncomeTax").val(comma(r.localIncomeTax));
						
						$("#account1").val(comma(info.sumAllSalary));
						$("#account2").val(comma(info.avgBonus) + " = " + comma(info.sumBonus) + " * 3 / 12");
						$("#account3").val(comma(info.sumAllSalary+info.avgBonus) + " = " + comma(info.sumAllSalary) + " + " + comma(info.avgBonus));
						$("#account4").val(comma(data.salaryAvg) + " = " + comma(info.sumAllSalary+info.avgBonus) + " / 3");
						$("#account5").val(comma(data.anticipateRtm) + " = " + comma(data.salaryAvg) + " * " + info.allDay + " / 365");
						
						$("#bonustable tfoot th:nth-child(2)").text(comma(info.sumBonus));
						$("#retirePayTable tr:nth-child(2) td:nth-child(2)").text(comma(data.anticipateRtm));
						
						$("#calculDateTable td").html("1. 전체 근속연수<br> " 
								+ info.ttAll + " 개월 = " 	+ info.ttAllYear + "년 " + info.ttAllMonth + " 개월 = " + info.ttAllAllYear 
								+" 년<br>2. 2012.12.31 이전 근속 년수/월수/일수<br>"
								+ info.ttBMonth + " 개월 = "+ info.ttBAllYear + " 년 " + info.ttBAllMonth + " 개월 = "	+ info.ttBAllAllYear +
								" 년<br>3. 2013.01.01 이후 근속 년수/월수/일수<br> "+ info.ttAllAllYear +" 년 - "+ info.ttBAllAllYear +" 년  = " +  info.ttAYear+" 년");
						
						$("#rtmBf").val(comma(data.anticipateRtm));
						$("#rtmDecliningBf").val(comma(r.rtmDecliningBf));
						$("#longevityDdcBf").val(comma(r.longevityDdcBf));
						$("#rtmStdTaxBf").val(comma(r.rtmStdTaxBf));
						$("#rtmAf").val(comma(data.anticipateRtm));
						$("#longevityDdcAf").val(comma(r.longevityDdcAf));
						$("#exchangePymtAf").val(comma(r.exchangePymtAf));
						$("#exchPymtDdcAf").val(comma(r.exchPymtDdcAf));
						$("#retireStdTaxAf").val(comma(r.retireStdTaxAf));
						$("#exchCalculTaxAf").val(comma(r.exchCalculTaxAf));
						$("#calculTaxAf").val(comma(r.calculTaxAf));
						$("#rtmCalculTax").val(comma(r.rtmCalculTax));
						$("#rtmYear").val(r.rtmYear);
						$("#beforeLongevity0").val(comma(r.rtaList[0].beforeLongevity));
						$("#beforeLongevity1").val(comma(r.rtaList[1].beforeLongevity));
						$("#beforeLongevity2").val(comma(r.rtaList[2].beforeLongevity));
						$("#beforeLongevity3").val(comma(r.rtaList[3].beforeLongevity));
						$("#beforeLongevity4").val(comma(r.rtaList[4].beforeLongevity));
						$("#beforeLongevity5").val(comma(r.rtaList[5].beforeLongevity));
						$("#afterLongevity0").val(comma(r.rtaList[0].afterLongevity));
						$("#afterLongevity1").val(comma(r.rtaList[1].afterLongevity));
						$("#afterLongevity2").val(comma(r.rtaList[2].afterLongevity));
						$("#afterLongevity3").val(comma(r.rtaList[3].afterLongevity));
						$("#afterLongevity4").val(comma(r.rtaList[4].afterLongevity));
						$("#afterLongevity5").val(comma(r.rtaList[5].afterLongevity));
						$("#calculSum0").val(comma(r.rtaList[0].calculSum));
						$("#calculSum1").val(comma(r.rtaList[1].calculSum));
						$("#calculSum2").val(comma(r.rtaList[2].calculSum));
						$("#calculSum3").val(comma(r.rtaList[3].calculSum));
						$("#calculSum4").val(comma(r.rtaList[4].calculSum));
						$("#calculSum5").val(comma(r.rtaList[5].calculSum));
						
						
						if(info.retirementDTO2.length = 4){
							$("#salaryTable").css("display", "none");
							$("#salaryTable2").css("display", "table");
							
							$("#salaryTable2 tr:first-child th:nth-child(2)").text(info.retirementDTO2[0].thisMonthFirstday);
							$("#salaryTable2 tr:first-child th:nth-child(3)").text(info.retirementDTO2[1].thisMonthFirstday);
							$("#salaryTable2 tr:first-child th:nth-child(4)").text(info.retirementDTO2[2].thisMonthFirstday);
							$("#salaryTable2 tr:first-child th:nth-child(5)").text(info.retirementDTO2[3].thisMonthFirstday);
							
							$("#salaryTable2 tr:nth-child(2) th:nth-child(2)").text(info.retirementDTO2[0].thisMonthLastday);
							$("#salaryTable2 tr:nth-child(2) th:nth-child(3)").text(info.retirementDTO2[1].thisMonthLastday);
							$("#salaryTable2 tr:nth-child(2) th:nth-child(4)").text(info.retirementDTO2[2].thisMonthLastday);
							$("#salaryTable2 tr:nth-child(2) th:nth-child(5)").text(info.retirementDTO2[3].thisMonthLastday);
							
							$("#salaryTable2 tr:nth-child(3) th:nth-child(2)").text(info.lastThree);
							$("#salaryTable2 tr:nth-child(3) th:nth-child(3)").text(info.retirementDTO2[1].thisMonthLastday.substr(8,2)-info.retirementDTO2[1].thisMonthFirstday.substr(8,2));
							$("#salaryTable2 tr:nth-child(3) th:nth-child(4)").text(info.retirementDTO2[2].thisMonthLastday.substr(8,2)-info.retirementDTO2[1].thisMonthFirstday.substr(8,2));
							$("#salaryTable2 tr:nth-child(3) th:nth-child(5)").text(info.retirementDTO2[3].thisMonthLastday.substr(8,2)-info.retirementDTO2[1].thisMonthFirstday.substr(8,2));
							
							$("#salaryTable2 tr:nth-child(4) td:nth-child(2)").text(comma(info.retirementDTO2[0].salary));
							$("#salaryTable2 tr:nth-child(4) td:nth-child(3)").text(comma(info.retirementDTO2[1].salary));
							$("#salaryTable2 tr:nth-child(4) td:nth-child(4)").text(comma(info.retirementDTO2[2].salary));
							$("#salaryTable2 tr:nth-child(4) td:nth-child(5)").text(comma(info.retirementDTO2[3].salary));
							$("#salaryTable2 tr:nth-child(4) td:nth-child(6)").text(comma(info.sumSalary));
							
							$("#salaryTable2 tr:nth-child(5) td:nth-child(2)").text(comma(info.retirementDTO2[0].meals));
							$("#salaryTable2 tr:nth-child(5) td:nth-child(3)").text(comma(info.retirementDTO2[1].meals));
							$("#salaryTable2 tr:nth-child(5) td:nth-child(4)").text(comma(info.retirementDTO2[2].meals));
							$("#salaryTable2 tr:nth-child(5) td:nth-child(5)").text(comma(info.retirementDTO2[3].meals));
							$("#salaryTable2 tr:nth-child(5) td:nth-child(6)").text(comma(info.sumMeals));
							
							$("#salaryTable2 tr:nth-child(6) td:nth-child(2)").text(comma(info.retirementDTO2[0].drivingSubsidies));
							$("#salaryTable2 tr:nth-child(6) td:nth-child(3)").text(comma(info.retirementDTO2[1].drivingSubsidies));
							$("#salaryTable2 tr:nth-child(6) td:nth-child(4)").text(comma(info.retirementDTO2[2].drivingSubsidies));
							$("#salaryTable2 tr:nth-child(6) td:nth-child(5)").text(comma(info.retirementDTO2[3].drivingSubsidies));
							$("#salaryTable2 tr:nth-child(6) td:nth-child(6)").text(comma(info.sumDrivingSubsidies));
							
							$("#salaryTable2 tr:nth-child(7) td:nth-child(2)").text(comma(info.retirementDTO2[0].childcareAllowance));
							$("#salaryTable2 tr:nth-child(7) td:nth-child(3)").text(comma(info.retirementDTO2[1].childcareAllowance));
							$("#salaryTable2 tr:nth-child(7) td:nth-child(4)").text(comma(info.retirementDTO2[2].childcareAllowance));
							$("#salaryTable2 tr:nth-child(7) td:nth-child(5)").text(comma(info.retirementDTO2[3].childcareAllowance));
							$("#salaryTable2 tr:nth-child(7) td:nth-child(6)").text(comma(info.sumChildcareAllowance));
							
							$("#salaryTable2 tr:nth-child(8) td:nth-child(2)").text(comma(info.retirementDTO2[0].nightpay));
							$("#salaryTable2 tr:nth-child(8) td:nth-child(3)").text(comma(info.retirementDTO2[1].nightpay));
							$("#salaryTable2 tr:nth-child(8) td:nth-child(4)").text(comma(info.retirementDTO2[2].nightpay));
							$("#salaryTable2 tr:nth-child(8) td:nth-child(5)").text(comma(info.retirementDTO2[3].nightpay));
							$("#salaryTable2 tr:nth-child(8) td:nth-child(6)").text(comma(info.sumNightpay));
							
							$("#salaryTable2 tr:nth-child(9) td:nth-child(2)").text(comma(info.retirementDTO2[0].monthlypay));
							$("#salaryTable2 tr:nth-child(9) td:nth-child(3)").text(comma(info.retirementDTO2[1].monthlypay));
							$("#salaryTable2 tr:nth-child(9) td:nth-child(4)").text(comma(info.retirementDTO2[2].monthlypay));
							$("#salaryTable2 tr:nth-child(9) td:nth-child(5)").text(comma(info.retirementDTO2[3].monthlypay));
							$("#salaryTable2 tr:nth-child(9) td:nth-child(6)").text(comma(info.sumMonthlypay));
							
							$("#salaryTable2 tr:nth-child(10) td:nth-child(2)").text(comma(info.retirementDTO2[0].positionpay));
							$("#salaryTable2 tr:nth-child(10) td:nth-child(3)").text(comma(info.retirementDTO2[1].positionpay));
							$("#salaryTable2 tr:nth-child(10) td:nth-child(4)").text(comma(info.retirementDTO2[2].positionpay));
							$("#salaryTable2 tr:nth-child(10) td:nth-child(5)").text(comma(info.retirementDTO2[3].positionpay));
							$("#salaryTable2 tr:nth-child(10) td:nth-child(6)").text(comma(info.sumPositionpay));
							
							$("#salaryTable2 tr:nth-child(11) th:nth-child(2)").text(comma(info.retirementDTO2[0].sumThisMonth));
							$("#salaryTable2 tr:nth-child(11) th:nth-child(3)").text(comma(info.retirementDTO2[1].sumThisMonth));
							$("#salaryTable2 tr:nth-child(11) th:nth-child(4)").text(comma(info.retirementDTO2[2].sumThisMonth));
							$("#salaryTable2 tr:nth-child(11) th:nth-child(5)").text(comma(info.retirementDTO2[3].sumThisMonth));
							$("#salaryTable2 tr:nth-child(11) th:nth-child(6)").text(comma(info.sumAllSalary));
						}else if(info.retirementDTO2.length = 3){
							$("#salaryTable2").css("display", "none");
							$("#salaryTable").css("display", "table");
							
							$("#salaryTable tr:first-child th:nth-child(2)").text(info.retirementDTO2[0].thisMonthFirstday);
							$("#salaryTable tr:first-child th:nth-child(3)").text(info.retirementDTO2[1].thisMonthFirstday);
							$("#salaryTable tr:first-child th:nth-child(4)").text(info.retirementDTO2[2].thisMonthFirstday);
							$("#salaryTable tr:first-child th:nth-child(5)").text(info.retirementDTO2[3].thisMonthFirstday);
							
							$("#salaryTable tr:nth-child(2) th:nth-child(2)").text(info.retirementDTO2[0].thisMonthLastday);
							$("#salaryTable tr:nth-child(2) th:nth-child(3)").text(info.retirementDTO2[1].thisMonthLastday);
							$("#salaryTable tr:nth-child(2) th:nth-child(4)").text(info.retirementDTO2[2].thisMonthLastday);
							$("#salaryTable tr:nth-child(2) th:nth-child(5)").text(info.retirementDTO2[3].thisMonthLastday);
							
							$("#salaryTable2 tr:nth-child(3) th:nth-child(2)").text(info.lastThree);
							$("#salaryTable2 tr:nth-child(3) th:nth-child(3)").text(info.retirementDTO2[1].thisMonthLastday.substr(8,2)-info.retirementDTO2[1].thisMonthFirstday.substr(8,2));
							$("#salaryTable2 tr:nth-child(3) th:nth-child(4)").text(info.retirementDTO2[2].thisMonthLastday.substr(8,2)-info.retirementDTO2[1].thisMonthFirstday.substr(8,2));
							$("#salaryTable2 tr:nth-child(3) th:nth-child(5)").text(info.retirementDTO2[3].thisMonthLastday.substr(8,2)-info.retirementDTO2[1].thisMonthFirstday.substr(8,2));
							
							
							$("#salaryTable tr:nth-child(4) td:nth-child(2)").text(comma(info.retirementDTO2[0].salary));
							$("#salaryTable tr:nth-child(4) td:nth-child(3)").text(comma(info.retirementDTO2[1].salary));
							$("#salaryTable tr:nth-child(4) td:nth-child(4)").text(comma(info.retirementDTO2[2].salary));
							$("#salaryTable tr:nth-child(4) td:nth-child(5)").text(comma(info.retirementDTO2[3].salary));
							$("#salaryTable tr:nth-child(4) td:nth-child(6)").text(comma(info.sumSalary));
							
							$("#salaryTable tr:nth-child(5) td:nth-child(2)").text(comma(info.retirementDTO2[0].meals));
							$("#salaryTable tr:nth-child(5) td:nth-child(3)").text(comma(info.retirementDTO2[1].meals));
							$("#salaryTable tr:nth-child(5) td:nth-child(4)").text(comma(info.retirementDTO2[2].meals));
							$("#salaryTable tr:nth-child(5) td:nth-child(5)").text(comma(info.retirementDTO2[3].meals));
							$("#salaryTable tr:nth-child(5) td:nth-child(6)").text(comma(info.sumMeals));
							
							$("#salaryTable tr:nth-child(6) td:nth-child(2)").text(comma(info.retirementDTO2[0].drivingSubsidies));
							$("#salaryTable tr:nth-child(6) td:nth-child(3)").text(comma(info.retirementDTO2[1].drivingSubsidies));
							$("#salaryTable tr:nth-child(6) td:nth-child(4)").text(comma(info.retirementDTO2[2].drivingSubsidies));
							$("#salaryTable tr:nth-child(6) td:nth-child(5)").text(comma(info.retirementDTO2[3].drivingSubsidies));
							$("#salaryTable tr:nth-child(6) td:nth-child(6)").text(comma(info.sumDrivingSubsidies));
							
							$("#salaryTable tr:nth-child(7) td:nth-child(2)").text(comma(info.retirementDTO2[0].childcareAllowance));
							$("#salaryTable tr:nth-child(7) td:nth-child(3)").text(comma(info.retirementDTO2[1].childcareAllowance));
							$("#salaryTable tr:nth-child(7) td:nth-child(4)").text(comma(info.retirementDTO2[2].childcareAllowance));
							$("#salaryTable tr:nth-child(7) td:nth-child(5)").text(comma(info.retirementDTO2[3].childcareAllowance));
							$("#salaryTable tr:nth-child(7) td:nth-child(6)").text(comma(info.sumChildcareAllowance));
							
							$("#salaryTable tr:nth-child(8) td:nth-child(2)").text(comma(info.retirementDTO2[0].nightpay));
							$("#salaryTable tr:nth-child(8) td:nth-child(3)").text(comma(info.retirementDTO2[1].nightpay));
							$("#salaryTable tr:nth-child(8) td:nth-child(4)").text(comma(info.retirementDTO2[2].nightpay));
							$("#salaryTable tr:nth-child(8) td:nth-child(5)").text(comma(info.retirementDTO2[3].nightpay));
							$("#salaryTable tr:nth-child(8) td:nth-child(6)").text(comma(info.sumNightpay));
							
							$("#salaryTable tr:nth-child(9) td:nth-child(2)").text(comma(info.retirementDTO2[0].monthlypay));
							$("#salaryTable tr:nth-child(9) td:nth-child(3)").text(comma(info.retirementDTO2[1].monthlypay));
							$("#salaryTable tr:nth-child(9) td:nth-child(4)").text(comma(info.retirementDTO2[2].monthlypay));
							$("#salaryTable tr:nth-child(9) td:nth-child(5)").text(comma(info.retirementDTO2[3].monthlypay));
							$("#salaryTable tr:nth-child(9) td:nth-child(6)").text(comma(info.sumMonthlypay));
							
							$("#salaryTable tr:nth-child(10) td:nth-child(2)").text(comma(info.retirementDTO2[0].positionpay));
							$("#salaryTable tr:nth-child(10) td:nth-child(3)").text(comma(info.retirementDTO2[1].positionpay));
							$("#salaryTable tr:nth-child(10) td:nth-child(4)").text(comma(info.retirementDTO2[2].positionpay));
							$("#salaryTable tr:nth-child(10) td:nth-child(5)").text(comma(info.retirementDTO2[3].positionpay));
							$("#salaryTable tr:nth-child(10) td:nth-child(6)").text(comma(info.sumPositionpay));
							
							$("#salaryTable tr:nth-child(11) th:nth-child(2)").text(comma(info.retirementDTO2[0].sumThisMonth));
							$("#salaryTable tr:nth-child(11) th:nth-child(3)").text(comma(info.retirementDTO2[1].sumThisMonth));
							$("#salaryTable tr:nth-child(11) th:nth-child(4)").text(comma(info.retirementDTO2[2].sumThisMonth));
							$("#salaryTable tr:nth-child(11) th:nth-child(5)").text(comma(info.retirementDTO2[3].sumThisMonth));
							$("#salaryTable tr:nth-child(11) th:nth-child(6)").text(comma(info.sumAllSalary));
						}
						
						
					}
					
				});
			}
			
			
		</script>
		
		
		
		<div style="height: 10vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>