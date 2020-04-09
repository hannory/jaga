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
	
	#content {
		width: 100%;
	}
	#contentH {
		width: 100%;
	}
	#contentB {
		width: 100%;
	}
	#contentB td{
		padding-left: 5px;
		padding-bottom: 10px;
		padding-top: 10px;
	}
	#contentB th:first-child {
		text-align: right;
		color:#4C4C4C;
		padding-right: 5px;
	}
	#contentB th:nth-child(3) {
		text-align: right;
		color:#4C4C4C;
		padding-right: 5px;
	}
	#contentF {
		width: 100%;
	}
	
	input {
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-left-radius: 5px;
		border-bottom-right-radius: 5px;
		border: 1px solid lightgray;
	}
	
	#contentF input {
		border: none;
	}
	#contentF th{
		text-align: center;
		background: #296355;
		color: white;
	}
	#contentF tr:last-child{
		background: #D4D5D9;
	}
	
	#saveBtn {
		background: #296355;
		border: 1px solid #296355;
		color: white;
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-left-radius: 5px;
		border-bottom-right-radius: 5px;
		
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<main>
	<div class="container-fluid">
		<h2 class="mt-4">사업소득자료입력</h2>
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
					<table id="empList" style="text-align: center;">
						<tr>
							<td><input type="checkbox" id="checkk"></td>
							<td>10001</td>
							<td>최새우</td>
						</tr>				
					</table>
				
				</div>
				
				<div id="wrapp2">
				
					<table id="content">
						<thead>
							<tr>
								<td>
									<table id="contentH">
										<tr>
											<th><h4>사업소득자-</h4><div id="businessName"></div></th>
											<td align="right" style="padding-right:5px;"><button id="saveBtn">저장</button></td>
										</tr>
									</table>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="padding:10px;">
									<table id="contentB">
									<colgroup>
										<col width="20%">
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
										<tr>
											<th>이름</th>
											<td><input type="text"></td>
											<th>주민등록번호</th>
											<td><input type="text"></td>
										</tr>
										<tr>
											<th>소득구분</th>
											<td>
												<input type="text" style="width:20%">
												<button id="searchBtn">
													<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
												</button>
												<input type="text">
											</td>
											<th>이메일</th>
											<td><input type="email"></td>
										</tr>
										<tr>
											<th>급여이체 은행</th>
											<td>
												<select id="">
													<option value="">국민은행</option>
													<option value="">국민은행</option>
													<option value="">국민은행</option>
													<option value="">국민은행</option>
													<option value="">국민은행</option>
												</select>
											</td>
											<th>계좌번호</th>
											<td><input type="text"></td>
										</tr>
										<tr>
											<th>예금주</th>
											<td><input type="text"></td>
											<td></td>
											<td></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="padding-top:20px;">
									<table id="contentF" border="1">
									<colgroup>
										<col width="6%">
										<col width="6%">
										<col width="6%">
										<col width="6%">
										<col width="6%">
										<col width="20%">
										<col width="6%">
										<col width="10%">
										<col width="10%">
										<col>
									</colgroup>
										<tr>
											<th colspan="2">귀속년월</th>
											<th colspan="3">지급일자</th>
											<th rowspan="2">지급액</th>
											<th rowspan="2">세율</th>
											<th rowspan="2">소득세</th>
											<th rowspan="2">지방소득세</th>
											<th rowspan="2">차인지급액</th>
										</tr>
										<tr>
											<th>년</th>
											<th>월</th>
											<th>년</th>
											<th>월</th>
											<th>일</th>
										</tr>
										<tr>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
										</tr>
										<tr>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
										</tr>
										<tr>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
										</tr>
										<tr>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
										</tr>
										<tr>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
										</tr>
										<tr>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
										</tr>
										<tr>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
										</tr>
										<tr>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
											<td><input type="text" style="width:100%"></td>
										</tr>
										<tr style="background:#D4D5D9">
											<th colspan="5" style="background:#D4D5D9; color:black;">합계</th>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</table>
								</td>
							</tr>
						</tbody>
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