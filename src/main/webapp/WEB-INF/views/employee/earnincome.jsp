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

position: absolute;
width: 350px;
height: 800px;
left: 340px;
top: 370px;
border:solid 0px white; 

}

#payList{
position:absolute;
width:700px;
height:1300px;
left:700px;
top:270px;

}

#deduction{
position:absolute;
width:500px;
height:1300px;
left: 1100px;
top:360px;
}

/* 사각형 테두리 border */

#border{
position: absolute;
width: 1350px;
height: 1500px;
left: 286px;
top: 233px;

border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;

}

#border2{
position:absolute;
width:330px;
height:1500px;
left:286px;
top:233px;

border:1px solid #C4C4C4;
box-sizing: border-box;
border-radius:5px;
}


/*직원관리 employee-manage*/
#employee-manage{
position: absolute;
width: 213px;
height: 42px;
left: 303px;
top: 74px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 33px;
line-height: 35px;

color: #000000;
}

/* 일반근로자 big-employee*/
#big-employee{
position: absolute;
width: 120px;
height: 42px;
left: 304px;
top: 148px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 23px;
line-height: 23px;

color: #000000;
}



/* Line 20 row-employee */

#row-employee{
position: absolute;
width: 120px;
left: 304px;
top: 180px;

border: 2px solid #24574A;
}
/* 일용근로자 big-one-imployee */

#big-one-imployee{
position: absolute;
width: 120px;
height: 42px;
left: 451px;
top: 148px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 23px;
line-height: 23px;

color: #5A5A5A;
}

/* 사업소득자 big-income-employee */

#big-income-employee{
position: absolute;
width: 120px;
height: 42px;
left: 599px;
top: 148px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 23px;
line-height: 23px;

color: #5A5A5A;

}
/* 일반근로자 - 신규추가 employee */

#employee{
position: absolute;
width: 330px;
height: 30px;
left: 453px;
top: 100px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 23px;
line-height: 23px;

color: #000000;

}
/* 저장하기 save*/

#save{
position: absolute;
width: 82px;
height: 29px;
left: 1180px;
top: 183px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 16px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;

}


/*저장하기버튼 save-surr */

#save-surr{
position: absolute;
width: 90px;
height: 29px;
left: 1180px;
top: 183px;

background: #296355;
border-radius: 5px;
}

/* * 기본 정보 basic-info*/ */
#basic-info{


position: auto;
width: 67px;
height: 25px;
left: 547px;
top: 301px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 19px;
line-height: 19px;

color: #000000;

}


#searchdiv{
position:absolute;
width:600px;
height:100px;
left:340px;
top:300px;
}

#search{
left: 370px;
top:300px;
border-radius:5px;

}

#searchBtn{

left:440px;
top:270px;


}


#main{
width:1350px;
height:1700px;
}

td{
padding:5px;
border:1px black;
}

input{
text-align:right;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
} 

#okay{
top:230px;
left:1600px;
}

</style>
<body>
	<jsp:include page="../common/menubar.jsp" />
		<div id="main">
	<div class="container-fluid">
	
	
 <div id="main">
<div id="employee-manage">급여자료입력</div>
<div id="big-employee">일반근로자</div>
<div id="row-employee"></div>
<div id="big-one-imployee">일용근로자</div>
<div id="big-income-employee">사업소득자</div>
<div id="border2"></div>

	<div id="searchdiv">

<input type="text" id="search"> <button type="button" id="searchBtn"><img alt="" src="${contextPath}/resources/images/search.PNG" width="20px" height="20px">
								</button>
</div>
 	<span id="emplist">
	 <table id="listArea2">
	<tr>
	<th style="border:0px; background:#296355; color:white; text-align:center" >사번</th><th style="border:0px; background:#296355; color:white; text-align:center" >사원명</th>
	</tr>
	 <c:if test="${ !empty sessionScope.loginCompany }">   
 		<c:forEach var="emp2" items="${list}">
		 <tr> <td style="border:0px;text-align:center"><c:out value="${emp2.employeeNum}"/></td> 
			 <td style="border:0px; text-align:center"><c:out value="${emp2.employeeName}"/></td> 
			 <td style="border:0px; text-align:center; color:white;"><c:out value="${emp2.employeeCode}"/></td> 
		</tr> 
		</c:forEach> 
 		</c:if> 
	</table>	 
	</span> 
	
	
	
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
			$(this).parent().css({background:"#EDEDEE"});
