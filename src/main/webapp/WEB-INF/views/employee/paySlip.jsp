<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

#main{
width: 1350px;
height:900px;
}
#table1{
width:1200;
height:1200;
}

#secondline{
text-algin:center;
}

#input1{
width:65px;
}

#input2{
width:40px;
}

#input3{
width:100px;
}

</style>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="main">
	<div class="container-fluid">
		<h2 class="mt-4">급상여명세서</h2>
		<ol class="breadcrumb mb-4">
		</ol>

		<table style="border:solid 1px black; width:900px; height:1200px" id="table1">
		
		<tr>
		<td colspan="4" style="text-align:center; font-size:25px; font-weight:bold"><input type="text" id="input1"; style="border-right:white; border-left:white; border-top:white;">년  <input type="text" id="input2" style="border-right:white; border-left:white; border-top:white;" >월분 급상여명세서</td>
		</tr>
		
		<tr>
		<td colspan="4" style="text-align:right" > 유지연  <b>님</b> &nbsp;  &nbsp;</td>
		</tr>
		
		<tr style="height:5px">
		<td colspan="4" style="text-align:right"> 입사일: <tag> 2020-01-06 </tag>  &nbsp;  &nbsp;</td>
		</tr>
		
		<tr>
		<td colspan="4"> &nbsp; <b style="font-size:20px">지급내역</b></td>
		</tr>
		
		<tr style="border-top:solid 1px #E9E9E9"> 
		<td>&nbsp;&nbsp; 기본급</td>
		<td id="secondline">3,400,000</td>
		<td>식대</td>
		<td>100,000</td>		
		</tr>
		
		<tr>
		<td> &nbsp;&nbsp; 차량유지비</td>
		<td id="secondline">0</td>
		<td>육아수당</td>
		<td>0</td>		
		</tr>
		
		<tr>
		<td>&nbsp;&nbsp; 연구수당</td>
		<td id="secondline">0</td>
		<td>기타비과세수당</td>
		<td>0</td>		
		</tr>
		
		<tr>
		<td> &nbsp;&nbsp; 상여</td>
		<td id="secondline">0</td>
		<td>연장수당</td>
		<td>0</td>		
		</tr>
		
		<tr>
		<td> &nbsp;&nbsp; 야간수당</td>
		<td id="secondline">0</td>
		<td>휴일수당</td>
		<td>0</td>		
		</tr>
		
		<tr style="border-bottom:solid 1px #E9E9E9">
		<td> &nbsp;&nbsp; 기타과세수당</td>
		<td id="secondline">0</td>
		<td></td>
		<td></td>
		</tr>
		
		<tr>
		<td colspan="4" style="text-align:right"><h4>3,500,000 &nbsp;</h4></td>
		</tr>
		
		<tr>
		<td colspan="4"> &nbsp; <b style="font-size:20px">공제내역</b></td>
		</tr>
		
		<tr style="border-top:solid 1px #E9E9E9"> 
		<td>&nbsp;&nbsp; 국민연금</td>
		<td id="secondline">3,400,000</td>
		<td>건강보험</td>
		<td>100,000</td>		
		</tr>
		
		<tr>
		<td> &nbsp;&nbsp; 고용보험</td>
		<td id="secondline">0</td>
		<td>장기요양보험료</td>
		<td>0</td>		
		</tr>
		
		<tr>
		<td>&nbsp;&nbsp; 기타공제액</td>
		<td id="secondline">0</td>
		<td></td>
		<td></td>		
		</tr>
		
		<tr>
		<td> &nbsp;&nbsp; 소득세</td>
		<td id="secondline">0</td>
		<td>지방소득세</td>
		<td>0</td>		
		</tr>
		
		<tr style="border-bottom:solid 1px #E9E9E9">
		<td> &nbsp;&nbsp; 연말정산 소득세</td>
		<td id="secondline">0</td>
		<td>연말정산 지방세</td>
		<td>0</td>		
		</tr>

		<tr>
		<td colspan="4" style="text-align:right"><h4>3,500,000 &nbsp;</h4></td>
		</tr>
		
		<tr style="border-top:solid 1px #E9E9E9">
		<td colspan="4"> &nbsp; <b style="font-size:20px">실지급액</b></td>
		</tr>
		
		<tr>
		<td colspan="4" style="text-align:right"><h4>3,500,000 &nbsp;</h4></td>
		</tr>
		
		</table>


</div>
</div> 


		<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>