<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{ 
width: 900px;
height:1000px;
}

#input1{
width:100px;
margin:5px;
}

#input2{
width:180px;
}
#input3{
width:130px;
}
#input4{
width:150px;
}
#input5{
width:280px;
}
#input6{
width:200px;
}
#input7{
width:150px;
}
#input8{
width:35px;
}
#input9{
width:35px;
}
#input10{
width:35px;
}
#input11{
width:150px;
}

</style>
</head>

<body>

	<jsp:include page="../common/menubar.jsp" />
	<div id="main">
	<div class="container-fluid">
		<h2 class="mt-4">원천징수이행상황신고서</h2>
		<ol class="breadcrumb mb-4">
		</ol>

		 
<!-- 7*21 표 맹글기 -->
<table border="1">
	<tr>
		<td style="text-align:center">발급번호</td>
		<td colspan="6" rowspan="2" style="text-align:center; font-size:22px;" ><b>원천징수이행상황신고서확인</b></td>
		<td style="text-align:center; width:100px" >처리기간</td>
	</tr>

	<tr>
		<td><input type="text" id="input1"></td>
		<td style="text-align:center">즉시</td>
	</tr>
	
	<tr>
		<td rowspan="4" style="width:50px; text-align:center">원<br>천<br>징<br>수<br>의<br>무<br>자</td>
		<td style="text-align:center"> 상 호(법인명) </td>
		<td colspan="3">&nbsp;(주)가장많이쓰는 자가경리 </td>
		<td style="text-align:center"> 사업자 등록 번호 </td>
		<td colspan="3">&nbsp; 220-12-34567</td>
	</tr>

		<tr>
		<td style="text-align:center">성 명(대표자)</td>
		<td colspan="3"> &nbsp;유지연</td>
		<td style="text-align:center">주민(법인)등록번호</td>
		<td colspan="3">&nbsp;930526-2222222</td>
	</tr>

		<tr>
		<td style="text-align:center"> 주소 <br> (사업장)</td>
		<td colspan="6">&nbsp;서울특별시 관악구 삽니도</td>
	</tr>

		<tr>
		<td style="text-align:center">용도</td>
		<td colspan="3" style="width:180px"> &nbsp;&nbsp; <input type="text" id="input2"></td>
		<td style="text-align:center">수량</td>
		<td colspan="3" style="width:150px"> &nbsp; <input type="text" id="input3"></td>
	</tr>

		<tr>
		<td rowspan="2" style="text-align:center">소득<br><br>구분</td>
		<td rowspan="2" style="text-align:center">귀속<br><br>년월</td>
		<td rowspan="2" style="text-align:center; width:100px">납부<br><br>년월</td>
		<td rowspan="2" style="text-align:center; width:70px">총인원</td>
		<td rowspan="2" style="text-align:center">총지급액</td>
		<td colspan="3" style="text-align:center">원천징수세액</td>
	</tr>

		<tr>
		<td style="text-align:center">소득세등</td>
		<td colspan="2" style="text-align:center">농어촌 특별세</td>
	</tr>

		<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td colspan="2"></td>
	</tr>

			<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td colspan="2"></td>
	</tr>
			<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td colspan="2"></td>
	</tr>
			<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td colspan="2"></td>
	</tr>
			<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td colspan="2"></td>
	</tr>
			<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td colspan="2"></td>
	</tr>
			<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td colspan="2"></td>
	</tr>
			<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td colspan="2"></td>
	</tr>
			<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td colspan="2"></td>
	</tr>
			<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td colspan="2"></td>
	</tr>
	
	<tr>
		<td colspan="8"> &nbsp; &nbsp; &nbsp; 
					 &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
					 위 사실을 확인하여 주시기 바랍니다.<br><br>
						 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						   &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
						    &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
							 &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
						    &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp;
						  (주) 가장많이쓰는 자가경리 <br>
						  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						   &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
						    &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp;
						 &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
						    &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp;
						 &nbsp; 신청인 &nbsp;<input type="text" id="input4">&nbsp; (서명 또는 인) <br><br>
						 &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; 
						 세무대리인 <b>귀 하</b> 
		</td>

	</tr>
	
	<tr>
		<td rowspan="2" style="text-align:center">확인자</td>
		<td  style="text-align:center" >사업장소재지</td>
		<td colspan="6">&nbsp;<input type="text" id="input5"></td>
	</tr>
			
	<tr>
		<td  style="text-align:center" >세무대리인<br> 등록번호</td>
		<td colspan="3">&nbsp;<input type="text" id="input6"></td>
		<td  style="text-align:center">전화번호</td>
		<td colspan="2"><input type="text" id="input7"></td>
	</tr>
	<tr>
		<td colspan="8"> &nbsp; &nbsp; 위의 내용은 세무서에 제출한 원청징수이행 상황신고서의 내용과 틀림없음을 확인합니다.<br><br>
								  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						   &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
						    &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp;						   &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
						    &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp;
						     &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
						    &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp;
			<input type="text" id="input8">년 	<input type="text" id="input9">월 	<input type="text" id="input10">일 <br><br>
								  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						   &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
						    &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp;
						    &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
						    &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp;
						   	 &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;
						    &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp;
		세무대리인 &nbsp;<input type="text" id="input11"> &nbsp; (인)
		</td>
	</tr>
	
	

</table>
		<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>