<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

main table {
	width:100%;
}

main table th {
	background: #D9E3E3;
	border:1px solid #4C4C4C;
}
#wrapp2 table td {
	border:1px solid #4C4C4C;
}
main table tr:first-of-type th:first-of-type {
	width:50px;
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


input {
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border: 1px solid lightgray;
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
		<h2 class="mt-4">퇴직소득원천징수영수증</h2>
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
					<!-- 소득의무 -->
					<table id="table1">
						<tr>
							<th rowspan="2">소득<br>의무</th>
							<th colspan="2">귀속연도</th>
							<td colspan="2"></td>
							<th>12.퇴직사유</th>
							<td></td>
						</tr>
						<tr>
							<th>9.임원여부</th>
							<td>부</td>
							<th>10.퇴직연금제도가입일</th>
							<td></td>
							<th>2011.12.31 퇴직금</th>
							<td></td>
						</tr>
					</table>
					<!-- 퇴직급여현황 -->
					<table>
						<tr>
							<th rowspan="6">퇴직<br>급여<br>현황</th>
							<th>근무처구분</th>
							<th>중간지급등</th>
							<th>최종</th>
							<th>정산</th>
						</tr>
						<tr>
							<th>13.근무처명</th>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>14.사업자등록번호</th>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>15.퇴직급여</th>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>16.비과세 퇴직급여</th>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>17.과세대상 퇴직급여(15-16)</th>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<!-- 근속연수 -->
					<table>
						<tr>
							<th rowspan="6">근속<br>연수</th>
							<th colspan="2">구분</th>
							<th>입사일</th>
							<th>기산일</th>
							<th>퇴사일</th>
							<th>지급일</th>
							<th>근속월수</th>
							<th>제외월수</th>
							<th>가산월수</th>
							<th>중복월수</th>
							<th>근속연수</th>
						</tr>
						<tr>
							<th colspan="2">중간지급 근속연수</th>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th colspan="2">최종 근속연수</th>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th colspan="2">정산 근속연수</th>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th rowspan="2">안분</th>
							<th>2012.12.31이전</th>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>2013.01.01이후</th>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<!-- 과세표준계산 -->
					<table>
						<tr>
							<th rowspan="6">과세<br>표준<br>계산</th>
							<th>종전규정에 따른 계산방법</th>
							<th>중간지급등</th>
							<th>최종</th>
							<th>정산</th>
							<th>개정규정에 따른 계산방법</th>
							<td><button>계산방법</button></td>
						</tr>
						<tr>
							<th>34.퇴직소득(17)</th>
							<td></td>
							<td></td>
							<td></td>
							<th>27.정산퇴직소득(17)</th>
							<td></td>
						</tr>
						<tr>
							<th>35.퇴직소득정률공제</th>
							<td></td>
							<td></td>
							<td></td>
							<th>28.근속연수공제</th>
							<td></td>
						</tr>
						<tr>
							<th>36.근속연수공제</th>
							<td></td>
							<td></td>
							<td></td>
							<th>29.환산급여</th>
							<td></td>
						</tr>
						<tr>
							<th rowspan="2">37.퇴직소득과세표준</th>
							<td rowspan="2"></td>
							<td rowspan="2"></td>
							<td rowspan="2"></td>
							<th>30.환산급여별공제</th>
							<td></td>
						</tr>
						<tr>
							<th>31.퇴직소득과세표준</th>
							<td></td>
						</tr>
						<tr>
							<th rowspan="8">세액<br>계산</th>
							<th>종전규정에 따른 계산방법</th>
							<th>12.12.31이전</th>
							<th>13.01.01이후</th>
							<th>합계</th>
							<th>개정규정에 따른 계산방법</th>
							<th>정산</th>
						</tr>
						<tr>
							<th rowspan="2">38.과세표준안분<br>(37X각근속연수/정산근속연수)</th>
							<td></td>
							<td></td>
							<td></td>
							<th>32.환산산출세액</th>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<th>33.산출세액</th>
							<td></td>
						</tr>
						<tr>
							<th>39.연평균과세표준(38/각근속연수)</th>
							<td></td>
							<td></td>
							<td></td>
							<th colspan="2">퇴직소득 세액계산</th>
						</tr>
						<tr>
							<th>40.환산과세표준(39X5배)</th>
							<td></td>
							<td></td>
							<td></td>
							<th>44.퇴직일 과세연도</th>
							<td></td>
						</tr>
						<tr>
							<th>41.환산산출세액(40X세율)</th>
							<td></td>
							<td></td>
							<td></td>
							<th>45.퇴직소득세 산출세액</th>
							<td></td>
						</tr>
						<tr>
							<th>42.연평균산출세액</th>
							<td></td>
							<td></td>
							<td></td>
							<th>46.기납부(기과세이연)세</th>
							<td></td>
						</tr>
						<tr>
							<th>43.산출세액(42X각 근속연수)</th>
							<td></td>
							<td></td>
							<td></td>
							<th>47.신고대상세액(45-46)</th>
							<td></td>
						</tr>
					</table>
					<!-- 과세이연 -->
					<table>
						<tr>
							<th rowspan="2">과세<br>이연</th>
							<th>연금계좌취급자</th>
							<th>사업자등록번호</th>
							<th>계좌번호</th>
							<th>입금일</th>
							<th>49.계좌입금액</th>
							<th>50.퇴직급여</th>
							<th>51.이연퇴직소득세</th>
							<th rowspan="2">상세내역</th>
						</tr>
						<tr>
							<td>zzzzzz</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<!-- 납부명세 -->
					<table>
						<tr>
							<th rowspan="4">납부<br>명세</th>
							<th>구분</th>
							<th>소득세</th>
							<th>지방소득세</th>
							<th>농어촌특별세</th>
							<th>계</th>
						</tr>
						<tr>
							<th>53.신고대상액(47)</th>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>54.이연소득세(51)</th>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<th>55.차감원천징수세액(53-54)</th>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
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