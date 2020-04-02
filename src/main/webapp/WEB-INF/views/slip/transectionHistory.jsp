<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input {
		border:none;
	}
	
	#sumTranTable {
		width:100%;
	}
	#sumTranTable th {
		color: #5A5A5A;
	}
	#sumTranTable tr td {
		height:25px;
		font-weight: bold;
	}
	#resultTranTable {
		width:100%;
		color: #296355;
		text-align: center;
	}
	#resultTranTable tr td {
		height:35px;
		color: #5A5A5A;
	}
	#resultTranTable tr {
		border-bottom: 1px solid lightgray;
	}
	

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />

	<main>
	<div class="container-fluid">
		<h2 class="mt-4">매입매출 거래내역</h2>
		<ol class="breadcrumb mb-4">
			<table id="searchReTable">
				<tr>
					<td>전표일자 : </td>
					<td><input type="text" id="datepicker">~<input type="text" id="datepicker1"></td>
				</tr>
			</table>
		</ol>
		<div class="card mb-4">
			<div class="card-body">
			<table id="sumTranTable">
			<colgroup>
				<col width="40%">
				<col width="30%">
				<col width="30%">
			</colgroup>
				<tr>
					<th>매출-매입</th>
					<th>매출</th>
					<th>매입</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			</div>
		</div>
		<div class="card mb-4">
			<div class="card-body">
			<table id="resultTranTable">
			<colgroup>
				<col width="2%">
				<col width="5%">
			</colgroup>
				<tr>
					<th><input type="checkbox"></th>
					<th>구분</th>
					<th>일자</th>
					<th>증빙</th>
					<th>거래처</th>
					<th>품목</th>
					<th>공급가액</th>
					<th>세액</th>
					<th>합계</th>
					<th>상세</th>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
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

		});
	 </script>
	<jsp:include page="../common/menubar2.jsp" />

</body>
</html>