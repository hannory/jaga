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
					<td><c:out value="${ minus }"></c:out></td>
					<td><c:out value="${ sale }"></c:out></td>
					<td><c:out value="${ buy }"></c:out></td>
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
			<thead>
				<tr>
					<th><input type="checkbox"></th>
					<th>구분</th>
					<th>일자</th>
					<th>증빙</th>
					<th>거래처</th>
					<th>공급가액</th>
					<th>세액</th>
					<th>합계</th>
					<th>상세</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="t" items="${ list }">
					<tr>
						<td><input type="checkbox"></td>					
						<td><c:out value="${ t.division }"/></td>
						<td><c:out value="${ t.slipDate }"/></td>
						<td><c:out value="${ t.evidence }"/></td>
						<td><c:out value="${ t.journalizeList[0].venderName }"/></td>
						<td><c:out value="${ t.supplyValue }"/></td>
						<td><c:out value="${ t.valueTax }"/></td>
						<td><c:out value="${ t.supplyDeaga }"/></td>
						<td><button onclick="detail(${t.slipCode});">상세</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
		<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</div>
	
	<!-- 모달 시작-->
      <!-- Modal 계정과목 -->
  <div class="modal fade" id="accountModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">거래처검색</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          	<table id="resultReTable" border="1">
				<colgroup>
					<col width=20%;>
					<col width=20%;>
					<col width=20%;>
					<col width=20%;>
					<col width=20%;>
				</colgroup>
				<thead>
					<tr>
						<th>계정코드</th>
						<th>계정과목</th>
						<th>거래처</th>
						<th>차변</th>
						<th>대변</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
				</table>
				<br>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
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
			$("#datepicker1").datepicker({onSelect:function(data){
				
				if($("#datepicker").val() != null){
					
					var date1 = $("#datepicker").val();
					var date2 = $("#datepicker1").val();
					
					$.ajax({
						url:"selectDateList.th",
						data:{
							date1:date1,
							date2:date2
							},
						success:function(data){
							$("#resultTranTable tbody tr").remove();
							var list = data.list;
							var $tbody = $("#resultTranTable tbody");
							
							for(var i = 0; i < list.length; i++){
								var $tr = $("<tr>");
								
								var $td1 = $("<td>").html("<input type='checkbox'>");
								var $td2 = $("<td>").text(list[i].division);
								var $td3 = $("<td>").text(list[i].slipDate);
								var $td9 = $("<td>").text(list[i].evidence);
								var $td4 = $("<td>").text(list[i].journalizeList[0].venderName);
								var $td5 = $("<td>").text(list[i].supplyValue);
								var $td6 = $("<td>").text(list[i].valueTax);
								var $td7 = $("<td>").text(list[i].supplyDeaga);
								var $td8 = $("<td>").html("<button onclick='detail("+list[i].slipCode+");'>상세</button>");
								
								$tr.append($td1);
								$tr.append($td2);
								$tr.append($td3);
								$tr.append($td9);
								$tr.append($td4);
								$tr.append($td5);
								$tr.append($td6);
								$tr.append($td7);
								$tr.append($td8);
								$tbody.append($tr);
							}
							
							
							$("#resultTranTable tr td:nth-of-type(2)").each(function(){
								if($(this).text() == '매출'){
									$(this).css("color", "red");
								}else{
									$(this).css("color", "blue");
								}
								
							});
							
							
							$("#sumTranTable td:first-of-type").text(data.minus);
							$("#sumTranTable td:nth-of-type(2)").text(data.sale);
							$("#sumTranTable td:nth-of-type(3)").text(data.buy);
							
							
							
						}
					});
				}
			}});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");

			$("#resultTranTable tr td:nth-of-type(2)").each(function(){
				if($(this).text() == '매출'){
					$(this).css("color", "red");
				}else{
					$(this).css("color", "blue");
				}
				
			});
			
		});
		
		function detail(value){
			$("#resultReTable td").remove();
			var $tbody = $("#resultReTable tbody");
			
			$.ajax({
				url:"detailJounalize.th",
				data:{slipCode:value},
				success:function(data){
					var list = data.list;
					
					
					for(var i = 0; i < list.length; i++){
						var $priceCha = $("<td>").text("");
						var $priceDea = $("<td>").text("");
						var $tr = $("<tr>");
						var $codeTd = $("<td>").text(list[i].accountCode);
						var $nameTd = $("<td>").text(list[i].accountTitle);
						var $venderN = $("<td>").text(list[i].venderName);
						
						if(list[i].debitCredit=='차변'){
							
							$priceCha = $("<td>").text(list[i].price);
						}else if(list[i].debitCredit=='대변'){
							
						    $priceDea = $("<td>").text(list[i].price);
						}
						
						$tr.append($codeTd);
						$tr.append($nameTd);
						$tr.append($venderN);
						$tr.append($priceCha);
						$tr.append($priceDea);
						$tbody.append($tr);
					}
				}
			});
			
			
			$("div#accountModal").modal();
		}
	 </script>
	<jsp:include page="../common/menubar2.jsp" />

</body>
</html>