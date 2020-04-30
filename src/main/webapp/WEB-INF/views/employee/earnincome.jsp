<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
#emplist{
display:inline-block;
}

#paylist{
display:inline-block;
}

#deduction{
display:inline-block;
}


        div,pre { background : #FFF; padding:10px; margin:10px; }
        table { border:1px solid #AAA; }
        td { border:1px solid #AAA; width:25px; height:25px; }
        .selected { background:red }

</style>
<body>
	<jsp:include page="../common/menubar.jsp" />
		<div id="main">
	<div class="container-fluid">
	
 	<span id="emplist">
	<table style="border:1px solid"; id="listArea2">
	<tr>
	<th style="text-align:center">사번</th><th style="text-align:center">사원명</th>
	</tr>
	 <c:if test="${ !empty sessionScope.loginCompany }">   
 		<c:forEach var="emp2" items="${list}">
		 <tr> <td style="border:0px;text-align:center"><c:out value="${emp2.employeeNum}"/></td> 
			 <td style="border:0px; text-align:center"><c:out value="${emp2.employeeName}"/></td> 
			 <td style="border:0px; text-align:center"><c:out value="${emp2.employeeCode}"/></td> 
		</tr> 
		</c:forEach> 
 		</c:if> 
	</table>	 
	</span> 
	

    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("li").each(function () {
                $(this).click(function () {
                    $(this).addClass("selected");                      //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
                    $(this).siblings().removeClass("selected");  //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
                });
            });
        });
    </script>

	
	
	 <script>
	$(function(){
		$("#listArea2 td").mouseenter(function(){
			$(this).parent().css({"background":"#F0F0F0","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css("background","white");
		}).click(function(){
			var employeeCode2 =$(this).parent().children().eq(2).text();
			console.log(employeeCode2);
			$("#abc").val(employeeCode2);
			$(this).parent().css({background:"gray"});
/* 			location.href="${contextPath}/employeeinsert.emp?employeeCode="+employeeCode; */
		});
	});
    </script>

	<form action="insertEarnEmp.emp" method="post">
		<td><button id="okay" type="submit" style="color:white">확인</button></td>
	<span id="payList">
	
	<div>귀속년월일:</div><input type="text" name="attributeDate">
	
	<table style="border:1px solid";>
	
	<tr>
	<td style="border:0px; text-align:center"><input type="hidden" id="abc" name="employeeCode"></td> 
	<td>급여항목</td><td>금액</td>
	</tr>
	<tr>
	<td>기본급</td><td><input type="text" name="salary"></td>
	</tr>
	<tr>
	<td>상여</td><td><input type="text" name="bonus"></td>
	</tr>
	<tr>
	<td>식대</td><td><input type="text" name="meals"></td>
	</tr>
	<tr>
	<td>야간근로수당</td><td><input type="text" name="nightPay"></td>
	</tr>
	<tr>
	<td>월차수당</td><td><input type="text" name="monthlyPay"></td>
	</tr>
	<tr>
	<td>자가운전보조금</td><td><input type="text" name="drivingSubsidies"></td>
	</tr>
	<tr>
	<td>직책수당</td><td><input type="text" name="positionPay"></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td>과세</td><td><input type="text" name="taxableIncome"></td>
	</tr>
	<tr>
	<td>비과세</td><td><input type="text" name="nontaxableIncome"></td>
	</tr>
	<tr>
	<td>지급총액</td><td><input type="text" name="totalPayment"></td>
	
	</tr>
	
	</table>
	</span>
	
	<span id="deduction">
	<table style="border:1px solid";>
	<tr>
	<td>공제항목</td><td>금액</td>
	</tr>
	<tr>
	<td>국민연금</td><td><input type="text" name="nationalPension"></td>
	</tr>
	<tr>
	<td>건강보험</td><td><input type="text" name="healthInsurance"></td>
	</tr>
	<tr>
	<td>장기요양보험</td><td><input type="text" name="longTermInsurance"></td>
	</tr>
	<tr>
	<td>고용보험</td><td><input type="text" name="employmentInsurance"></td>
	</tr>
	<tr>
	<td>소득세(100%)</td><td><input type="text" name="incomeTax"></td>
	</tr>
	<tr>
	<td>지방소득세</td><td><input type="text" name="localIncomeTax"></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
	<td>공제총액</td><td><input type="text" name="totalDeduction"></td>
	</tr>
	<tr>
	<td>차인지급액</td><td><input type="text" name="differencePymt"></td>
	</tr>
	</table>
	</span>
	</form>
	
	
	


<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
	</div>
	
</body>
</html>