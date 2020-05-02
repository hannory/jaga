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
	
	.one tbody td {
		text-align: right;
	}
	
	.one tbody td:first-child {
		text-align: center;
	}
	.one tfoot td {
		text-align: right;
	}
	
	.one tfoot td:first-child {
		text-align: center;
	}
	.listBody2 {
		display:none;
		
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
						<th>조회구분</th>
						<td>
							<input type="radio" name="division" value="all" id="all" checked><label for="all">월별</label>
							<input type="radio" name="division" value="sale" id="sale"><label for="sale">일별</label>
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
				
				<thead>
					<tr>
						<th><input type="checkbox" id="checkk"></th>
						<th>코드</th>
						<th>계정과목</th>
					</tr>
				</thead>
				<tbody class="listBody1">
				<c:forEach var="a" items="${ list }">
					<tr onclick="searchOne(${a.accountCode}, this);">
						<td><input type="checkbox" id="checkk"></td>
						<td><c:out value="${ a.accountCode }"></c:out></td>
						<td><c:out value="${ a.accountTitle }"></c:out></td>
					</tr>
				</c:forEach>
				</tbody>
				<tbody class="listBody2">
				<c:forEach var="a" items="${ list }">
					<tr onclick="searchOne(${a.accountCode}, this);">
						<td><input type="checkbox" id="checkk"></td>
						<td><c:out value="${ a.accountCode }"></c:out></td>
						<td><c:out value="${ a.accountTitle }"></c:out></td>
					</tr>
				</c:forEach>
				</tbody>
				</table>
				</div>
				
				<div id="accountTableDiv2">
				<table id="accountTable" class="one" border="1">
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<thead>
					<tr>
						<th>일자</th>
						<th>차변</th>
						<th>대변</th>
						<th>잔액</th>
					</tr>
				</thead>
				<tbody id="tbody1">
					<tr>
						<td>[전기이월]</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>	
				<tbody id="tbody2">
				
				</tbody>
					<tfoot>
					<tr>
						<td>합계</td>
						<td></td>
						<td></td>
						<td></td>
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
	
	<!-- 로딩? -->
	<div id="loading">
        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
    </div>
	
	<script>
		function searchOne(code, t){
			var acCode = code;
			$(t).css("background", "#D9E3E3");
			$("#accountTable tr").not(t).css("background", "white");
			$.ajax({
				url:"selectOneAccount.ab",
				data:{accountCode:acCode},
				success:function(data){
					var list = data.list;
					var last = data.lastSum;
					
					$("#tbody1 td:last-child").text(comma(last));
					
					$(".one tfoot td:nth-child(2)").text(comma(data.chaSum));
					$(".one tfoot td:nth-child(3)").text(comma(data.deaSum));
					
					$("#tbody2 tr").remove();
					
					var $tbody2 = $("#tbody2");
					
					for(var i = 0; i < list.length; i++){
						var $tr = $("<tr>").attr("onclick", "searchDetail(\""+acCode+"\",\""+list[i].yearMonthAll+"\");");
						
						var $td1 = $("<td>").text(list[i].yearMonthAll);
						var $td2 = $("<td>").text(comma(list[i].priceSumCha));
						var $td3 = $("<td>").text(comma(list[i].priceSumDea));
						var $td4 = $("<td>").text(comma(list[i].sumAll));
						
						$tr.append($td1);
						$tr.append($td2);
						$tr.append($td3);
						$tr.append($td4);
						$tbody2.append($tr);
					}
				}
			});
		}
		
		function searchDetail(code, yearMonth){
			console.log(code);
			console.log(yearMonth);
			
			$.ajax({
				url:"selectDetailAccount.ab",
				data:{
					accountCode:code,
					yearMonth:yearMonth
				},
				success:function(data){
						
				}
			});
		}
		
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
			str.value = comma(uncomma(str.value));
		}
	</script>
	
	
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>