/* 			location.href="${contextPath}/employeeinsert.emp?employeeCode="+employeeCode; */
        });
	});
    </script>

	<form action="insertEarnEmp.emp" method="post">
	<span id="payList">
	
	<table>
	<tr><td>귀속년월 : &nbsp;&nbsp;<input type="text" name="attributeDate" placeholder=" ex) 202003 숫자만 입력 " > &nbsp;&nbsp; </td>
	<td> &nbsp;&nbsp; 지급년월일 : &nbsp;&nbsp;<input type="text" class="payDate" name="payDate" id="datepicker"> </td>
	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="okay" type="submit" style="color:black">저장</button></td>
	</tr>
	</table>
	
	<div style="height:50px;"></div>
	
	<input type="hidden" id="abc" name="employeeCode">
	<table >
	<tr>
	<td style="border:0px; background:#296355; color:white; text-align:center; padding:5px; width:200px;">급여항목</td><td  style="border:0px; background:#296355; color:white; text-align:center; padding:5px" >금액</td>
	</tr>
	<tr>
	<td>기본급</td><td><input type="text" name="salary" id="salary"></td>
	</tr>
	<tr>
	<td>상여</td><td><input type="text" name="bonus" id="bonus"></td>
	</tr>
	<tr>
	<td>식대</td><td><input type="text" name="meals" id="meals"></td>
	</tr>
	<tr>
	<td>야간근로수당</td><td><input type="text" name="nightPay" id="nightPay"></td>
	</tr>
	<tr>
	<td>월차수당</td><td><input type="text" name="monthlyPay" id="monthlyPay"></td>
	</tr>
	<tr>
	<td>자가운전보조금</td><td><input type="text" name="drivingSubsidies" id="drivingSubsidies"></td>
	</tr>
	<tr>
	<td>직책수당</td><td><input type="text" name="positionPay" id="positionPay"></td>
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
	<td style="background:#F2F1F1">과세</td><td style="background:#F2F1F1"><input type="text" name="taxableIncome" id="taxableIncome"></td>
	</tr>
	<tr>
	<td style="background:#F2F1F1">비과세</td><td style="background:#F2F1F1"><input type="text" name="nontaxableIncome" id="nontaxableIncome"></td>
	</tr>
	<tr>
	<td style="background:#F2F1F1">지급총액</td><td style="background:#F2F1F1"><input type="text" name="totalPayment" id="totalPayment"></td>
	
	</tr>
	
	</table>
	</span>
	
	<span id="deduction">

	<table>
	<tr>
	<td  style="border:0px; background:#296355; color:white; text-align:center; padding:5px;  width:200px;">공제항목</td><td style="border:0px; background:#296355; color:white; text-align:center; padding:5px">금액</td>
	</tr>
	<tr>
	<td>국민연금</td><td><input type="text" name="nationalPension" id="nationalPension"></td>
	</tr>
	<tr>
	<td>건강보험</td><td><input type="text" name="healthInsurance" id="healthInsurance"></td>
	</tr>
	<tr>
	<td>장기요양보험</td><td><input type="text" name="longTermInsurance" id="longTermInsurance"></td>
	</tr>
	<tr>
	<td>고용보험</td><td><input type="text" name="employmentInsurance" id="employmentInsurance"></td>
	</tr>
	<tr>
	<td>소득세(100%)</td><td><input type="text" name="incomeTax" id="incomeTax"></td>
	</tr>
	<tr>
	<td>지방소득세</td><td><input type="text" name="localIncomeTax" id="localIncomeTax"></td>
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
	<td style="background:#F2F1F1">공제총액</td><td style="background:#F2F1F1"><input type="text" name="totalDeduction" id="totalDeduction"></td>
	</tr>
	<tr>
	<td style="background:#F2F1F1">차인지급액</td><td style="background:#F2F1F1"><input type="text" name="differencePymt" id="differencePymt"></td>
	</tr>
	</table>
	</span>
	</form>
	
	
</div>

	</div>
	
<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
	
	
		<script>
	$.datepicker.setDefaults({
		showOn:"both",
		buttonImageOnly:true,
		buttonImage :"${contextPath}/resources/images/calendar.png",
		dateFormat: 'yy-mm-dd'
	});
	
	$(function(){
		$("#datepicker").datepicker({});
		$("img.ui-datepicker-trigger")
		.attr("style","margin-left:5px; vertical-align:middle; cursor:Pointer; width:1px; height:1px");
	});
	
	
	</script>
	
	
	<script>
	/*기본급을 입력하면 과세 비과세 입력됨 / 일단 과세 비과세 값 바뀌는 구조*/
	$("#salary").keyup(function(key){

		$("#taxableIncome").val($("#salary").val());
		$("#totalPayment").val($("#salary").val());
	});		
	
	$("#bonus").keyup(function(key){
       var salarybonus=0;
       var salary=0;
       var bonus=0;
       
       var salary= ($("#salary").val());
       var bonus=($("#bonus").val());
       
		salarybonus=Number($("#salary").val())+Number($("#bonus").val());
		$("#taxableIncome").val(salarybonus);
		$("#totalPayment").val(salarybonus);
		
	})
			
	$("#meals").keyup(function(key){
	
		var sbm=0;
		var meals=0;
		var salarybonus=0;
		var m=0;
		salarybonus=Number($("#salary").val())+Number($("#bonus").val());
		var meals=($("#meals").val());
		
		/*지급총액에 들어갈 식대*/
		sbm=Number(salarybonus)+Number($("#meals").val());
		
		/*비과세에 들어갈 식대 */
		m=Number($("#meals").val());
		
		$("#taxableIncome").val(salarybonus);
 		$("#nontaxableIncome").val(m); 
		$("#totalPayment").val(sbm);
		
		
	})
	
	$("#nightPay").keyup(function(key){
		
		var sbmn=0;
		var nightPay=0;

		salarybonus=Number($("#salary").val())+Number($("#bonus").val());
		sbm=Number(salarybonus)+Number($("#meals").val());
		sbmn=Number(sbm)+Number($("#nightPay").val());
		/*비과세에 들어갈 식대 */
		m=Number($("#meals").val());
		
		$("#taxableIncome").val(salarybonus);
 		$("#nontaxableIncome").val(m); 
		$("#totalPayment").val(sbm);

	})
		
	$("#monthlyPay").keyup(function(key){
		var sbmnm=0;
		var monthlyPay=0;
		
		salarybonus=Number($("#salary").val())+Number($("#bonus").val());
		sbm=Number(salarybonus)+Number($("#meals").val());
		sbmn=Number(sbm)+Number($("#nightPay").val());
		
		sbmnm=Number(sbmn)+Number($("#monthlyPay").val());
		$("#taxableIncome").val(sbmnm);
		$("#totalPayment").val(sbmnm);
		
		})	
		
		$("#dri")
		
    
	
	
	
	</script>
</body>
</html>