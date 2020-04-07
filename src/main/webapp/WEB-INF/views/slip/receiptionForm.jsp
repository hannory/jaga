<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		background:red;
	}
	input {
 		border:1px solid lightgray;
 		border-radius: 5%;
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
							<input type="radio" name="receipDivi" id="sale" value="sale" checked><label for="sale">매출</label>&nbsp;
							<input type="radio" name="receipDivi" id="buy" value="buy"><label for="buy">매입</label>
						</td>
					</tr>
					<tr>
						<td>부가세유형</td>
						<td colspan="3">
							<select name="evidence1" id="evidence1">
								<option value="">세금계산서</option>
								<option value="">계산서</option>
								<option value="">영세율</option>
								<option value="">무증빙</option>
								<option value="">간이과세</option>
								<option value="">수출</option>
								<option value="">카드</option>
								<option value="">카드(면세)</option>
								<option value="">카드(영세)</option>
								<option value="">무증빙(면세)</option>
								<option value="">현금영수증</option>
								<option value="">현금영수증(면세)</option>
								<option value="">현금영수증(영세)</option>
							</select>
							<select name="evidence2" id="evidence2">
								<option value="">세금계산서</option>
								<option value="">계산서</option>
								<option value="">영세율</option>
								<option value="">불공제</option>
								<option value="">간이과세</option>
								<option value="">수입</option>
								<option value="">카드</option>
								<option value="">카드(면세)</option>
								<option value="">카드(영세)</option>
								<option value="">무증빙(면세)</option>
								<option value="">현금영수증</option>
								<option value="">현금영수증(면세)</option>
								<option value="">현금영수증(영세)</option>
							</select>
						</td>
					</tr>
					<tr>
						<td> </td>
						<td colspan="3">
							<input type="text">
								<button id="searchBtn" >
									<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
							
							<input type="text">
						</td>
					</tr>
					<tr>
						<td>거래처</td>
						<td colspan="3">
							<input type="text">
								<button id="searchBtn">
									<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
							
							<input type="text">
						</td>
					</tr>
					<tr>
						<td>공급가액</td>
						<td colspan="3"><input type="number"></td>
					</tr>
					<tr>
						<td>부가세</td>
						<td colspan="3"><input type="number"></td>
					</tr>
					<tr>
						<td>적요</td>
						<td colspan="3"><input type="text"></td>
					</tr>
					<tr>
						<td>계정과목</td>
						<td colspan="3">
							<input type="text">
								<button id="searchBtn">
									<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
							
							<input type="text">
						</td>
					</tr>
					<tr>
						<td>출금계정과목</td>
						<td colspan="3">
							<input type="text">
								<button id="searchBtn">
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
				<button id="preview">전표 미리보기</button>
				
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
		
		<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</div>
	</main>
	
	<!-- 카드 선택 모달 -->
	
	<!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <p>Some text in the Modal..</p>
      </div>
 
    </div>
    
	<!-- 거래처 선택 모달 -->
	
	<!-- The Modal -->
    <!-- Modal content -->
      <div class="modal-content3">
        <span class="close">&times;</span>                                                               
        <div class="modalTop"></div>
        	
        <div class="modalBtn">
        	<span><button class="cancel">확인</button></span>&nbsp;
        </div>
      </div>
    
	<!-- 계정과목 선택 모달 -->
	
	<!-- The Modal -->
    <div id="myModal2" class="modal2">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <p>Some text in the Modal..</p>
      </div>
 
    </div>
    
	<!-- 계좌 선택 모달 -->
	
	<!-- The Modal -->
    <div id="myModal3" class="modal3">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <p>Some text in the Modal..</p>
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
			$("input").filter("[name='receipDivi']").click(function(){
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
			
			
			
			function print(){
				console.log("프린트 매입매출전표");				
			}

		});
		
		
		/* 모달모달----------------------------------------------------------------------------------------------- */
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("searchBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];                                          

		// When the user clicks on the button, open the modal 
		btn.onclick = function() {
		    modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		    modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		    }
		}
		<div class="print">
		
		</div>
		
	 </script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>