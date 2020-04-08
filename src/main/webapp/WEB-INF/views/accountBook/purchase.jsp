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
	}
	#resultTable{
		width: 100%;
		text-align: center;
	}
	#resultTable th{
		background:#296355;
		color: white;
	}
	#sumSum {
		background: #D9E3E3;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<main>
	<div class="container-fluid">
		<h2 class="mt-4">매입매출장</h2>
		<ol class="breadcrumb mb-4">
				<table id="searchTable" >
					<tr>
						<th>조회기간</th>
						<td><input type="text" id="datepicker">~<input type="text" id="datepicker1"></td>
						<th>구분</th>
						<td>
							<input type="radio" name="division" value="all" id="all"><label for="all">전체</label>
							<input type="radio" name="division" value="sale" id="sale"><label for="sale">매출</label>
							<input type="radio" name="division" value="buy" id="buy"><label for="buy">매입</label>
						</td>
					</tr>
				</table>
			
		</ol>
		<div class="card mb-4">
			<div class="card-body">
				<table id="resultTable" border="1">
					<tr>
						<th>유형</th>
						<th>일자</th>
						<th>품목</th>
						<th>공급가액</th>
						<th>부가세</th>
						<th>합계</th>
						<th>코드</th>
						<th>거래처</th>
						<th>계정코드</th>
						<th>계정과목명</th>
					</tr>
					<tr>
						<td>영세</td>
						<td>2020/01/01</td>
						<td>재료</td>
						<td>1,500,000</td>
						<td>150,000</td>
						<td>1,650,000</td>
						<td>101</td>
						<td>오렌지레드컴퍼니(주)</td>
						<td>153</td>
						<td>원재료</td>
					</tr>
					<tr id="sumSum">
						<td colspan="3">일계[]</td>
						<td>합계</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>

			</div>
		</div>
		<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</div>
	</main>
	
	
	<script>
	/* 날짜 input jquery ui */
		$.datepicker.setDefaults({
			showOn : "both",
			buttonImageOnly : true,
			buttonImage : "${contextPath}/resources/images/calendar.png",
			dateFormat : 'yy-mm-dd'

		});
		$(function() {
			$("#datepicker").datepicker({});
			$("#datepicker1").datepicker({});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");
			
			
			$("#printWinBtn").click(function(){
				
			});
			

		});
	 </script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>