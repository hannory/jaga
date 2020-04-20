<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>

<style>
	body{
		background:red;
	}
 
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
	
	/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 0 auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .modalTop{
        	margin: 0;
        	width:100%;
        	height:50px;
        	background:#6E00AB;
        }
        
        .modal-header {
        	background: #296355;
        } 
	
	#resultReTable input {
		text-align: center;
	}
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<main>
	<div class="container-fluid">
		<h2 class="mt-4">매입매출전표입력</h2>
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
					<tr>
						<td> </td>
						<td colspan="3">
							<input type="text">
								<button type="button" id="searchBtn1" >
									<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
							
							<input type="text">
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
							<input type="number" name="supplydeaga" id="supplydeaga" placeholder="부가세포함금액">
						</td>
					</tr>
					<tr>
						<td>공급가액</td>
						<td colspan="3"><input type="number" name="supplyValue" id="supplyValue"></td>
					</tr>
					<tr>
						<td>부가세</td>
						<td colspan="3"><input type="number" name="valueTax" id="valueTax"></td>
					</tr>
					<tr>
						<td>적요</td>
						<td colspan="3"><input type="text" name="brief"></td>
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
						<td>수수료</td>
						<td colspan="3">
							<input type="text" id="abc">
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
				<input type="button" value="의제">
				<input type="submit" value="확인">				
				<input type="button" value="수정">				
			</div>
		</div>
		</form>
		<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</div>
	</main>
	
	
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
	
		
		$(function() {
			$("#datepicker").datepicker({});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");
			
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
			})
			
			
			/* 공급대가 입력시 부가세 자동 계산 */
			$("#supplydeaga").blur(function(){
				var supply = $(this).val();
				var vTax = $("#valueTax").prop("readonly");
				
				if(vTax == true){
					$("#supplyValue").val(supply);
					$("#valueTax").val(0);
				}else{
					
					$.ajax({
						url:"calculTax.rp",
						type:"post",
						data:{supplydeaga : supply},
						success:function(data){
							var value = data.value;
							var tax = data.tax;
							
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
					
					if($("evidence2").val() == 20){
						
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
			
			/* 거래처모달 */
			$("#searchBtn2").click(function(){
				
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
				 $("div#accountModal").modal();
				 
				 
			});
			
			
			/* 계정과목모달 */
			$("#searchBtn3").click(function(){
				/* $("#venderTable td").remove(); */
				/* var $tbody = $("#venderTable tbody"); */
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
			});
			
			
			/* 출금계정과목모달 */
			$("#searchBtn4").click(function(){
				/* $("#venderTable td").remove(); */
				/* var $tbody = $("#venderTable tbody"); */
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
			});
			
			function print(){
				console.log("프린트 매입매출전표");				
			}

		});
		
				
		
	 </script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>