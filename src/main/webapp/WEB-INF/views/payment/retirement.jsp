<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#wrapp1 {
		float: left;
		width: 20%;
	}
	#wrapp2 {
		float: right;
		width: 70%;
	}
	
	#wrapp3 {
		float: left;
		width: 35%;
	}
	#wrapp4 {
		float: right;
		width: 60%;
	}
	
	main td {
		height: 30px;
	}
	main tr {
		height: 30px;
	}
	#infoTable {
		width: 100%;
	}
	
	#retireTable {
		width: 100%;
	}
	
	#tabList{
		padding-top: 30px;
		padding-bottom: 30px;
	}
	#detailList{
		padding-top: 30px;
		padding-bottom: 30px;
	}
	#salaryTable {
		width: 60%;
	}
	#bonustable {
		width: 100%;
	}
	#caculTable {
		width: 100%;
		float: right;
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
	<main>
	<div class="container-fluid">
		<h2 class="mt-4">퇴직금계산</h2>
		<div class="card mb-4">
			<div class="card-body">
				<div id="wrapp1">
				<form action="">
					<input type="text">
					<button id="searchBtn">
						<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
					</button>
				</form>
				<br>
					<table id="empList" style="text-align: center;" border="1">
						<tr>
							<td><input type="checkbox" id="checkk"></td>
							<td>10001</td>
							<td>최새우</td>
						</tr>				
					</table>
				
				</div>
				
				<div id="wrapp2">
					<table id="infoTable" border="1">
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
							<td colspan="5">
								<input type="text">&nbsp;년/
								<input type="text">&nbsp;개월/
								<input type="text">&nbsp;일
							</td>
						</tr>
					</table>
					
					<div id="tabList">
						<button>퇴직금 계산</button>
						<button>소득세 계산</button>
						<button>중간정산내역</button>
					</div>
					
					<div id="retireArea">
						<table id="retireTable" border="1">
							<tr>
								<th rowspan="2">급여산정</th>
								<td colspan="3">①기간 <input type="date"> ~ <input type="date"></td>
							</tr>
							<tr>
								<td colspan="3">
									②산정계 <input type="text"> = (급여) <input type="text"> + (상여) <input type="text">
								</td>
							</tr>
							<tr>
								<th>평균임금</th>
								<td>
									<input type="text">
								</td>
								<th>예상퇴직금</th>
								<td><input type="text"></td>
							</tr>
						</table>
						
						<div id="detailList">
							<button>급여내역</button>
							<button>상여내역</button>
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
									<tr><th colspan="3">상여지급내역</th></tr>
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
							
								<table id="caculTable" border="1">
									<tr>
										<th colspan="2">※ 예상퇴직금 계산식</th>
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
										<th>상여내역은 급여산정기간 종료월로부터 과거 1년까지의<br> 상여총액이 반영(단, 계산방법 4.기간은 제외)</th>
									</tr>
								</table>
							</div>
							
						</div>
					</div>
					
					<div id="taxArea">
						<div id="wrapp5">
							<table>
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
							<table>
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
							<table>
								<tr>
									<th>근속연수 계산</th>
								</tr>
								<tr>
									<td>
										1. 전체 근속연수
											개월 = 년 개월 = 년
										2. 2012.12.31 이전 근속 년수/월수/일수
											개월 = 년 개월 = 년
										3. 2013.01.01 이후 근속 년수/월수/일수
											개월 = 년 개월 = 년
									</td>
								</tr>
							</table>
						</div>
						
						<table>
							<tr>
								<th>소득세 산출</th>
							</tr>
						</table>
						
						<table>
							
						</table>
					</div>
					
					<div id="middleArea">
					
					</div>
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