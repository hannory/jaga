<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#searchTable {
		width: 100%;
		background: white;
	}
	#searchTable td{
		padding-left: 0.3cm; 
	}
	#searchTable th{
		padding-left: 0.3cm; 
	}
	
	#accountTableDiv {
		float: left;
		width: 25%;
	}
	#accountTableDiv2 {
		float: right;
		width: 70%;
	}
	
	#accountTable {
		width: 100%;
		text-align: center;
	}
	th {
		background: #296355;
		color: white;
	}
	#accountTable2 {
		width: 100%;
		text-align: center;
	}
	
	tfoot td {
		background: #D4D5D9;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<main>
	<div class="container-fluid">
		<h2 class="mt-4">총계정원장</h2>
		<ol class="breadcrumb mb-4">
			<table id="searchTable" >
					<tr>
						<th>계정과목</th>
						<td>
							<input type="radio" name="division" value="all" id="all"><label for="all">전체</label>
							<input type="radio" name="division" value="sale" id="sale"><label for="sale">매출</label>
							<input type="radio" name="division" value="buy" id="buy"><label for="buy">매입</label>
						</td>
						<th>조회기간</th>
						<td>
							<input type="text">
								<button id="searchBtn">
									<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
							
							<input type="text">
						</td>
					</tr>
				</table>
		</ol>
		<div class="card mb-4">
			<div class="card-body">
				<div id="accountTableDiv">
				<table id="accountTable" border="1">
					<tr>
						<th><input type="checkbox" id="checkk"></th>
						<th>코드</th>
						<th>계정과목</th>
					</tr>
					<tr>
						<td><input type="checkbox" id="checkk"></td>
						<td></td>
						<td></td>
					</tr>
				</table>
				</div>
				
				<div id="accountTableDiv2">
				<table id="accountTable" border="1">
					<tr>
						<th>일자</th>
						<th>차변</th>
						<th>대변</th>
						<th>잔액</th>
					</tr>
					<tr>
						<td>[전기이월]</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					
					<tfoot>
					<tr>
						<td>피곤해요</td>
						<td>합계</td>
						<td>합계</td>
						<td>합계</td>
					</tr>
					</tfoot>
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