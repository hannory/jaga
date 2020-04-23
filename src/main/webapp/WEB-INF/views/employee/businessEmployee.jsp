<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
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
						<c:forEach var="e" items="${ empList }" >
							<tr>
								<td><input type="checkbox" id="checkk"></td>
								<td>
								<a href="#" onclick="detail('${e.employeeCode}')"><c:out value="${ e.employeeNum }"/></a>
								</td>
								<td>
								<a href="#" onclick="detail('${e.employeeCode}')"><c:out value="${ e.employeeName }"/></a>
								</td>
							</tr>				
						</c:forEach>
					</table>
				
				</div>
				 <!-- enctype="multipart/form-data" -->
				<div id="wrapp2">
				<form action="addBusinessEmp.be" method="post">
				<input type="hidden" name="employeeCode" id="empCode">
				<input type="hidden" name="comCode" value="${ sessionScope.loginCompany.companyCode }">
				<input type="hidden" name="employeeNum" value="${ employeeNum }" id="employeeNum">
					<table id="saveArea">
					
						<tr>
							<th><h4>사업소득자_<span id="empNamee">신규추가</span></h4></th>
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
							<td><input type="text" name="employeeName" id="employeeName"></td>
							<th>주민등록번호</th>
							<td><input type="text" name="securityNumber" id="securityNumber"></td>
						</tr>
						<tr>
							<th>소득구분</th>
							<td>
								<input type="text" id="typeOfBizCode" name="typeOfBizCode" style="width:20%;">
								<button type="button" id="searchBtn3">
									<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
								<input type="text" name="sellTargetName" id="sellTargetName">
								<input type="hidden" name="incomeClass" id="incomeClass">
							</td>
							<th>이메일</th>
							<td><input type="email" name="email" id="email"></td>
						</tr>
						<tr>
							<th>입사일</th>
							<td>
								<input type="text" id="datepicker" name="enrollDate">
							</td>
							<th></th>
							<td></td>
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
								<select name="backCode" id="backCode">
									<option value="001">한국은행</option>
									<option value="002">산업은행</option>
									<option value="003">기업은행</option>
									<option value="004">국민은행</option>
									<option value="005">신한은행</option>
									<option value="006">농협은행</option>
									<option value="00H7">SC은행</option>
									<option value="008">한국씨티은행</option>
									<option value="009">우리은행</option>
								</select>
							</td>
							<th>계좌번호</th>
							<td><input type="text" name="accountNumber" id="accountNumber"></td>
						</tr>
						<tr>
							<th>부서</th>
							<td>
								<select id="department" name="department">
									<option value="001">총무팀</option>
									<option value="002">경리부(회계)</option>
									<option value="003">경영지원팀</option>
									<option value="004">경영개선팀</option>
									<option value="005">인사과</option>
									<option value="006">인사팀</option>
									<option value="007">재경부</option>
									<option value="008">고객만족팀</option>
									<option value="009">구매부서</option>
									<option value="010">관리부서</option>
									<option value="011">기술지원팀</option>
									<option value="012">기획팀</option>
									<option value="013">전략기획팀</option>
									<option value="014">연구기획팀</option>
									<option value="015">연구개발팀</option>
									<option value="016">비서실</option>
									<option value="017">생산관리팀</option>
									<option value="018">시설관리팀</option>
									<option value="019">R&D</option>
									<option value="020">영업팀</option>
									<option value="021">영업기획팀</option>
									<option value="022">영업지원팀</option>
									<option value="023">품질관리팀</option>
									<option value="024">해외사업부</option>
									<option value="025">해외사업팀</option>
									<option value="026">홍보실</option>
									<option value="027">e-Biz팀</option>
								</select>
							</td>
							<th>예금주</th>
							<td><input type="text" name="accountHolder" id="accountHolder"></td>
						</tr>
						
						<tr>
							<th>직급</th>
							<td>
								<select id="positionCode" name="positionCode">
									<option value="000">대표</option>
									<option value="001">회장</option>
									<option value="002">부회장</option>
									<option value="003">사장</option>
									<option value="004">부사장</option>
									<option value="005">전무</option>
									<option value="006">상무</option>
									<option value="007">이사</option>
									<option value="008">부장</option>
									<option value="009">차장</option>
									<option value="010">과장</option>
									<option value="011">대리</option>
									<option value="012">주임</option>
									<option value="013">사원</option>
									<option value="014">인턴</option>
									<option value="015">알바</option>
								</select>
							</td>
							<th>급여</th>
							<td><input type="number" name="salary" placeholder="소득세포함 월급" id="salary"></td>
						</tr>
					</table>
					<div id="fileArea">
						<table id="contentC">
							<tr>
								<th>신분증명서류</th>
								<td>
									<input type="file" name="idPhoto" id="idPhoto">
									<button type="button" id="idPhotoDown">다운</button>
									<button type="button" id="idPhotoDel">삭제</button>
								</td>
							</tr>
							<tr>
								<th>급여계좌사본</th>
								<td>
									<input type="file" name="accountPhoto" id="accountPhoto">
									<button type="button" id="accPhotoDown">다운</button>
									<button type="button" id="accPhotoDel">삭제</button>
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
		/* 날짜 input jquery ui */
		$.datepicker.setDefaults({
			showOn : "both",
			buttonImageOnly : true,
			buttonImage : "${contextPath}/resources/images/calendar.png",
			dateFormat : 'yy-mm-dd'
	
		});
		
		$(function(){
			$("#datepicker").datepicker({});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");
			
			
			if($("#empNamee").text() != '신규추가'){
				$("form").attr("action", "addBusinessEmp.be");
			}
		});
		
		function detail(data){
			$.ajax({
				url:"detailBEmp.be",
				data:{empCode:data},
				success:function(data){
					$("#fileArea").css("display", "block");
					var emp = data.BEmp;
					
					
					var employeeCode = emp.employeeCode;
					var employeeName = emp.employeeName;
					var securityNumber = emp.securityNumber;
					var incomeClass = emp.incomeClass;
					var email = emp.email;
					var enrollDate = emp.enrollDate;
					var backCode = emp.backCode;
					var accountNumber = emp.accountNumber;
					var department = emp.department;
					var positionCode = emp.positionCode;
					var accountHolder = emp.accountHolder;
					var salary = emp.salary;
					var typeOfBixCode = emp.typeOfBixCode;
					var sellTargetName = emp.sellTargetName;
					var incomeClass = emp.incomeClass;
					
					var date1 = new Date(enrollDate); 
					for(var i = 0; i < emp.attList.length; i++){
						if(emp.attList[i].type == 3){
							console.log("신분증명서류");
							$("#idPhoto").attr("type", "text").val(emp.attList[i].newFileName).attr("readonly", "true").attr("name","yeah");
							$("#idPhotoDel").attr("onclick","deletePhoto("+emp.attList[i].fileCode+");");
							$("#idPhotoDown").attr("onclick","downPhoto("+emp.attList[i].fileCode+");");
						}else if(emp.attList[i].type == 4) {
							console.log("뭐시기");
							var zzz = emp.attList[i].filePath;
							$("#accountPhoto").attr("type", "text").val(emp.attList[i].newFileName).attr("readonly", "true").attr("name","yeah");
							$("#accPhotoDel").attr("onclick",'deletePhoto('+emp.attList[i].fileCode+');');
							$("#accPhotoDown").attr("onclick",'downPhoto('+emp.attList[i].fileCode+');');
							
						}
					}
					
					$("#employeeNum").val(emp.employeeNum);
					$("#empNamee").text(employeeName);
					$("#empCode").val(employeeCode);
					$("#employeeName").val(employeeName);
					$("#securityNumber").val(securityNumber);
					$("#incomeClass").val(incomeClass);
					$("#email").val(email);
					$("#datepicker").datepicker('setDate',date1);
					$("#backCode").val(backCode);
					$("#accountNumber").val(accountNumber);
					$("#department").val(department);
					$("#positionCode").val(positionCode);
					$("#accountHolder").val(accountHolder);
					$("#salary").val(salary);
					$("#typeOfBizCode").val(typeOfBixCode);
					$("#sellTargetName").val(sellTargetName);
					$("#incomeClass").val(incomeClass);
					
					console.log($("#employeeNum").val());
					
					$("form").attr("action", "addBusinessEmp2.be").attr("encType","multipart/form-data");
					
				}
			});
		}
	
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
		
		
		function deletePhoto(code){
			console.log(code);
			
			location.href="deletePhoto.be?fileCode="+code;
			
			/* $.ajax({
				url:"deletePhoto.be",
				data:{fileCode:code},
				success:function(data){
					location.href="businessEmpList.be";
				}
			}); */
		}
		
		
		function downPhoto(code){
			console.log(code);
			
			location.href="downloadPhoto.be?fileCode="+code;
			
		}
		
		
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
			$("#incomeClass").val(pk);
			
			 $("div#accountModal").modal("hide");
		}
	</script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>