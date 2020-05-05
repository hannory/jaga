<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가경리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>


<style>
	input {
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border: 1px solid lightgray;
}
	 
	#insertReTable {
		width:100%;	
		padding: 0.5cm;
	}
	#insertReTable td{
		padding-left: 0.5cm;
	}
	#insertReTable tr{
		height: 35px;	
	}
	
	#resultReTable {
	  	width:100%;
	  	text-align: center;
	}
	#resultReTable tr{
	  	height: 30px;
	  	
	}
	#resultReTable th{
		background: #296355;
		color:white;
	}
	
	#resultReTable tbody td:nth-child(3) input{
		text-align: right;
		padding-right: 5px;
	}
	#resultReTable tbody td:nth-child(4) input{
		text-align: right;
		padding-right: 5px;
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
	#preview {
		background:#888888;
		border: 1px solid #888888;
		color: white;
	}
	button[id^=searchBtn]{
		background: none;
		border: none;
		outline: none;
	}
	#hideArea {
		display: none;
	}
	#evidence2{
		display: none;
	}
	
	main td {
		padding-top: 8px;
		padding-bottom: 8px;
	}
	#resultReTable input {
		text-align: center;
	}
	
	#sub{
		background:#888888;
		border: 1px solid #888888;
		color: white;
	}
	
	#update{
		background:#888888;
		border: 1px solid #888888;
		color: white;
	}
	
	#farm{
		background:#888888;
		border: 1px solid #888888;
		color: white;
	}
	
	
	
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
<!-- 로딩? -->
	<div id="loading">
        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
    </div>
	<main>
	<div class="container-fluid">
		<h2 class="mt-4">매입매출전표입력</h2>
		<!-- <form action="excelUpload.rp" method="post" enctype="multipart/form-data">
			<input type="file" name="excelFile">
		
		</form> -->
			<form action="insertReceiption.rp" method="post">
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
						<td><input type="text" id="datepicker" name="slipDate"></td>
						<td>구분</td>
						<td>
							<input type="hidden" name="comCode" value="1">
							&nbsp;
							<input type="radio" name="division" id="sale" value="sale" checked><label for="sale">매출</label>&nbsp;
							<input type="radio" name="division" id="buy" value="buy"><label for="buy">매입</label>
						</td>
					</tr>
					<tr>
						<td>부가세유형</td>
						<td colspan="3">
							<select name="evidenceCode" id="evidence1" class="evidence">
								<option value="10">세금계산서</option>
								<option value="20">계산서</option>
								<option value="30">영세율</option>
								<option value="150">무증빙</option>
								<option value="40">간이과세</option>
								<!-- <option value="130">수출</option> -->
								<option value="50">카드</option>
								<option value="60">카드(면세)</option>
								<option value="70">카드(영세)</option>
								<option value="140">무증빙(면세)</option>
								<option value="100">현금영수증</option>
								<option value="80">현금영수증(면세)</option>
								<option value="90">현금영수증(영세)</option>
							</select>
							<select name="evidenceCode" id="evidence2" class="evidence"disabled>
								<option value="10">세금계산서</option>
								<option value="20">계산서</option>
								<option value="30">영세율</option>
								<option value="110">불공제</option>
								<option value="40">간이과세</option>
								<!-- <option value="120">수입</option> -->
								<option value="50">카드</option>
								<option value="60">카드(면세)</option>
								<option value="70">카드(영세)</option>
								<option value="140">무증빙(면세)</option>
								<option value="100">현금영수증</option>
								<option value="80">현금영수증(면세)</option>
								<option value="90">현금영수증(영세)</option>
							</select>
						</td>
					</tr>
					<tr id="cardVen" style="display:none;">
						<td> </td>
						<td colspan="3">
							<input type="text" id="venderCode2">
								<button type="button" id="searchBtn1" >
									<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
							
							<input type="text" id="venderName2">
						</td>
					</tr>
					<tr>
						<td>거래처</td>
						<td colspan="3">
							<input type="text" id="venderCode">
								<button type="button" id="searchBtn2">
									<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
							
							<input name="venderName" type="text" id="venderName">
						</td>
					</tr>
					<tr>
						<td>공급대가</td>
						<td colspan="3">
							<input type="text" name="supplydeaga" id="supplydeaga" placeholder="부가세포함금액" onkeyup="inputNumberFormat(this);" onkeydown="inputPlus(this);">
						</td>
					</tr>
					<tr>
						<td>공급가액</td>
						<td colspan="3"><input type="text" name="supplyValue" id="supplyValue"></td>
					</tr>
					<tr>
						<td>부가세</td>
						<td colspan="3"><input type="text" name="valueTax" id="valueTax"></td>
					</tr>
					<tr>
						<td>적요</td>
						<td colspan="3"><input type="text" name="brief" id="brief"></td>
					</tr>
					<tr>
						<td>계정과목</td>
						<td colspan="3">
							<input type="text" id="accountCode">
								<button type="button" id="searchBtn3">
									<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
							
							<input type="text" name="accountName" id="accountName">
						</td>
					</tr>
					<tr>
						<td>입금계정과목</td>
						<td colspan="3">
							<input type="text" id="accountCode2">
								<button type="button" id="searchBtn4">
									<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
							<input type="text" name="accountName2" id="accountName2">
						</td>
					</tr>
					<tr>
						<td>품목</td>
						<td colspan="3">
							<input type="text" id="abc" name="item">
          		<input type="hidden" id="deemedStatus" name="deemedStatus" value="N">
						</td>
					</tr>
				</table>
				<br>
				<button type="button" id="preview">전표 미리보기</button>
				
			</div>
		</div>
		
		<div class="card mb-4" id="hideArea">
			<div class="card-body">
				<table id="resultReTable" border="1">
				<colgroup>
					<col width=25%;>
					<col width=25%;>
					<col width=25%;>
					<col width=25%;>
				</colgroup>
				<thead>
					<tr>
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
				<input type="button" id="farm" value="의제" style="display:none;">
				<input type="submit" id="sub"value="확인">				
				<input type="button" id="update" value="수정">				
			</div>
		</div>
		</form>
		<div style="height: 10vh;"></div>
		<div class="card mb-4">
			<div class="card-body" id="infoFoot">적격증빙(세금계산서,카드,현금영수증)을 받은 거래를 입력해주세요.</div>
		</div>
	</div>
	</main>
	
	
	<!-- 모달 시작-->
      <!-- Modal 계정과목 -->
  <div class="modal fade" id="accountModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header"  style="background:#296355; color:white">
          <h4 class="modal-title">거래처검색</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          	<table id="venderTable">
          		<thead>
	          		<tr>
	          			<th>코드</th>
	          			<th>이름</th>
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
		function aaa(value){
			$(value).parent().parent().children().each(function(index){
				console.log($(this).text());
				accountC += ","+$(this).text();
			})
			var account = accountC.split(",");
			accountC = account[1];
			accountN = account[2];
			
			$("#accountCode").val(accountC);
			$("#accountName").val(accountN);
			
			$("div#accountModal").modal("hide");
			
		}		
	
	
		var accountCo;//출금/입금계정과목
		var accountNN;
		function bbb(value){
			$(value).parent().parent().children().each(function(index){
				console.log($(this).text());
				accountCo += ","+$(this).text();
			})
			var account = accountCo.split(",");
			accountCo = account[1];
			accountNN = account[2];
			
			$("#accountCode2").val(accountCo);
			$("#accountName2").val(accountNN);
			
			$("div#accountModal").modal("hide");
		}		
		
		
		var venderCo;//출금/입금계정과목
		var venderNN;
		function ccc(value){
			$(value).parent().parent().children().each(function(index){
				console.log($(this).text());
				venderCo += ","+$(this).text();
			})
			var account = venderCo.split(",");
			venderCo = account[1];
			venderNN = account[2];
			
			$("#venderCode").val(venderCo);
			$("#venderName").val(venderNN);
			
			$("div#accountModal").modal("hide");
		}		
	
		
		var venderCo;//출금/입금계정과목
		var venderNN;
		function ddd(value){
			$(value).parent().parent().children().each(function(index){
				console.log($(this).text());
				venderCo += ","+$(this).text();
			})
			var account = venderCo.split(",");
			venderCo = account[1];
			venderNN = account[2];
			
			$("#venderCode2").val(venderCo);
			$("#venderName2").val(venderNN);
			
			$("div#accountModal").modal("hide");
		}		
		
		function inputPlus(num){
		/* 	var n = $(num).val();
			
			if(event.keyCode == 187){
				console.log(n);
				n.replace(/\+/g, '000');
			}
			 */
			
		}
		
		/* 콤마찍기+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
		//콤마찍기
		function comma(str) {
		    str = String(str);
		    return str.replace(/(\d)(?!h)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		
		//콤마풀기
		function uncomma(str) {
		    str = String(str);
		    return str.replace(/[^\d]+/g, '');
		}
		
		function inputNumberFormat(obj) {
			$(obj).val($(obj).val().replace('+', '000'));
		    $(obj).val(comma(uncomma($(obj).val())));
		}
		/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
	
		
		$(function() {
			$("#datepicker").datepicker({});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");
			
			/* 폼전송시 콤마 빼기++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++= */
			$("form").submit(function(){
				$("input").not("#datepicker").not("[name*=debitCredit]").not("#brief").not("[name=division]").not("[name=deemedStatus]").not("[name=item]").each(function(){
					$(this).val(uncomma($(this).val()));
				});
			});
			
			/* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
			
			/* 라디오버튼 이벤트 */
			var divisionn = 'sale';
			$("input").filter("[name='division']").click(function(){
				if($(this).val() == 'buy'){
					/* 매입 */
					divisionn = 'buy';
					$("#insertReTable tr").eq(9).children().eq(0).text("출금계정과목");
					$("#evidence2").css("display", "block").attr("disabled", false);
					$("#evidence1").css("display", "none").attr("disabled", true);
				}else if($(this).val() == 'sale'){
					/* 매출 */
					divisionn = 'sale';
					$("#insertReTable tr").eq(9).children().eq(0).text("입금계정과목");
					$("#evidence1").css("display", "block").attr("disabled", false);
					$("#evidence2").css("display", "none").attr("disabled", true);
				}
			});
			/* 증빙종류 이벤트 */
			$(".evidence").click(function(){
				/* 계산서 카면 카영 간이 현영 현명 무증빙 20, 70 80 40 80 90 140 */
				if($(this).val() == 20 ||$(this).val() == 70 ||$(this).val() == 80 ||$(this).val() == 40 
						||$(this).val() == 60 ||$(this).val() == 90 ||$(this).val() == 140){
					$("#valueTax").attr("readonly", true);
				}else{
					$("#valueTax").attr("readonly", false);
				}
				
				if($(this).val() == 50 ||$(this).val() == 60 ||$(this).val() == 70 ){
					$("#cardVen").css("display", "table-row");
				}
				
				if($(this).val() == 20 ||$(this).val() == 70 ||$(this).val() == 90 ){
					$("#farm").css("display", "inline-block");
					
				}
				
			});
			
			
			/* 공급대가 입력시 부가세 자동 계산 */
			$("#supplydeaga").blur(function(){
				var supply = uncomma($(this).val());
				var vTax = $("#valueTax").prop("readonly");
				
				if(vTax == true){
					$("#supplyValue").val(comma(supply));
					$("#valueTax").val(0);
				}else{
					
					$.ajax({
						url:"calculTax.rp",
						type:"post",
						data:{supplydeaga : supply},
						success:function(data){
							var value = comma(data.value);
							var tax = comma(data.tax);
							
							$("#supplyValue").val(value);
							$("#valueTax").val(tax);
						}
					});
				}	
			});
			
			/* 전표미리보기 이벤트 */
			$("#preview").click(function(){
				$("#resultReTable tbody").remove();
				var vTax = $("#valueTax").prop("readonly");
				
				$("#hideArea").css("display", "block");
				//108 외상 매출금 / 401 상품 
				//				255 부가세예수금
				var accountCode = $("#accountCode").val();
				var accountCode2 = $("#accountCode2").val();
				var accName = $("#accountName").val();
				var accName2 = $("#accountName2").val();
				var venderName = $("#venderName").val();
				var venderCode = $("#venderCode").val();
				var supplydeaga = $("#supplydeaga").val();	//공급대가
				var supplyValue = $("#supplyValue").val();	//공급가액
				var valueTax = $("#valueTax").val();	//부가세
				
				console.log("acc : " + accName);
				console.log("venN : " + venderName);
				console.log("supp : " + supplyValue);
				console.log("valT : " + valueTax);
				
				if(divisionn == 'buy'){
					/* 매입 */
					/* 135부가세대급금 */
					var $resultTable = $("#resultReTable");
					console.log($("#evidence2").val());
					
					if($("#evidence2").val() != 50){
						var $tr2 = $("<tr>");
						var accCo = $("<input type='hidden' name='accountCode'>").val(accountC);
						var venCo = $("<input type='hidden' name='venderCode'>").val(venderCode);
						var debitCredit = $("<input type='hidden' name='debitCredit'>").val('차변');
						var $sangpum = $("<td>").html($("<input type='text' name='price'>").val(supplyValue));
						var $vender = $("<td>").html($("<input type='text'>").val(venderName));
						var $accN = $("<td>").html($("<input type='text'>").val(accountN));
						
						$tr2.append($accN);
						$tr2.append($vender);
						$tr2.append($sangpum);
						$tr2.append($("<td>"));
						$tr2.append(accCo);
						$tr2.append(venCo);
						$tr2.append(debitCredit);
						$resultTable.append($tr2);
						
						if(vTax == false){
						var $tr = $("<tr>");
						
						var accCo = $("<input type='hidden' name='accountCode'>").val(13500);
						var venCo = $("<input type='hidden' name='venderCode'>").val(venderCode);
						var debitCredit = $("<input type='hidden' name='debitCredit'>").val('차변');
						var $bugaYeah = $("<td>").html($("<input type='text' name='price'>").val(valueTax));
						var $vender = $("<td>").html($("<input type='text'>").val(venderName));
						var $accN = $("<td>").html($("<input type='text'>").val('부가세대급금'));
						
						$tr.append($accN);
						$tr.append($vender);
						$tr.append($bugaYeah);
						$tr.append($("<td>"));
						$tr.append(accCo);
						$tr.append(venCo);
						$tr.append(debitCredit);
						$resultTable.append($tr);
						
						}
						
						var $tr3 = $("<tr>");
						
						var accCo = $("<input type='hidden' name='accountCode'>").val(accountCo);
						var venCo = $("<input type='hidden' name='venderCode'>").val(venderCode);
						var debitCredit = $("<input type='hidden' name='debitCredit'>").val('대변');
						var $bit = $("<td>").html($("<input type='text' name='price'>").val(supplydeaga));
						var $vender = $("<td>").html($("<input type='text'>").val(venderName));
						var $accN = $("<td>").html($("<input type='text'>").val(accountNN));
						
						$tr3.append($accN);
						$tr3.append($vender);
						$tr3.append($("<td>"));
						$tr3.append($bit);
						$tr3.append(accCo);
						$tr3.append(venCo);
						$tr3.append(debitCredit);
						$resultTable.append($tr3);
						
						
						
						$("#resultReTable tr").each( function (index) {
							var num = index - 1;
					        $(this).find("input[name=accountCode]").attr("name", "journalizeList[" + num + "].accountCode");
					        $(this).find("input[name=debitCredit]").attr("name", "journalizeList[" + num + "].debitCredit");
					        $(this).find("input[name=price]").attr("name", "journalizeList[" + num + "].price");
					        $(this).find("input[name=venderCode]").attr("name", "journalizeList[" + num + "].venderCode");
				   		 });
					} else if($("#evidence2").val() == 50){
						/* 카드매입 */
						/* 상품 / 미지급금 */
						/* 부가세대급금 */
						var cardName = $("#venderName2").val();
						var cardCode = $("#venderCode2").val();
						
						var $tr2 = $("<tr>");
						var accCo = $("<input type='hidden' name='accountCode'>").val(accountC);
						var venCo = $("<input type='hidden' name='venderCode'>").val(venderCode);
						var debitCredit = $("<input type='hidden' name='debitCredit'>").val('차변');
						var $sangpum = $("<td>").html($("<input type='text' name='price'>").val(supplyValue));
						var $vender = $("<td>").html($("<input type='text'>").val(venderName));
						var $accN = $("<td>").html($("<input type='text'>").val(accountN));
						
						$tr2.append($accN);
						$tr2.append($vender);
						$tr2.append($sangpum);
						$tr2.append($("<td>"));
						$tr2.append(accCo);
						$tr2.append(venCo);
						$tr2.append(debitCredit);
						$resultTable.append($tr2);
						
						if(vTax == false){
						var $tr = $("<tr>");
						
						var accCo = $("<input type='hidden' name='accountCode'>").val(13500);
						var venCo = $("<input type='hidden' name='venderCode'>").val(venderCode);
						var debitCredit = $("<input type='hidden' name='debitCredit'>").val('차변');
						var $bugaYeah = $("<td>").html($("<input type='text' name='price'>").val(valueTax));
						var $vender = $("<td>").html($("<input type='text'>").val(venderName));
						var $accN = $("<td>").html($("<input type='text'>").val('부가세대급금'));
						
						$tr.append($accN);
						$tr.append($vender);
						$tr.append($bugaYeah);
						$tr.append($("<td>"));
						$tr.append(accCo);
						$tr.append(venCo);
						$tr.append(debitCredit);
						$resultTable.append($tr);
						
						}
						
						var $tr3 = $("<tr>");
						
						var accCo = $("<input type='hidden' name='accountCode'>").val(accountCo);
						var venCo = $("<input type='hidden' name='venderCode'>").val(cardCode);
						var debitCredit = $("<input type='hidden' name='debitCredit'>").val('대변');
						var $bit = $("<td>").html($("<input type='text' name='price'>").val(supplydeaga));
						var $vender = $("<td>").html($("<input type='text'>").val(cardName));
						var $accN = $("<td>").html($("<input type='text'>").val(accountNN));
						
						$tr3.append($accN);
						$tr3.append($vender);
						$tr3.append($("<td>"));
						$tr3.append($bit);
						$tr3.append(accCo);
						$tr3.append(venCo);
						$tr3.append(debitCredit);
						$resultTable.append($tr3);
						
						
						
						$("#resultReTable tr").each( function (index) {
							var num = index - 1;
					        $(this).find("input[name=accountCode]").attr("name", "journalizeList[" + num + "].accountCode");
					        $(this).find("input[name=debitCredit]").attr("name", "journalizeList[" + num + "].debitCredit");
					        $(this).find("input[name=price]").attr("name", "journalizeList[" + num + "].price");
					        $(this).find("input[name=venderCode]").attr("name", "journalizeList[" + num + "].venderCode");
				   		 });
					}
					
					
				}else{
					/* 매출 */
					/* 255 부가세예수금 */
					var $resultTable = $("#resultReTable");
					
					
					var $tr2 = $("<tr>");
					var accCo = $("<input type='hidden' name='accountCode'>").val(accountC);
					var venCo = $("<input type='hidden' name='venderCode'>").val(venderCode);
					var debitCredit = $("<input type='hidden' name='debitCredit'>").val('대변');
					var $sangpum = $("<td>").html($("<input type='text' name='price'>").val(supplyValue));
					var $vender = $("<td>").html($("<input type='text'>").val(venderName));
					var $accN = $("<td>").html($("<input type='text'>").val(accountN));
					
					$tr2.append($accN);
					$tr2.append($vender);
					$tr2.append($("<td>"));
					$tr2.append($sangpum);
					$tr2.append(accCo);
					$tr2.append(venCo);
					$tr2.append(debitCredit);
					$resultTable.append($tr2);
					
					if(vTax == false){
					var $tr = $("<tr>");
					
					var accCo = $("<input type='hidden' name='accountCode'>").val(25500);
					var venCo = $("<input type='hidden' name='venderCode'>").val(venderCode);
					var debitCredit = $("<input type='hidden' name='debitCredit'>").val('대변');
					var $bugaYeah = $("<td>").html($("<input type='text' name='price'>").val(valueTax));
					var $vender = $("<td>").html($("<input type='text'>").val(venderName));
					var $accN = $("<td>").html($("<input type='text'>").val('부가세예수금'));
					
					$tr.append($accN);
					$tr.append($vender);
					$tr.append($("<td>"));
					$tr.append($bugaYeah);
					$tr.append(accCo);
					$tr.append(venCo);
					$tr.append(debitCredit);
					$resultTable.append($tr);
					
					}
					
					var $tr3 = $("<tr>");
					
					var accCo = $("<input type='hidden' name='accountCode'>").val(accountCo);
					var venCo = $("<input type='hidden' name='venderCode'>").val(venderCode);
					var debitCredit = $("<input type='hidden' name='debitCredit'>").val('차변');
					var $bit = $("<td>").html($("<input type='text' name='price'>").val(supplydeaga));
					var $vender = $("<td>").html($("<input type='text'>").val(venderName));
					var $accN = $("<td>").html($("<input type='text'>").val(accountNN));
					
					$tr3.append($accN);
					$tr3.append($vender);
					$tr3.append($bit);
					$tr3.append($("<td>"));
					$tr3.append(accCo);
					$tr3.append(venCo);
					$tr3.append(debitCredit);
					$resultTable.append($tr3);
					
					
					
					$("#resultReTable tr").each( function (index) {
						var num = index - 1;
				        $(this).find("input[name=accountCode]").attr("name", "journalizeList[" + num + "].accountCode");
				        $(this).find("input[name=debitCredit]").attr("name", "journalizeList[" + num + "].debitCredit");
				        $(this).find("input[name=price]").attr("name", "journalizeList[" + num + "].price");
				        $(this).find("input[name=venderCode]").attr("name", "journalizeList[" + num + "].venderCode");
				    });
					
				}
				
			});
			
			/* 의제매입 */
			$("#farm").click(function(){
				
				if($("#deemedStatus").val() == 'N'){
					Swal.fire({
						  title: '의제세액 8/108',
						  text: "의제매입세액 공제를 받으시겠습니까?",
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: '#296355',
						  cancelButtonColor: '#d33',
						  cancelButtonText: '취소',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
						    Swal.fire(
						      '변경완료',
						      '의제매입세액 공제 설정 완료',
						      'success'
						    )
						    
						  	$("#deemedStatus").val("Y");
						    $("#farm").css("background", "white").css("border", "2px solid red").css("color", "red");
						  }
						})
				}else {
					Swal.fire({
						  title: '의제매입세액공제',
						  text: "의제세액이 설정되어있습니다. 취소하시겠습니까?",
						  icon: 'warning',
						  showCancelButton: true,
						  confirmButtonColor: '#296355',
						  cancelButtonColor: '#d33',
						  confirmButtonText: '확인'
						}).then((result) => {
						  if (result.value) {
						    Swal.fire(
						      '변경완료',
						      '의제매입세액 공제 취소 완료',
						      'success'
						    )
						    
						  	$("#deemedStatus").val("N");
						    $("#farm").css("background", "#888888").css("border", "1px solid #888888").css("color", "white");
						  }
						})
				}
			});
			
			/* 거래처모달 */
			$("#searchBtn2").click(function(){
				
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
					                    data = '<a href="#" onclick="ccc(this);">' + data + '</a>';
					                }
					                return data;}},
						 {data : "venderName",
										 "render": function(data, type, row){
								                if(type=='display'){
								                    data = '<a href="#" onclick="ccc(this);">' + data + '</a>';
								                }
								                return data;}}
						 
					 ]
				});
				
				$(".modal-title").text("거래처검색");
				 $("div#accountModal").modal();
				 
				 
			});
			$("#searchBtn1").click(function(){
				
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
					                    data = '<a href="#" onclick="ddd(this);">' + data + '</a>';
					                }
					                return data;}},
						 {data : "venderName",
										 "render": function(data, type, row){
								                if(type=='display'){
								                    data = '<a href="#" onclick="ddd(this);">' + data + '</a>';
								                }
								                return data;}}
						 
					 ]
				});
				 $("div#accountModal").modal();
				 $(".modal-title").text("거래처검색");
				 
			});
			
			
			/* 계정과목모달 */
			$("#searchBtn3").click(function(){
				/* $("#venderTable td").remove(); */
				/* var $tbody = $("#venderTable tbody"); */
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
					                    data = '<a href="#" onclick="aaa(this);">' + data + '</a>';
					                }
					                return data;}},
						 {data : "accountTitle",
										 "render": function(data, type, row){
								                if(type=='display'){
								                    data = '<a href="#" onclick="aaa(this);">' + data + '</a>';
								                }
								                return data;}}
						 
					 ]
				});
				 $("div#accountModal").modal();
				 $(".modal-title").text("계정과목검색");
			});
			
			
			/* 출금계정과목모달 */
			$("#searchBtn4").click(function(){
				/* $("#venderTable td").remove(); */
				/* var $tbody = $("#venderTable tbody"); */
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
					                    data = '<a href="#" onclick="bbb(this);">' + data + '</a>';
					                }
					                return data;}},
						 {data : "accountTitle",
										 "render": function(data, type, row){
								                if(type=='display'){
								                    data = '<a href="#" onclick="bbb(this);">' + data + '</a>';
								                }
								                return data;}}
						 
					 ]
				});
				 $("div#accountModal").modal();
				 $(".modal-title").text("계정과목검색");
			});
			
			function print(){
				console.log("프린트 매입매출전표");				
			}

		});
		
				
		
	 </script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>