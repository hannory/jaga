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
	#normalReTable td {
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
	
	#resultReTable td{
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
	
	main td {
		height: 50px;
	}
	
	.modal-header{
		background: #24574A;
		color: white;
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
					<td>
						<input type="text" id="datepicker">~<input type="text" id="datepicker1">&nbsp;
						<button onclick="dateSearch();">검색</button></td>
					<td><div style="color:red;">대차차액 : </div></td>
				</tr>
			</table>
		</ol>
		<div class="card mb-4">
			<div class="card-body">
			<form action="normalValue.nr" method="post">
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
					<tbody>
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
							<td><input type="text" class="price" name="price" id='dea' style="width:100%;" onkeyup="inputNumberFormat(this);"></td>
						</tr>
					</tbody>
					</table>
				</form>
			</div>
		</div>	
		<div class="card mb-4">
			<div class="card-body">
			<table id="dateReTable">
				<tr>
					<th>일자 : 2020 년  월  일</th>
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
		
		
		$(function() {
			$("#datepicker").datepicker({});
			$("#datepicker1").datepicker({});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");
			
			$("input").focus(function(){
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
				/* $(".month").each(function(index){
					var monthVal = $(this).val();
					$(".day").each(function(index1){
						var dayVal = $(this).val();
						
						if(thisDay == dayVal && thisMonth == monthVal){
							slipNum++;
						}
					});
				});
				if(slipNum == 1){
					inputs.filter("[name=dateSlipCode]").val("00001");
				}else if(slipNum > 1){
					inputs.filter("[name=dateSlipCode]").val("12");
				}
				 */
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
			str.value = comma(uncomma(str.value));
		}
		
		function dateSearch(){
			var date1 = $("#datepicker").val();
			var date2 = $("#datepicker1").val();
			
			console.log("date1 : " + date1);
			console.log("date2 : " + date2);
			
			$.ajax({
				url:"normalReceipSearch.nr",
				type:"get",
				data:{
					date1 : date1,
					date2 : date2
				},
				success:function(data){
					console.log(data);
				}
			})
		};
		
		
		var chaValue = null;
		var deaValue = null;
		function addTr(vvv){
			var pr = vvv;
			var inputs_01 = $(pr).parent().parent().children().children();			
			var numberC = 0;
			if(event.keyCode == 13){
				var $tbody = $("#normalReTable tbody");
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
				
				console.log(chaValue);
				console.log(deaValue);
				
				if(chaValue == deaValue){
					console.log("차대 맞음");
				}else{
					console.log("차대 안맞으");
				}
				
				
				$("input").focus(function(){
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
					
					
					
				});
				
			/* 	$(".day").blur(function(){
					var inputs = $(this).parent().parent().children().children();
					var thisDay = $(this).val();
					var thisMonth = inputs.filter(".month").val();
					var $month = $(".month");
					
					if(thisDay < 10){
						$(this).val("0"+$(this).val());
					}
					
					var slipNum = 0;
					var num ="";
					var cha = 0;
					var dea = 0;
					
					var trs = $("#normalReTable tbody tr");
					
					for(var i = 0; i < trs.length-1; i++){
						var month = $(trs).eq(i).children().children().filter(".month").val();
						var day = $(trs).eq(i).children().children().filter(".day").val();
						var debit = $(trs).eq(i).children().children().filter(".debit").val();
						var price = null;
						var dateSlipCode = $(trs).eq(i).children().children().filter(".dateSlipCode").val();
						var priceB = null;
						var debitB = $(trs).eq(i-1).children().children().filter(".debit").val();
						
						if(debit == '차변'){
							price = $(trs).eq(i).children().children().filter("#cha").val();
						}else if(debit == '대변'){
							price = $(trs).eq(i).children().children().filter("#dea").val();
						}
						
						if(debitB == '차변'){
							priceB = $(trs).eq(i-1).children().children().filter("#cha").val();
						}else if(debitB == '대변'){
							priceB = $(trs).eq(i-1).children().children().filter("#dea").val();
						}
						
						
						for(var j = 1; j < trs.length; j++){
							var month1 = $(trs).eq(j).children().children().filter(".month").val();
							var day1 = $(trs).eq(j).children().children().filter(".day").val();
							var debit1 = $(trs).eq(j).children().children().filter(".debit").val();
							var price1 = null;
							var dateSlipCode1 = $(trs).eq(j).children().children().filter(".dateSlipCode").val();
							
							if(debit1 == '차변'){
								price1 = $(trs).eq(j).children().children().filter("#cha").val();
							}else if(debit1 == '대변'){
								price1 = $(trs).eq(j).children().children().filter("#dea").val();
							}
							
							console.log(price);
							console.log("bbb" + priceB);
							
							if(month == month1 && day == day1){
								slipNum++;
								if(price1 == "" && price != priceB){
									inputs.filter("[name=dateSlipCode]").val(dateSlipCode);
								}else{
									
									if(debit == '차변'){
										cha += price;
									}else{
										dea += price;
									}
									
									if(debit1 == '대변'){
										dea += price;
									}else {
										cha += price;
									}
									
									if(thisDay==day1 && month1 == thisMonth && cha == dea){
										inputs.filter("[name=dateSlipCode]").val(dateSlipCode1+1);
									}
								}
								
							}
							
							
						}
						
					}
					
					if(slipNum == 0){
						inputs.filter("[name=dateSlipCode]").val("00001");
					}else if(slipNum == 3){
						inputs.filter("[name=dateSlipCode]").val("12");
					}
					
					
					
					inputs.filter(".debit").focus();
					
				}); */
				
				

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