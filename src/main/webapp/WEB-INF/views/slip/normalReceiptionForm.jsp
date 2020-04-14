<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가경리</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
				<button id="addRow">클릭</button>
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
						<col width="5%"/>
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th>월</th>
							<th>일</th>
							<th>번호</th>
							<th>구분</th>
							<th>코드</th>
							<th>계정과목</th>
							<th>코드</th>
							<th>거래처</th>
							<th>번호</th>
							<th>적요</th>
							<th>차변</th>
							<th>대변</th>
						</tr>
					</thead>
					</table>
				</form>
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
          <p>1.「매출처별,매입처별 세금계산서합계표 합계」</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
      <!-- Modal 거래처 -->
  <div class="modal fade" id="clientModel" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">거래처검색</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <p>1.「매출처별,매입처별 세금계산서합계표 합계」</p>
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
			$("#datepicker1").datepicker({});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");
			
			$("#normalReTable").DataTable({
				// 표시 건수기능 숨기기
				lengthChange: false,
				// 검색 기능 숨기기
				searching: false,
				// 정렬 기능 숨기기
				ordering: false,
				// 정보 표시 숨기기
				info: false,
				// 페이징 기능 숨기기
				paging: false
				
			});
			
			
			
			var t = $('#normalReTable').DataTable();
		    var counter = 1;
		 	var $checkbox = "<input type='checkbox'>";
		 	var $inputText = "<input type='text' value='";
		 	var $inputText2 = "' style='width:100%;'>"
		    $('#addRow').on( 'click', function () {
		        t.row.add( [
		            $checkbox,
		            $inputText + counter + $inputText2,
		            $inputText + counter + $inputText2,
		            $inputText + counter + $inputText2,
		            $inputText + counter + $inputText2,
		            $inputText + counter + $inputText2,
		            $inputText + counter + $inputText2,
		            $inputText + counter + $inputText2,
		            $inputText + counter + $inputText2,
		            $inputText + counter + $inputText2,
		            $inputText + counter + $inputText2,
		            $inputText + counter + $inputText2,
		            $inputText + counter + $inputText2
		        ] ).draw( false );
		 
		        counter++;
			
		        
		        $("input").focus(function(){
					console.log("dddddddddddd");
					$("#normalReTable input").css("background", "white");
					$("#normalReTable td").css("background", "white");
					$("#normalReTable tr").css("background", "white"); 
					
					$(this).parent().parent().children().css("background", "#DDEBF7");
					$(this).parent().parent().children().children().css("background", "#DDEBF7");
					$(this).parent().children().css("background", "#DDEBF7");
					$(this).parent().css("background", "#b3cfe4");
					$(this).parent().children().css("background", "#b3cfe4");
					
					
				});
		    } );
			
			
			$("input").focus(function(){
				console.log("dddddddddddd");
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
				$(this).keydown(function(key){
					if(key.keyCode == 113){
		    		  $("div#accountModal").modal();
					}
				})
			});
			$("#normalReTable td:nth-child(8)").children().focus(function(){
				$(this).keydown(function(key){
					if(key.keyCode == 113){
		    		  $("div#clientModel").modal();
					}
				})
			});
			
			$("input").keydown(function(key){
			key.value = comma(uncomma(key.value));
				if(key.keyCode == 187){
					
				}
			})
			
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

		});
		
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
		
		
	 </script>
	 <script>

</script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>