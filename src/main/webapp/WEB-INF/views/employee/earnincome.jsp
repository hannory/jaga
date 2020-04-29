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

</style>
<body>
	<jsp:include page="../common/menubar.jsp" />
		<div id="main">
	<div class="container-fluid">
	
<%-- 	<span id="emplist">
	<table style="border:1px solid"; id="listArea2">
	<tr>
	<th style="text-align:center">사번</th><th style="text-align:center">사원명</th>
	</tr>
	 <c:if test="${ !empty sessionScope.loginCompany }">   
 		<c:forEach var="emp2" items="${list}">
		 <tr> <td style="border:0px;text-align:center"><c:out value="${emp2.employeeNum}"/></td> 
			 <td style="border:0px; text-align:center"><c:out value="${emp2.employeeName}"/></td> 
			 <td style="border:0px; text-align:center"><input type="hidden" value="${emp2.employeeCode}" name="employeeCode"></td> 
		</tr> 
		</c:forEach> 
 		</c:if> 
	</table>	 
	</span> --%>

	<span id="payList">
	<form action="employeeinsert.emp" method="post">
	<table style="border:1px solid";>
	<tr>
	<td style="border:0px; text-align:center"><input type="hidden" value="${emp2.employeeCode}" name="employeeCode"></td> 
	<td>급여항목</td><td>금액</td>
	</tr>
	<tr>
	<td>기본급</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>상여</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>식대</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>야간근로수당</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>월차수당</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>자가운전보조금</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>직책수당</td><td><input type="text"></td>
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
	<td>과세</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>비과세</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>지급총액</td><td><input type="text"></td>
	<td style="border:0px; text-align:center"><input type="hidden" value="${emp2.employeeCode}" name="employeeCode"></td> 
	
	</tr>
	
	</table>
	</form>
	</span>
	
	<span id="deduction">
	<table style="border:1px solid";>
	<tr>
	<td>공제항목</td><td>금액</td>
	</tr>
	<tr>
	<td>국민연금</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>건강보험</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>장기요양보험</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>고용보험</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>소득세(100%)</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>지방소득세</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>농특세</td><td><input type="text"></td>
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
	<td>공제총액</td><td><input type="text"></td>
	</tr>
	<tr>
	<td>차인지급액</td><td><input type="text"></td>
	</tr>
	</table>
	</span>
	
 <script>
	$(function(){
		$("#listArea2 td").mouseenter(function(){
			$(this).parent().css({"background":"#F0F0F0","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css("background","white");
		}).click(function(){
			var venderCode =$(this).parent().children().eq(4).text();
			console.log(venderCode);
			location.href="${contextPath}/employeeinsert.emp?employeeCode="+employeeCode;
		});
	});
    </script>

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