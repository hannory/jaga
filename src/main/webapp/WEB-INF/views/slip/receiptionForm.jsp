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
	#searchBtn{
		background: none;
		border: none;
		outline: none;
	}
	button[id^=searchBtn]{
		
	}
	#hideArea {
		display: none;
	}
	#evidence2{
		display: none;
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
	
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<main>
	<div class="container-fluid">
		<h2 class="mt-4">매입매출전표입력</h2>
			<form>
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
							<input type="radio" name="division" id="sale" value="sale" checked><label for="sale">매출</label>&nbsp;
							<input type="radio" name="division" id="buy" value="buy"><label for="buy">매입</label>
						</td>
					</tr>
					<tr>
						<td>부가세유형</td>
						<td colspan="3">
							<select name="evidence1" id="evidence1">
								<option value="10">세금계산서</option>
								<option value="20">계산서</option>
								<option value="30">영세율</option>
								<option value="150">무증빙</option>
								<option value="40">간이과세</option>
								<option value="130">수출</option>
								<option value="60">카드</option>
								<option value="70">카드(면세)</option>
								<option value="80">카드(영세)</option>
								<option value="140">무증빙(면세)</option>
								<option value="100">현금영수증</option>
								<option value="80">현금영수증(면세)</option>
								<option value="90">현금영수증(영세)</option>
							</select>
							<select name="evidence2" id="evidence2">
								<option value="10">세금계산서</option>
								<option value="20">계산서</option>
								<option value="30">영세율</option>
								<option value="110">불공제</option>
								<option value="40">간이과세</option>
								<option value="120">수입</option>
								<option value="60">카드</option>
								<option value="70">카드(면세)</option>
								<option value="80">카드(영세)</option>
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
							<input name="venderCode" type="text">
								<button type="button" id="searchBtn2">
									<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
							
							<input name="venderName" type="text">
						</td>
					</tr>
					<tr>
						<td>공급가액</td>
						<td colspan="3"><input type="number" name="supplyValue"></td>
					</tr>
					<tr>
						<td>부가세</td>
						<td colspan="3"><input type="number" name="valueTax"></td>
					</tr>
					<tr>
						<td>적요</td>
						<td colspan="3"><input type="text" name="brief"></td>
					</tr>
					<tr>
						<td>계정과목</td>
						<td colspan="3">
							<input type="text" name="accountCode">
								<button type="button" id="searchBtn3">
									<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
							
							<input type="text" name="accountName">
						</td>
					</tr>
					<tr>
						<td>출금계정과목</td>
						<td colspan="3">
							<input type="text" >
								<button type="button" id="searchBtn4">
									<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
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
		
		$(function() {
			$("#datepicker").datepicker({});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");
			
			/* 라디오버튼 이벤트 */
			$("input").filter("[name='division']").click(function(){
				if($(this).val() == 'buy'){
					/* 매입 */
					$("#insertReTable tr").eq(8).children().eq(0).text("입금계정과목");
					$("#evidence2").css("display", "block");
					$("#evidence1").css("display", "none");
				}else if($(this).val() == 'sale'){
					/* 매출 */
					$("#insertReTable tr").eq(8).children().eq(0).text("출금계정과목");
					$("#evidence1").css("display", "block");
					$("#evidence2").css("display", "none");
				}
			})
			
			/* 전표미리보기 이벤트 */
			$("#preview").click(function(){
				$("#hideArea").css("display", "block");
			});
			
			
			$("#searchBtn2").click(function(){
				 $.ajax({
						url:"venderSearch.rp",
						type:"post",
						data:{
						},
						success:function(data){
							console.log(data);
						}
					})
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