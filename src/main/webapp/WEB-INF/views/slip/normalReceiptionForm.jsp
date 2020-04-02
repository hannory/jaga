<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가경리</title>
<style>
	#normalReTable {
		width:100%;
	}
	#normalReTable th {
		background: #24574A;
		color:white;
		text-align: center;
	}
	#normalReTable tr td {
		height: 25px;
	}
	input {
		border:none;
	}
	
	#resultReTable {
		width: 100%;
		text-align: center;
	}
	#resultReTable th{
		background: #C4C4C4;
	}
	
	#resultReTable tr td{
		height:25px;
	}
	
	#dateReTable {
		color: white;
		background: #24574A;
		width: 100%;
	}
	
	#searchReTable {
		width: 100%;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<main>
	<div class="container-fluid">
		<h2 class="mt-4">일반전표입력</h2>
		<ol class="breadcrumb mb-4">
			<table id="searchReTable">
				<tr>
					<td>전표일자 : </td>
					<td><input type="text" id="datepicker">~<input type="text" id="datepicker1"></td>
					<td><div style="color:red;">대차차액 : </div></td>
				</tr>
			</table>
		</ol>
		<div class="card mb-4">
			<div class="card-body">
				<table id="normalReTable" border="1">
				<colgroup>
					<col width="3%"/>
					<col width="4%"/>
					<col width="4%"/>
					<col width="7%"/>
					<col width="7%"/>
					<col width="5%"/>
					<col/>
					<col width="5%"/>
					<col/>
					<col width="5%"/>
				</colgroup>
					<tr>
						<th><input type="checkbox"></th>
						<th>월</th>
						<th>일</th>
						<th>번호</th>
						<th>구분</th>
						<th colspan="2">계정과목</th>
						<th colspan="2">거래처</th>
						<th colspan="2">적요</th>
						<th>차변</th>
						<th>대변</th>
					</tr>
					<tr>
						<td align="center"><input type="checkbox"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
						<td><input type="text" style="width:100%;"></td>
					</tr>
				</table>
			</div>
		</div>	
		<div class="card mb-4">
			<div class="card-body">
			<table id="dateReTable">
				<tr>
					<th>일자 : 년  월  일</th>
				</tr>
			</table>
			
			<br>
			
			<table id="resultReTable" border="1">
				<tr>
					<th colspan="2">거래처</th>
					<th colspan="2">적요</th>
					<th>차변</th>
					<th>대변</th>
				</tr>
				<tr>
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

			$("#normalReTable input").focus(function(){
				
				$("#normalReTable input").css("background", "white");
				$("#normalReTable td").css("background", "white");
				$("#normalReTable tr").css("background", "white"); 
				
				console.log($(this).parent().parent());
				$(this).parent().parent().children().css("background", "#DDEBF7");
				$(this).parent().parent().children().children().css("background", "#DDEBF7");
				$(this).parent().children().css("background", "#DDEBF7");
				$(this).parent().css("background", "#8FA9BD");
				$(this).parent().children().css("background", "#8FA9BD");
				
				
			
				
			})
		});
	 </script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>