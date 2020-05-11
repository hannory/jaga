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
	
	#content {
		width: 100%;
	}
	#contentH {
		width: 100%;
	}
	#contentB {
		width: 100%;
	}
	#contentB td{
		padding-left: 5px;
		padding-bottom: 10px;
		padding-top: 10px;
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
	#contentF {
		width: 100%;
	}
	
	input {
		border-top-left-radius: 5px;
		border-top-right-radius: 5px;
		border-bottom-left-radius: 5px;
		border-bottom-right-radius: 5px;
		border: 1px solid lightgray;
	}
	
	#contentF input {
		border: none;
	}
	#contentF th{
		text-align: center;
		background: #296355;
		color: white;
	}
	#contentF tr:last-child{
		/* background: #D4D5D9; */
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
	
	#contentF tbody input{
		text-align: right;
		padding-right: 6px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<main>
	<div class="container-fluid">
		<h2 class="mt-4">사업소득자료입력</h2>
		<div class="card mb-4">
			<div class="card-body">
				<div id="wrapp1">
				<form action="">
					<input type="text">
					<button id="searchBtn">
						<img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
					</button>
				</form>
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
				
				<div id="wrapp2">
					<form action="insertBPay.bp" method="post">
					<table id="content">
						<thead>
							<tr>
								<td>
									<table id="contentH">
										<tr>
											<th><h4>사업소득자<sapn id="empNamee"></span></h4></th>
											<td align="right" style="padding-right:5px;"><button id="saveBtn">저장</button></td>
										</tr>
									</table>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="padding:10px;">
									<table id="contentB">
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
												<input type="text" id="typeOfBizCode" name="typeOfBizCode" style="width:40%;">
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
											<th>급여이체 은행</th>
											<td>
												<select name="backCode" id="backCode">
													<option value="002">산업은행</option>
													<option value="003">기업은행</option>
													<option value="004">국민은행</option>
													<option value="005">신한은행</option>
													<option value="006">농협은행</option>
													<option value="007">SC은행</option>
													<option value="008">한국씨티은행</option>
													<option value="009">우리은행</option>
												</select>
											</td>
											<th>계좌번호</th>
											<td><input type="text" name="accountNumber" id="accountNumber"></td>
										</tr>
										<tr>
											<th>예금주</th>
											<td><input type="text" name="accountHolder" id="accountHolder"></td>
											<th>급여</th>
											<td><input type="text" name="salary" placeholder="소득세포함 월급" id="salary" style="text-align:right; padding-right:6px;"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="padding-top:20px;">
									<input type="hidden" name="employeeCode" id="empCode">
									<input type="hidden" name="employeeNum" value="${ employeeNum }" id="employeeNum">
									<table id="contentF" border="1">
									<colgroup>
										<col width="6%">
										<col width="6%">
										<col width="6%">
										<col width="6%">
										<col width="6%">
										<col width="20%">
										<col width="6%">
										<col width="10%">
										<col width="10%">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th colspan="2">귀속년월</th>
											<th colspan="3">지급일자</th>
											<th rowspan="2">지급액</th>
											<th rowspan="2">세율</th>
											<th rowspan="2">소득세</th>
											<th rowspan="2">지방소득세</th>
											<th rowspan="2">차인지급액</th>
										</tr>
										<tr>
											<th>년</th>
											<th>월</th>
											<th>년</th>
											<th>월</th>
											<th>일</th>
										</tr>
									<thead>
									<tbody>
										<c:forEach var="num" begin="1" end="12">
										<c:if test="${ num < 10 }">
											<c:set var="mon" value="0${ num }"></c:set>
										</c:if>
										<c:if test="${ num >= 10 }">
											<c:set var="mon" value="${ num }"/>
										</c:if>
											<tr>
												<td><input type="text" style="width:100%" name="attYear" id="attYear" value="2020" readonly></td>
												<td><input type="text" style="width:100%" name="attMonth" id="attMonth" value="${ mon }" readonly></td>
												<td><input type="text" style="width:100%" name="payYear" id="payYear" readonly></td>
												<td><input type="text" style="width:100%" name="payMonth" id="payMonth" ></td>
												<td><input type="text" style="width:100%" name="payDay" id="payDay"></td>
												<td><input type="text" style="width:100%" name="salary" id="salary" onkeyup="inputNumberFormat(this);"></td>
												<td><input type="text" style="width:100%" name="taxVal" id="tax" readonly></td>
												<td><input type="text" style="width:100%" name="incomeTax" id="incomeTax" onloadeddata="numberFormat(this);"></td>
												<td><input type="text" style="width:100%" name="localIncomeTax" id="localIncomeTax"></td>
												<td><input type="text" style="width:100%" name="differencePymt" id="differencePymt"></td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr style="background:#D4D5D9">
											<th colspan="5" style="background:#D4D5D9; color:black;">합계</th>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tfoot>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
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
	</main>
	
	<!-- 로딩? -->
	<div id="loading">
        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
    </div>
	
	<script>
		$(function(){
			$("#contentF tr").each( function (index) {
				var num = index - 2;
				
		        $(this).find("input[id=attYear]").attr("id", "bpList[" + num + "].attYear");
		        $(this).find("input[id=attMonth]").attr("id", "bpList[" + num + "].attMonth");
		        $(this).find("input[id=payYear]").attr("id", "bpList[" + num + "].payYear");
		        $(this).find("input[id=payMonth]").attr("id", "bpList[" + num + "].payMonth");
		        $(this).find("input[id=payDay]").attr("id", "bpList[" + num + "].payDay");
		        $(this).find("input[id=salary]").attr("id", "bpList[" + num + "].salary");
		        $(this).find("input[id=incomeTax]").attr("id", "bpList[" + num + "].incomeTax");
		        $(this).find("input[id=localIncomeTax]").attr("id", "bpList[" + num + "].localIncomeTax");
		        $(this).find("input[id=differencePymt]").attr("id", "bpList[" + num + "].differencePymt");
		    });
			
			/* 폼전송시 콤마 빼기++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++= */
			$("form").submit(function(){
				$("input").each(function(){
					$(this).val(uncomma($(this).val()));
				});
			});
			
			
			/* 소득세 계산++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++= */
			var idx = 0;
			
			$("input[name*=salary]").blur(function(){
				var salary = uncomma($(this).val());
				var salaryTag = $(this);
				var inputs = $(this).parent().siblings().children();
				$.ajax({
					url:"calculTax.bp",
					data:{salary:salary},
					success:function(data){
						var incomeT = data.incomeTax;
						var localTax = data.localTax;
						var diffrence = data.di;
						
						
						inputs.filter("[name=incomeTax]").val(comma(incomeT));
						inputs.filter("[name=localIncomeTax]").val(comma(localTax));
						inputs.filter("[name=taxVal]").val(3);
						inputs.filter("[name=differencePymt]").val(comma(diffrence));
						
						inputs.filter("[name=attYear]").attr("name", "bpList[" + idx + "].attYear");
						inputs.filter("[name=attMonth]").attr("name", "bpList[" + idx + "].attMonth");
						inputs.filter("[name=payYear]").attr("name", "bpList[" + idx + "].payYear");
						inputs.filter("[name=payMonth]").attr("name", "bpList[" + idx + "].payMonth");
						inputs.filter("[name=payDay]").attr("name", "bpList[" + idx + "].payDay");
						salaryTag.attr("name", "bpList[" + idx + "].salary");
						inputs.filter("[name=incomeTax]").attr("name", "bpList[" + idx + "].incomeTax");
						inputs.filter("[name=localIncomeTax]").attr("name", "bpList[" + idx + "].localIncomeTax");
						inputs.filter("[name=differencePymt]").attr("name", "bpList[" + idx + "].differencePymt");
						
						idx++;
						
					}
				});
			});
			/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
			
			
			/* 지급일자 년월 자동입력+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
			
			$("input[name*=payYear]").focus(function(){
				var inputs = $(this).parent().siblings().children();
				
				$(this).val(inputs.filter("[name=attYear]").val());
				inputs.filter("[name=payMonth]").val(inputs.filter("[name=attMonth]").val());
				
				inputs.filter("[name=payDay]").focus();
			});
			
			
			/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
			
		});
		/* 콤마찍기+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
		//콤마찍기
		function comma(str) {
		    str = String(str);
		    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		
		//콤마풀기
		function uncomma(str) {
		    str = String(str);
		    return str.replace(/[^\d]+/g, '');
		}
		
		function inputNumberFormat(obj) {
		    obj.value = comma(uncomma(obj.value));
		}
		/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
	
		/* 직원 상세정보 불러오기++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
		function detail(data){
			$.ajax({
				url:"detailBEmp.bp",
				data:{empCode:data},
				success:function(data){
					//$("#fileArea").css("display", "block"); 
					var emp = data.BEmp;
					//console.log(emp);
					var payList = data.payList;
					
					$("#contentF tbody td:nth-of-type(2) ~ td").children().val("");
					
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
					var salary = comma(emp.salary);
					var typeOfBixCode = emp.typeOfBixCode;
					var sellTargetName = emp.sellTargetName;
					var incomeClass = emp.incomeClass;
					
					var date1 = new Date(enrollDate); 
					
					$("#employeeNum").val(emp.employeeNum);
					$("#empNamee").text("-"+ employeeName);
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
						
					/* 귀속년월에 맞게 행 찾아서 넣어줌! */
					for(var i = 0; i < payList.length; i++){
						var payment = payList[i];
						payment.attMonth;
						$("input[name*=attMonth]").each(function(index){
							if($(this).val() == payment.attMonth){
								var inputs = $(this).parent().siblings().children();
								inputs.filter("[name=payYear]").val(payment.payYear);
								inputs.filter("[name=payMonth]").val(payment.payMonth);
								inputs.filter("[name=payDay]").val(payment.payDay);
								inputs.filter("[name=salary]").val(comma(payment.salary));
								inputs.filter("[name=taxVal]").val(3);
								inputs.filter("[name=incomeTax]").val(comma(payment.incomeTax));
								inputs.filter("[name=localIncomeTax]").val(comma(payment.localIncomeTax));
								inputs.filter("[name=differencePymt]").val(comma(payment.differencePymt));
							}
							
						});
							
					}
				}
			});
		}
		/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */

		
	</script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>