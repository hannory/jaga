<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	#normalReTable td {
		height: 25px;
	}
	#normalReTable tbody td:last-of-type input{
		text-align:right;
		padding-right: 5px;
	}
	#normalReTable tbody td:nth-last-of-type(2) input{
		text-align:right;
		padding-right: 5px;
	}
	#resultReTable tbody td:last-of-type{
		text-align:right;
		padding-right: 5px;
	}
	#resultReTable tbody td:nth-last-of-type(2){
		text-align:right;
		padding-right: 5px;
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
	
	#resultReTable td{
		height:25px;
	}
	
	#dateReTable {
		color: white;
		background: #24574A;
		width: 100%;
	}
	
	#searchReTable {
		width: 40%;
		text-align: left;
	}
	
	
	.modal-header{
		background: #24574A;
		color: white;
	}
	
	tbody {
		text-align: center;
	}
	tbody input {
		text-align: center;
	}

	a:hover {
		cursor: pointer;
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
				</tr>
			</table>
		</ol>
		<div class="card mb-4"  style="overflow: auto; height:400px">
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
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th>월</th>
							<th>일</th>
							<th>번호</th>
							<th>구분</th>
							<th colspan="2">계정과목</th>
							<th colspan="2">거래처</th>
							<th>적요</th>
							<th>차변</th>
							<th>대변</th>
						</tr>
					</thead>
					<tbody id="tbody1">
					<c:forEach var="r" items="${ list }">
						<tr onclick="detailBungea('${r.month}','${ r.day }', '${ r.dateSlipCode }');">
							<td><input type="checkbox"></td>
							<td><input type="text" class="month" style="width:100%;" value="${ r.month }"></td>
							<td><input type="text" class="day" style="width:100%;" value="${ r.day }"></td>
							<td><input type="text" class="dateSlipCode" name="dateSlipCode" style="width:100%;" value="${ r.dateSlipCode }"></td>
							<td><input type="text" class="debit" name="debitCredit" value="${ r.debitCredit }" style="width:100%;"></td>
							<td><input type="text" class="accountCode" name="accountCode" value="${ r.accountCode }" style="width:100%;"></td>
							<td><input type="text" class="accName" name="accName" value="${ r.accountTitle }" style="width:100%;"></td>
							<td><input type="text" class="venderCode" name="venderCode" value="${ r.venderCode }" style="width:100%;"></td>
							<td><input type="text" class="venName" name="venName" value="${ r.venderName }" style="width:100%;"></td>
							<td><input type="text" class="brief" name="brief" style="width:100%;"></td>
							
							<c:if test="${ r.debitCredit eq '차변'}">
							<td>
							<input type="text" class="price" name="price" id='cha' style="width:100%;"  value="<fmt:formatNumber value='${ r.price }' type='currency' currencySymbol=''/>"
							onkeyup="inputNumberFormat(this);" onkeydown="addTr(this);">
							</td>
							<td></td>
							</c:if>
							<c:if test="${ r.debitCredit eq '대변' }">
							<td></td>
							<td>
							<input type="text" class="price" name="price" id='dea' style="width:100%;"  value="<fmt:formatNumber value='${ r.price }' type='currency' currencySymbol=''/>"
							onkeyup="inputNumberFormat(this);" onkeydown="addTr(this);">
							</td>
							</c:if>
						</tr>
					</c:forEach>
					</tbody>
					<tbody id="tbody2">
						<tr>
							<td><input type="checkbox"></td>
							<td><input type="text" class="month" style="width:100%;"></td>
							<td><input type="text" class="day" style="width:100%;"></td>
							<td><input type="text" class="dateSlipCode" name="dateSlipCode" style="width:100%;"></td>
							<td><input type="text" class="debit" name="debitCredit" style="width:100%;"></td>
							<td><input type="text" class="accountCode" name="accountCode" style="width:100%;"></td>
							<td><input type="text" class="accName" name="accName" style="width:100%;"></td>
							<td><input type="text" class="venderCode" name="venderCode" style="width:100%;"></td>
							<td><input type="text" class="venName" name="venName" style="width:100%;"></td>
							<td><input type="text" class="brief" name="brief" style="width:100%;"></td>
							<td><input type="text" class="price" name="price" id='cha' style="width:100%;" onkeyup="inputNumberFormat(this);" onkeydown="addTr(this);"></td>
							<td><input type="text" class="price" name="price" id='dea' style="width:100%;" onkeyup="inputNumberFormat(this);" onkeydown="addTr(this);"></td>
						</tr>
					</tbody>
					</table>
			</div>
		</div>	
		<div class="card mb-4">
			<div class="card-body">
			<table id="dateReTable">
				<tr>
					<th>일자 : 2020 년  <span class="bottomMonth"></span> 월  <span class="bottomDay"></span> 일</th>
				</tr>
			</table>
			
			<br>
			
			<table id="resultReTable" border="1">
			<colgroup>
				<col width="10%">
				<col width="20%">
				<col width="10%">
				<col width="20%">
				<col>
				<col>
			</colgroup>
			<thead>
				<tr>
					<th colspan="2">계정과목</th>
					<th colspan="2">거래처</th>
					<th>차변</th>
					<th>대변</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
			</table>
			</div>
		</div>
		<div style="height: 10vh;"></div>
		<div class="card mb-4">
			<div class="card-body" id="infoFoot">부가세신고와는 상관없는 전표를 입력해 주세요</div>
		</div>
	</div>
	
	
	 <!-- 모달 시작-->
      <!-- Modal 계정과목 -->
  <div class="modal fade" id="accountModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">계정과목검색</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
           <table id="venderTable">
          		<thead>
	          		<tr>
	          			<th>거래처코드</th>
	          			<th>거래처명</th>
	          		</tr>
          		</thead>
          		<tbody>
          		
          		</tbody>
          	</table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
	</main>
	
	
	<!-- 전송용 폼 영역 -->
	<form action="normalValue.nr" method="post" id="realForm">
		<input type="hidden" name="slipDate">
		<input type="hidden" name="supplyValue">
		<input type="hidden" name="dateSlipCode">
	</form>
	
	
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
	
		
		var accountC = "";//계정과목
		var accountN;
		function aaa(value, tr){
			$(value).parent().parent().children().each(function(index){
				accountC += ","+$(this).text();
			})
			var account = accountC.split(",");
			accountC = account[1];
			accountN = account[2];
			
			$(".acc").val(accountC);
			$(".accN").val(accountN);
			
			
			
			$(".acc").parent().parent().children().children().filter("[name=venderCode]").focus();
			
			$(".acc").attr("class", "");
			$(".accN").attr("class", "");
			
			$("div#accountModal").modal("hide");
			
			
		}		
	

		var venderCo;//출금/입금계정과목
		var venderNN;
		function ddd(value){
			$(value).parent().parent().children().each(function(index){
				venderCo += ","+$(this).text();
			})
			var account = venderCo.split(",");
			venderCo = account[1];
			venderNN = account[2];
			
			$(".ven").val(venderCo);
			$(".venN").val(venderNN);
			$(".ven").parent().parent().children().children().filter("[name=brief]").focus();
			
			$(".ven").attr("class", "");
			$(".venN").attr("class", "");
			$("div#accountModal").modal("hide");
		}	
		
		/* 아래 표 */
		function detailBungea(month, day, dsNumber){
			
			$(".bottomMonth").text(month);
			$(".bottomDay").text(day);
			
			$("#resultReTable tbody tr").remove();
			var $tbody = $("#resultReTable tbody");
			
			$("#normalReTable tbody tr").each(function(index){
				var inputs = $(this).children().children();
				var dsCode = $(inputs).filter(".dateSlipCode").val();
				var mmonth =  $(inputs).filter(".month").val();
				var mday = $(inputs).filter(".day").val();
				if(mmonth == month && mday == day && dsNumber == dsCode){
					var $tr = $("<tr>");
					
					var $td1 = $("<td>").text($(inputs).filter(".accountCode").val());
					var $td2 = $("<td>").text($(inputs).filter(".accName").val());
					var $td3 = $("<td>").text($(inputs).filter(".venderCode").val());
					var $td4 = $("<td>").text($(inputs).filter(".venName").val());
					var $td5 = null;
					var $td6 = null;
					
					if($(inputs).filter(".debit").val() == '차변'){
						$td5 = $("<td>").text($(inputs).filter("#cha").val());
						$td6 = $("<td>");
					}else{
						$td6 = $("<td>").text($(inputs).filter("#dea").val());
						$td5 = $("<td>");
					}
					
					$tr.append($td1);
					$tr.append($td2);
					$tr.append($td3);
					$tr.append($td4);
					$tr.append($td5);
					$tr.append($td6);
					$tbody.append($tr);
				}
				
			});
			
		}
		
		$(function() {
			$("#datepicker").datepicker({});
			$("#datepicker1").datepicker({onSelect:function(data){
				
				if($("#datepicker").val() != null){
					
					var date1 = $("#datepicker").val();
					var date2 = $("#datepicker1").val();
					
					$.ajax({
						url:"normalReceipSearch.nr",
						data:{
							date1:date1,
							date2:date2
							},
						success:function(data){
							$("#tbody1 tr").remove();
							$("#resultReTable tbody tr").remove();
							var list = data.list;
							var $tbody = $("#tbody1");
							
							for(var i = 0; i < list.length; i++){
								var $tr = $("<tr onclick='detailBungea(\""+list[i].month+"\",\""+list[i].day+"\",\""+list[i].dateSlipCode+"\");'>");
								
								var $td1 = $("<td>").html("<input type='checkbox'>");
								var $td2 = $("<td>").html("<input type='text' class='month' style='width:100%;' value='"+ list[i].month +"'>")
								var $td3 = $("<td>").html("<input type='text' class='day' style='width:100%;' value='"+ list[i].day +"'>")
								var $td4 = $("<td>").html("<input type='text' class='dateSlipCode' name='dateSlipCode' value='"+ list[i].dateSlipCode +"' style='width:100%;'>")
								var $td5 = $("<td>").html("<input type='text' class='debit' name='debitCredit' value='"+ list[i].debitCredit +"' style='width:100%;'>")
								var $td6 = $("<td>").html("<input type='text' class='accountCode' name='accountCode' value='"+ list[i].accountCode +"' style='width:100%;'>")
								var $td7 = $("<td>").html("<input type='text' class='accName' name='accName' value='"+ list[i].accountTitle +"' style='width:100%;'>")
								var $td8 = $("<td>").html("<input type='text' class='venderCode' name='venderCode' value='"+ list[i].venderCode +"' style='width:100%;'>")
								var $td9 = $("<td>").html("<input type='text' class='venName' name='venName' value='"+ list[i].venderName +"' style='width:100%;'>")
								var $td10 = $("<td>").html("<input type='text' class='brief' name='brief' value='"+ list[i].brief +"' style='width:100%;'>")
								var $td11 = null;
								var $td12 = null;
								var price = 0;
								if(list[i].debitCredit == '차변'){
									price = comma(Number(list[i].price));
									
									$td11 = $("<td>").html("<input type='text' class='price' name='price' id='cha' value='"+price+"' style='width:100%;' onkeyup='inputNumberFormat(this);' onkeydown='addTr(this);'>")
									$td12 = $("<td>")
								}else{
									price = comma(Number(list[i].price));
									
									$td11 = $("<td>")
									$td12 = $("<td>").html("<input type='text' class='price' name='price' id='dea' value='"+price+"' style='width:100%;' onkeyup='inputNumberFormat(this);' onkeydown='addTr(this);'>")
								}
								$tr.append($td1);
								$tr.append($td2);
								$tr.append($td3);
								$tr.append($td4);
								$tr.append($td5);
								$tr.append($td6);
								$tr.append($td7);
								$tr.append($td8);
								$tr.append($td9);
								$tr.append($td10);
								$tr.append($td11);
								$tr.append($td12);
								$tbody.append($tr);
							}
							
						}
					});
				}
			}});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");
			
			
			$(".debit").focus(function(){
				$("#infoFoot").text("3. 차변 / 4. 대변");
			});
			
			$(".accountCode").focus(function(){
				$("#infoFoot").text("계정과목 검색 : F2");
			});
			
			$(".venderCode").focus(function(){
				$("#infoFoot").text("거래처 검색 : F2");
			});
			
			$("input").not(".venderCode").not(".accountCode").not(".debit").focus(function(){
				$("#infoFoot").text("부가세신고와는 상관없는 전표를 입력해 주세요");
			});
			
			$("#normalReTable input").focus(function(){
				$("#normalReTable input").css("background", "white");
				$("#normalReTable td").css("background", "white");
				$("#normalReTable tr").css("background", "white"); 
				
				$(this).parent().parent().children().css("background", "#DDEBF7");
				$(this).parent().parent().children().children().css("background", "#DDEBF7");
				$(this).parent().children().css("background", "#DDEBF7");
				$(this).parent().css("background", "#b3cfe4");
				$(this).parent().children().css("background", "#b3cfe4");
				
				
			});
			
			 
			
			$("#normalReTable td:nth-child(6)").children().focus(function(){
				var thisTr = $(this).parent().parent().children().children();
				$(this).attr("class", "acc");
				thisTr.filter("[name=accName]").attr("class", "accN");
				$(this).keydown(function(key){
					if(key.keyCode == 113){
						$("#venderTable").dataTable({
							destroy: true,
							 ajax:{
									'url':'accountSearch.rp',
									'type':'get'
								},
							 
							 columns: [
								 {data : "accountCode",
									 "render": function(data, type, row){
							                if(type=='display'){
							                    data = '<a onclick="aaa(this);">' + data + '</a>';
							                }
							                return data;}},
								 {data : "accountTitle",
												 "render": function(data, type, row){
										                if(type=='display'){
										                    data = '<a onclick="aaa(this);">' + data + '</a>';
										                }
										                return data;}}
								 
							 ]
						});
						$(".modal-title").text("계정과목검색");
						 $("div#accountModal").modal();
						 
					}
				})
			});
			
			$("#normalReTable td:nth-child(8)").children().focus(function(){
				var thisTr = $(this).parent().parent().children().children();
				$(this).attr("class", "ven");
				thisTr.filter("[name=venName]").attr("class", "venN");
				
				$(this).keydown(function(key){
					if(key.keyCode == 113){
						$("#venderTable").dataTable({
							destroy: true,
							 ajax:{
									'url':'venderSearch.rp',
									'type':'get'
								},
							 
							 columns: [
								 {data : "venderCode",
									 "render": function(data, type, row){
							                if(type=='display'){
							                    data = '<a onclick="ddd(this);">' + data + '</a>';
							                }
							                return data;}},
								 {data : "venderName",
												 "render": function(data, type, row){
										                if(type=='display'){
										                    data = '<a onclick="ddd(this);">' + data + '</a>';
										                }
										                return data;}}
								 
							 ]
						});
						$(".modal-title").text("거래처검색");
						 $("div#accountModal").modal();
						 
					}
				})
			});
			
			$(".month").blur(function(){
				if($(this).val() < 10){
					$(this).val("0"+$(this).val());
				}
				if($(this).val()>12){
					$(this).val("");
					$(this).focus();
				}
			});
			
			$(".month").focus(function(){
				$("#normalReTable tbody tr").each(function(index){
					var month = $(this).children().children().filter(".month").val();
					var day = $(this).children().children().filter(".day").val();
					var dsCode = $(this).children().children().filter(".dateSlipCode").val();
					
					$("#normalReTable tbody tr").not(":eq(0)").each(function(index1){
						var month1 = $(this).children().children().filter(".month").val();
						var day1 = $(this).children().children().filter(".day").val();
						var dsCode1 = $(this).children().children().filter(".dateSlipCode").val();
						
						if(month == month1 && day == day1 && dsCode == dsCode1){
							
						}
					});
					
				});
			});

			$(".day").blur(function(){
				var inputs = $(this).parent().parent().children().children();
				var thisDay = $(this).val();
				var thisMonth = inputs.filter(".month").val();
				var $month = $(".month");
				
				var slipNum = 0;
				
				if(thisDay < 10){
					$(this).val("0"+$(this).val());
				}
				
				inputs.filter(".debit").focus();
				
			});
			
			$(".debit").blur(function(){
				var value = $(this).val();
				var inputs = $(this).parent().parent().children().children();
				
				if(value == 3){
					$(this).val('차변');
					inputs.filter("[name=price]").eq(1).attr("disabled", "true").attr("readonly", "true");
				}else if(value == 4){
					$(this).val('대변');
					inputs.filter("[name=price]").eq(0).attr("disabled", "true").attr("readonly", "true");
				}
				
				inputs.filter("[name=accountCode]").focus();
			});
			
			
			
		});
		
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
			$(str).val($(str).val().replace('+', '000'));
		    $(str).val(comma(uncomma($(str).val())));
		}
		
		
		
		var chaValue = null;
		var deaValue = null;
		var numberC = 0;
		function addTr(vvv){
			var pr = vvv;
			var inputs_01 = $(pr).parent().parent().children().children();			
			if(event.keyCode == 13){
				var $tbody = $("#tbody2");
				var $tr = $("<tr>");
				
				var $td1 = $("<td>").html("<input type='checkbox'>");
				var $td2 = $("<td>").html("<input type='text' class='month' style='width:100%;'>")
				var $td3 = $("<td>").html("<input type='text' class='day' style='width:100%;'>")
				var $td4 = $("<td>").html("<input type='text' class='dateSlipCode' name='dateSlipCode' style='width:100%;'>")
				var $td5 = $("<td>").html("<input type='text' class='debit' name='debitCredit' style='width:100%;'>")
				var $td6 = $("<td>").html("<input type='text' class='accountCode' name='accountCode' style='width:100%;'>")
				var $td7 = $("<td>").html("<input type='text' class='accName' name='accName' style='width:100%;'>")
				var $td8 = $("<td>").html("<input type='text' class='venderCode' name='venderCode' style='width:100%;'>")
				var $td9 = $("<td>").html("<input type='text' class='venName' name='venName' style='width:100%;'>")
				var $td10 = $("<td>").html("<input type='text' class='brief' name='brief' style='width:100%;'>")
				var $td11 = $("<td>").html("<input type='text' class='price' name='price' id='cha' style='width:100%;' onkeyup='inputNumberFormat(this);' onkeydown='addTr(this);'>")
				var $td12 = $("<td>").html("<input type='text' class='price' name='price' id='dea'style='width:100%;' onkeyup='inputNumberFormat(this);' onkeydown='addTr(this);'>")
				
				$tr.append($td1);
				$tr.append($td2);
				$tr.append($td3);
				$tr.append($td4);
				$tr.append($td5);
				$tr.append($td6);
				$tr.append($td7);
				$tr.append($td8);
				$tr.append($td9);
				$tr.append($td10);
				$tr.append($td11);
				$tr.append($td12);
				$tbody.append($tr);
				
				$(inputs_01).filter(".accountCode").attr("name", "journalizeList["+numberC+"].accountCode");
				$(inputs_01).filter(".venderCode").attr("name", "journalizeList["+numberC+"].venderCode");
				$(inputs_01).filter(".debit").attr("name", "journalizeList["+numberC+"].debitCredit");
				if($(inputs_01).filter(".debit").val() == '차변'){
					$(inputs_01).filter("#cha").attr("name", "journalizeList["+numberC+"].price");
					chaValue += Number(uncomma($(inputs_01).filter("#cha").val()));
				}else if($(inputs_01).filter(".debit").val() == '대변'){
					$(inputs_01).filter("#dea").attr("name", "journalizeList["+numberC+"].price");
					deaValue += Number(uncomma($(inputs_01).filter("#dea").val()));
				}
				numberC++;
				
				
				var tMonth = $(inputs_01).filter(".month").val();
				var tDay = $(inputs_01).filter(".day").val();
				var tdsCode = "10001";
				
				
				if(chaValue == deaValue){
					console.log("차대 맞음");
					$("#normalReTable tbody tr").each( function (index) {
						var month = $(this).children().children().filter(".month").val();
						var day = $(this).children().children().filter(".day").val();
						var dsCode = $(this).children().children().filter(".dateSlipCode").val();
						if(tMonth == month && tDay == day && dsCode != ""){
							tdsCode = Number(dsCode) + 1;
						}
						
					});
					
					var slipDate = null;
					var numberD = 0;
					$("#normalReTable tbody tr").each(function(index){
						var dsCode = $(this).children().children().filter(".dateSlipCode").val();
						var mmonth =  $(this).children().children().filter(".month").val();
						var mday = $(this).children().children().filter(".day").val();
						var inputs = $(this).children().children();
						if(dsCode == "" && mmonth != ""){
							$(this).children().children().filter(".dateSlipCode").val(tdsCode);
							slipDate = "2020-"+mmonth+"-"+mday;
							
							$("#realForm input").filter("[name=slipDate]").val(slipDate);
							$("#realForm input").filter("[name=dateSlipCode]").val(tdsCode);
							$("#realForm input").filter("[name=supplyValue]").val(chaValue);
							$("#realForm").append($(this).children().children().filter(".debit"));
							if($(inputs).filter(".debit").val()=='차변'){
								$("#realForm").append($("<input></input>").attr("type", "hidden").attr("name", "journalizeList["+numberD+"].price").val(uncomma($(inputs).filter("#cha").val())));
							}else{
								$("#realForm").append($("<input></input>").attr("type", "hidden").attr("name", "journalizeList["+numberD+"].price").val(uncomma($(inputs).filter("#dea").val())));
							}
							
							$("#realForm").append($("<input></input>").attr("type", "hidden").attr("name", "journalizeList["+numberD+"].accountCode").val($(inputs).filter("[name=accountCode]").val()));
							$("#realForm").append($("<input></input>").attr("type", "hidden").attr("name", "journalizeList["+numberD+"].venderCode").val($(inputs).filter("[name=venderCode]").val()));
							
							numberD++;
						}
					});
					
					$("#realForm").submit();
					
					
					
					
				}else{
					console.log("차대 안맞으");
				}
				
				
				$("#normalReTable input").focus(function(){
					$("#normalReTable input").css("background", "white");
					$("#normalReTable td").css("background", "white");
					$("#normalReTable tr").css("background", "white"); 
					
					$(this).parent().parent().children().css("background", "#DDEBF7");
					$(this).parent().parent().children().children().css("background", "#DDEBF7");
					$(this).parent().children().css("background", "#DDEBF7");
					$(this).parent().css("background", "#b3cfe4");
					$(this).parent().children().css("background", "#b3cfe4");
					
					
				});
				
				$(pr).parent().parent().next().children().eq(1).children().focus();
				
				
				$(".debit").focus(function(){
					$("#infoFoot").text("3. 차변 / 4. 대변");
				});
				
				$(".accountCode").focus(function(){
					$("#infoFoot").text("계정과목 검색 : F2");
				});
				
				$(".venderCode").focus(function(){
					$("#infoFoot").text("거래처 검색 : F2");
				});
				
				$("input").not(".venderCode").not(".accountCode").not(".debit").focus(function(){
					$("#infoFoot").text("부가세신고와는 상관없는 전표를 입력해 주세요");
				});
				
				
				$(".debit").blur(function(){
					var value = $(this).val();
					var inputs = $(this).parent().parent().children().children();
					
					if(value == 3){
						$(this).val('차변');
						inputs.filter("[name=price]").eq(1).attr("disabled", "true").attr("readonly", "true");
					}else if(value == 4){
						$(this).val('대변');
						inputs.filter("[name=price]").eq(0).attr("disabled", "true").attr("readonly", "true");
					}
					
					inputs.filter("[name=accountCode]").focus();
				});
				
				$(".month").blur(function(){
					if($(this).val() < 10){
						$(this).val("0"+$(this).val());
					}
					if($(this).val()>12){
						$(this).val("");
						$(this).focus();
					}
				});
				
				$(".day").blur(function(){
					var inputs = $(this).parent().parent().children().children();
					var thisDay = $(this).val();
					var thisMonth = inputs.filter(".month").val();
					var $month = $(".month");
					
					if(thisDay < 10){
						$(this).val("0"+$(this).val());
					}
					
					inputs.filter(".debit").focus();
					
				});
				
				
				

				$("#normalReTable td:nth-child(6)").children().focus(function(){
					var thisTr = $(this).parent().parent().children().children();
					$(this).attr("class", "acc");
					thisTr.filter("[name=accName]").attr("class", "accN");
					$(this).keydown(function(key){
						if(key.keyCode == 113){
							$("#venderTable").dataTable({
								destroy: true,
								autoWidth: false,
								 ajax:{
										'url':'accountSearch.rp',
										'type':'get'
									},
								 
								 columns: [
									 {data : "accountCode",
										 "render": function(data, type, row){
								                if(type=='display'){
								                    data = '<a onclick="aaa(this);">' + data + '</a>';
								                }
								                return data;}},
									 {data : "accountTitle",
													 "render": function(data, type, row){
											                if(type=='display'){
											                    data = '<a onclick="aaa(this);">' + data + '</a>';
											                }
											                return data;}}
									 
								 ]
							});
							$(".modal-title").text("계정과목검색");
							 $("div#accountModal").modal();
						}
					})
				});
				$("#normalReTable td:nth-child(8)").children().focus(function(){
					var thisTr = $(this).parent().parent().children().children();
					$(this).attr("class", "ven");
					thisTr.filter("[name=venName]").attr("class", "venN");
					
					$(this).keydown(function(key){
						if(key.keyCode == 113){
							$("#venderTable").dataTable({
								destroy: true,
								autoWidth: false,
								 ajax:{
										'url':'venderSearch.rp',
										'type':'get'
									},
								 
								 columns: [
									 {data : "venderCode",
										 "render": function(data, type, row){
								                if(type=='display'){
								                    data = '<a onclick="ddd(this);">' + data + '</a>';
								                }
								                return data;}},
									 {data : "venderName",
													 "render": function(data, type, row){
											                if(type=='display'){
											                    data = '<a onclick="ddd(this);">' + data + '</a>';
											                }
											                return data;}}
									 
								 ]
							});
							$(".modal-title").text("거래처검색");
							 $("div#accountModal").modal();
						}
					})
				});
			}
		}
		
	 </script>
	 <script>

</script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>