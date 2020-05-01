<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#searchTable{
		width: 100%;
		background:white;
		height: 70px;
	}
	#searchTable tr{
	}
	#searchTable td{
		padding-left:0.3cm; 
	}
	#searchTable td:first-child {
		background: #296355;
		color:white;
		font-weight: bold;
	}
	#searchTable td:nth-child(3) {
		background: #296355;
		color:white;
		font-weight: bold;
	}
	#resultTable{
		width: 100%;
		text-align: center;
	}
	#resultTable th{
		background: #296355;
		color: white;
		
	}
	#searchBtn{
		background: none;
		border: none;
		outline: none;
	}
	#printBtn{
		background: none;
		border: none;
		outline: none;
	}
	
	input{
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
		<h2 class="mt-4">세금계산서 발행</h2>
		<ol class="breadcrumb mb-4">
			<table id="searchTable" border="1">
			<colgroup>
				<col width="15%">
				<col width="30%">
				<col width="15%">
				<col>
			</colgroup>
				<tr>
					<td>출력</td>
					<td>
						<input type="radio" name="printStatus" id="all" value="all" checked><label for="all">전체</label>&nbsp;&nbsp;&nbsp;
						<input type="radio" name="printStatus" id="trueY" value="all"><label for="trueY">여</label>&nbsp;&nbsp;&nbsp;
						<input type="radio" name="printStatus" id="falseN" value="all"><label for="falseN">부</label>
					</td>
					<td>조회기간</td>
					<td><input type="text" id="datepicker">~<input type="text" id="datepicker1"></td>
				</tr>
				<tr>
					<td>거래처</td>
					<td colspan="3">
						<input type="text">
							<button id="searchBtn" >
								<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
							</button>
						<input type="text">
					</td>
				</tr>
			</table>
		</ol>
		<div class="card mb-4">
			<div class="card-body">
				<table id="resultTable" border="1">
					<tr>
						<th><input type="checkbox" class="checkk"></th>
						<th>작성일자</th>
						<th colspan="2">거래처</th>
						<th>공급가액</th>
						<th>세액</th>
						<th>합계</th>
						<th>출력여부</th>
						<th>인쇄</th>
					</tr>
					<c:forEach var="t" items="${ list }">
					<tr>
						<td><input type="checkbox" class="checkk"></td>
						<td><c:out value="${ t.slipDate }"/></td>
						<td><c:out value="${ t.journalizeList[0].venderCode }"/></td>
						<td><c:out value="${ t.journalizeList[0].venderName }"/></td>
						<td><fmt:formatNumber value="${t.supplyValue}" type="currency" currencySymbol=""/></td>
						<td><fmt:formatNumber value="${t.valueTax}" type="currency" currencySymbol=""/></td>
						<td><fmt:formatNumber value="${t.supplyDeaga}" type="currency" currencySymbol=""/></td>
						<td><c:out value="${ t.issueStatus }"/></td>
						<td><button id="printBtn" onclick="printBtn('${t.slipCode}');"><img alt="" src="${ contextPath }/resources/images/print.PNG" width="30px" height="30px"></button></td>
					</tr>
					</c:forEach>
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
	
	
	<!-- 로딩? -->
	<div id="loading">
        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
    </div>
	
	<script>
	/* 날짜 input jquery ui */
		$.datepicker.setDefaults({
			showOn : "both",
			buttonImageOnly : true,
			buttonImage : "${contextPath}/resources/images/calendar.png",
			dateFormat : 'yy-mm-dd'

		});
	
		/* 콤마찍기+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
		//콤마찍기
		function comma(str) {
		    str = String(str);
		    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		
		//콤마풀기
		function uncomma(str) {
		    str = String(str);
		    return str.replace(/[^\d]+/g, '');
		}
		
		function inputNumberFormat(obj) {
		    obj.value = comma(uncomma(obj.value));
		}
		/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
	
		function printBtn(code){
			//location.href="${ contextPath }/taxInvoicePrint.ti?slipCode="+code;
			window.open("${ contextPath }/taxInvoicePrint.ti?slipCode="+code, "_blank", "width=600, height=850");
			
		};
		
		
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