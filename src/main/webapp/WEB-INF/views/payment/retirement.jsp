<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<tr>
							<td><input type="checkbox" id="checkk"></td>
							<td>10001</td>
							<td>최새우</td>
						</tr>
					</table>

				</div>

				<div id="wrapp2">
					<table id="infoTable">
						<tr>
							<th>입사(정산시작)일</th>
							<td><input type="text"></td>
							<th>퇴사(정산종료)일</th>
							<td colspan="3"><input></td>
						</tr>
						<tr>
							<th>근속기간</th>
							<td><input type="text"></td>
							<th>제외월수</th>
							<td><input type="text"></td>
							<th>가산월수</th>
							<td><input type="text"></td>
						</tr>
						<tr>
							<th>실제 년/월/일별 근무월수</th>
							<td colspan="5"><input type="text">&nbsp;년/ <input
								type="text">&nbsp;개월/ <input type="text">&nbsp;일
							</td>
						</tr>
					</table>

					<div id="tabList">
						<button id="retireBtn">퇴직금 계산</button>
						<button id="taxBtn">소득세 계산</button>
						<button id="middleBtn">중간정산내역</button>
					</div>

					<div id="retireArea">
						<table id="retireTable">
							<tr>
								<th rowspan="2">급여산정</th>
								<td colspan="3">①기간 <input type="date"> ~ <input
									type="date"></td>
							</tr>
							<tr>
								<td colspan="3">②산정계 <input type="text"> = (급여) <input
									type="text"> + (상여) <input type="text">
								</td>
							</tr>
							<tr>
								<th>평균임금</th>
								<td><input type="text"></td>
								<th>예상퇴직금</th>
								<td><input type="text"></td>
							</tr>
						</table>

						<div id="detailList">
							<button id="salaryBtn">급여내역</button>
							<button id="bonusBtn">상여내역</button>
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
									<th></th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th></th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th></th>
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
						</div>

						<div id="bonusArea">
							<div id="wrapp3">
								<table id="bonustable" border="1">
									<colgroup>
										<col width="30%">
										<col width="30%">
									</colgroup>
									<tr>
										<th colspan="3">상여지급내역</th>
									</tr>
									<tr>
										<th>기간(년)</th>
										<th>기간(월)</th>
										<th>상여금</th>
									</tr>
									<tr>
										<td>2020년</td>
										<td>01월</td>
										<td></td>
									</tr>
									<tr>
										<td>2020년</td>
										<td>01월</td>
										<td></td>
									</tr>
									<tr>
										<td>2020년</td>
										<td>01월</td>
										<td></td>
									</tr>
									<tr>
										<td>2020년</td>
										<td>01월</td>
										<td></td>
									</tr>
									<tr>
										<td>2020년</td>
										<td>01월</td>
										<td></td>
									</tr>
									<tr>
										<td>2020년</td>
										<td>01월</td>
										<td></td>
									</tr>
									<tr>
										<td>2020년</td>
										<td>01월</td>
										<td></td>
									</tr>
									<tr>
										<td>2020년</td>
										<td>01월</td>
										<td></td>
									</tr>
									<tr>
										<td>2020년</td>
										<td>01월</td>
										<td></td>
									</tr>
									<tr>
										<td>2020년</td>
										<td>01월</td>
										<td></td>
									</tr>
									<tr>
										<td>2020년</td>
										<td>01월</td>
										<td></td>
									</tr>
									<tr>
										<td>2020년</td>
										<td>01월</td>
										<td></td>
									</tr>
									<tr>
										<th>합계</th>
										<th></th>
										<th></th>
									</tr>
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
										<td><input type="text"></td>
									</tr>
									<tr>
										<th>2.</th>
										<th>산정상여(상여+연차수당)</th>
									</tr>
									<tr>
										<td></td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th>3.</th>
										<th>산정계(1+2)</th>
									</tr>
									<tr>
										<td></td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th>4.</th>
										<th>평균임금</th>
									</tr>
									<tr>
										<td></td>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th>5.</th>
										<th>예상퇴직금</th>
									</tr>
									<tr>
										<td></td>
										<td><input type="text"></td>
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
									<td></td>
								</tr>
								<tr>
									<th>지방소득세</th>
									<td></td>
								</tr>
								<tr>
									<th>공제계</th>
									<td></td>
								</tr>
								<tr>
									<th>실제지급액</th>
									<td></td>
								</tr>
							</table>
						</div>
						<div id="wrapp7">
							<table id="calculDateTable" border="1">
								<tr>
									<th style="background: #24574A; color: white;">근속연수 계산</th>
								</tr>
								<tr>
									<td>1. 전체 근속연수<br> 개월 = 년 개월 = 년<br> 2.
										2012.12.31 이전 근속 년수/월수/일수<br> 개월 = 년 개월 = 년<br> 3.
										2013.01.01 이후 근속 년수/월수/일수<br> 개월 = 년 개월 = 년
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
									<td></td>
								</tr>
								<tr>
									<th>퇴직소득정률공제</th>
									<td></td>
								</tr>
								<tr>
									<th>근속연수공제</th>
									<td></td>
								</tr>
								<tr>
									<th>퇴직소득과세표준</th>
									<td></td>
								</tr>
								<tr>
									<th colspan="2">퇴직과세표준계산(개정규정)</th>
								</tr>
								<tr>
									<th>퇴직소득</th>
									<td></td>
								</tr>
								<tr>
									<th>근속연수공제</th>
									<td></td>
								</tr>
								<tr>
									<th>환산급여</th>
									<td></td>
								</tr>
								<tr>
									<th>환산급여별공제</th>
									<td></td>
								</tr>
								<tr>
									<th>퇴직소득과세표준</th>
									<td></td>
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
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>연평균과세표준</th>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>환산과세표준</th>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>환산산출세액</th>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>연평균산출세액</th>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th>산출세액</th>
									<td></td>
									<td></td>
									<td></td>
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
									<td></td>
								</tr>
								<tr>
									<th>환산산출세액</th>
									<td></td>
								</tr>
								<tr>
									<th colspan="2">퇴직소득 세액계산</th>
								</tr>
								<tr>
									<th>과세연도</th>
									<td></td>
								</tr>
								<tr>
									<th>퇴직소득세 산출세액</th>
									<td></td>
								</tr>
							</table>
						</div>
					</div>

					<div id="middleArea">
					
					</div>
				</div>

			</div>
		</div>
		
		
		<script>
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
				});
			});
		</script>
		
		
		
		<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>