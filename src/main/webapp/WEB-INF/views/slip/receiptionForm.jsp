<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input {
 		border:none; 
	}
	 
	#insertReTable {
		width:100%;	
		padding: 50px;
	}
	#insertReTable tr{
		height: 35px;	
	}
	
	#resultReTable {
	  	width:100%;
	  	
	}
	#resultReTable tr{
	  	height: 30px;
	  	
	}
	#resultReTable th{
		background: #296355;
		color:white;
	}
	
	#insertReTable td:first-child {
		background: #296355;
		color:white;
		font-weight: bold;
	}
	#insertReTable td:nth-child(3) {
		background: #296355;
		color:white;
		font-weight: bold;
	}
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<main>
	<div class="container-fluid">
		<h2 class="mt-4">매입매출전표입력</h2>
		<div class="card mb-4">
			<div class="card-body">
				<table id="insertReTable" border="1">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
				</colgroup>
					<tr>
						<td>전표일자</td>
						<td><input type="text" id="datepicker"></td>
						<td>구분</td>
						<td>
							&nbsp;
							<input type="radio" name="receipDivi" id="sale" value="sale"><label for="sale">매출</label>&nbsp;
							<input type="radio" name="receipDivi" id="buy" value="buy"><label for="buy">매입</label>
						</td>
					</tr>
					<tr>
						<td>부가세유형</td>
						<td colspan="3">
							<select>
								<option>껄껄껄</option>
								<option>껄껄껄</option>
								<option>껄껄껄</option>
								<option>껄껄껄</option>
								<option>껄껄껄</option>
								<option>껄껄껄</option>
								<option>껄껄껄</option>
								<option>껄껄껄</option>
								<option>껄껄껄</option>
								<option>껄껄껄</option>
								<option>껄껄껄</option>
								<option>껄껄껄</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>공급가액</td>
						<td colspan="3"><input type="number"></td>
					</tr>
					<tr>
						<td>부가세</td>
						<td colspan="3"><input type="number"></td>
					</tr>
					<tr>
						<td>적요</td>
						<td colspan="3"><input type="text"></td>
					</tr>
					<tr>
						<td>계정과목</td>
						<td colspan="3">
							<input type="text">
							
								<div  style="display:inline-block;" class="input-group-append">
	                      			  <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
	                   			 </div>
							
							<input type="text">
						</td>
					</tr>
					<tr>
						<td>출금계좌</td>
						<td colspan="3">
							<input type="text"><div style="display:inline-block;"><img alt="" src=""></div>
							<input type="text">
						</td>
					</tr>
					<tr>
						<td>수수료</td>
						<td colspan="3">
							<input type="text">
						</td>
					</tr>
				</table>
				
				<button>전표 미리보기</button>
				
			</div>
		</div>
		
		<div class="card mb-4">
			<div class="card-body">
				<table id="resultReTable" border="1">
				<colgroup>
					<col width=25%;>
					<col width=25%;>
					<col width=25%;>
					<col width=25%;>
				</colgroup>
					<tr>
						<th>계정과목</th>
						<th>거래처</th>
						<th>차변</th>
						<th>대변</th>
					</tr>
					<tr>
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
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");

		});
	 </script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>