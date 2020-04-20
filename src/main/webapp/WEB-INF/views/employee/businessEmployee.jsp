<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#searchBtn{
		background: none;
		border: none;
		outline: none;
	}
	#searchBtn3{
		background: none;
		border: none;
		outline: none;
	}
	
	#wrapp1 {
		float: left;
		width: 20%;
	}
	#wrapp2 {
		float: right;
		width: 70%;
	}
	
	#empList {
		width: 100%;
		font-weight: bold;
		color: #4C4C4C;
	}
	
	#empList tr {
		border-bottom: 1px solid black;
		padding: 10px;
	}
	#empList td {
		padding: 10px;
	}
	
	input {
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-left-radius: 5px;
		border-bottom-right-radius: 5px;
		border: 1px solid lightgray;
	}
	
	#saveBtn {
		background: #296355;
		border: 1px solid #296355;
		color: white;
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-left-radius: 5px;
		border-bottom-right-radius: 5px;
		
	}
	
	#wrapp2 td{
		padding-left: 5px;
		padding-bottom: 20px;
		padding-top: 20px;
	}
	
	#contentA {
		width: 100%;
	}
	
	#contentB {
		width: 100%;
	}
	
	#contentC {
		width: 100%;
	}
	
	#contentA th:first-child {
		text-align: right;
		color:#4C4C4C;
		padding-right: 5px;
	}
	
	#contentA th:nth-child(3) {
		text-align: right;
		color:#4C4C4C;
		padding-right: 5px;
	}
	
	#contentB th:first-child {
		text-align: right;
		color:#4C4C4C;
		padding-right: 5px;
	}
	#contentB th:nth-child(3) {
		text-align: right;
		color:#4C4C4C;
		padding-right: 5px;
	}
	
	#contentC th:first-child {
		text-align: right;
		color:#4C4C4C;
		padding-right: 5px;
	}
	
	#fileArea {
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
        
        .modal-header {
        	background: #296355;
        } 
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<main>
		<div class="container-fluid">
		<h2 class="mt-4">직원관리</h2>
		<div class="card mb-4">
			<div class="card-body">
				<div id="wrapp1">
					<input type="text">
					<button id="searchBtn">
						<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
					</button>
				<br>
					<table id="empList" style="text-align: center;">
						<tr>
							<td><input type="checkbox" id="checkk"></td>
							<td>10001</td>
							<td>최새우</td>
						</tr>				
					</table>
				
				</div>
				
				<div id="wrapp2">
				<form action="addBusinessEmp.be" method="post">
					<table id="saveArea">
					
						<tr>
							<th><h4>사업소득자_신규추가</h4></th>
							<td><button id="saveBtn">저장하기</button></td>
						</tr>
					</table>
					
					<table id="contentA">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
					</colgroup>
						<tr>
							<th>이름</th>
							<td><input type="text" name="employeeNum"></td>
							<th>주민등록번호</th>
							<td><input type="text" name="securityNumber"></td>
						</tr>
						<tr>
							<th>소득구분</th>
							<td>
								<input type="text" id="typeOfBizCode" name="typeOfBizCode incomeClass">
								<button type="button" id="searchBtn3">
									<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
								<input type="text" name="sellTargetName" id="sellTargetName">
								<input type="hidden" name="tobcPkCode" id="tobcPkCode">
							</td>
							<th>이메일</th>
							<td><input type="email" name="email"></td>
						</tr>
					</table>
					
					<table id="contentB">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
					</colgroup>
						<tr>
							<th>급여이체은행</th>
							<td>
								<select>
									<option value="1">한국은행</option>
									<option value="2">산업은행</option>
									<option value="3">기업은행</option>
									<option value="4">국민은행</option>
									<option value="5">신한은행</option>
									<option value="6">농협은행</option>
									<option value="7">SC은행</option>
									<option value="8">한국씨티은행</option>
									<option value="9">우리은행</option>
								</select>
							</td>
							<th>계좌번호</th>
							<td><input type="text" name="accountNumber"></td>
						</tr>
						<tr>
							<th>부서</th>
							<td>
							
							</td>
							<th>예금주</th>
							<td><input type="text" name="accountHolder"></td>
						</tr>
					</table>
					<div id="fileArea">
						<table id="contentC">
							<tr>
								<th>신분증명서류</th>
								<td>
									<input type="file">
								</td>
							</tr>
							<tr>
								<th>급여계좌사본</th>
								<td>
									<input type="file">
								</td>
							</tr>
						</table>
					</div>
					</form>
				</div>
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
          <h4 class="modal-title">소득구분</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          	<table id="reTable">
          		<thead>
	          		<tr>
	          			<th>소득코드</th>
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
		$("#searchBtn3").click(function(){
			$("#reTable td").remove();
			var $tbody = $("#reTable tbody");
			
			$.ajax({
				url:"tobcSearch.be",
				success:function(data){
					var list = data.bkList;
					console.log(list);
					for(var i = 0; i < list.length; i++){
						var name = list[i].sellTargetName;
						var $tr = $("<tr>");
						var $codeTd = $("<td>").html("<a href='#' onclick='aaa(this,"+list[i].tobcPkCode+","+list[i].typeOfBizCode+");'>"+list[i].typeOfBizCode+"</a>");
						var $nameTd = $("<td>").html("<a href='#' onclick='aaa(this,"+list[i].tobcPkCode+","+list[i].typeOfBizCode+");'>"+list[i].sellTargetName+"</a>");
						
						
						$tr.append($codeTd);
						$tr.append($nameTd);
						$tbody.append($tr);
					}
				}
				
			});
			
		
			$("div#accountModal").modal();
		});
		
		
		
		var accountC = "";//계정과목
		var accountN;
		function aaa(value, pk, code){
			
			$(value).parent().parent().children().each(function(index){
				accountC += ","+$(this).text();
			})
			var account = accountC.split(",");
			accountC = account[1];
			accountN = account[2];
			
			$("#typeOfBizCode").val(code);
			$("#sellTargetName").val(accountN);
			$("#tobcPkCode").val(pk);
			
			 $("div#accountModal").modal("hide");
		}
	</script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>