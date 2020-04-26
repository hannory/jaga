<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


/* 사각형 테두리 border */

#border{
position: absolute;
width: 1350px;
height: 1500px;
left: 286px;
top: 107px;

border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
/*  background:yellow;  */



}

#border2{
/* position:absolute; */
width:330px;
height:1450px;
left:286px;
top:233px;

border:1px solid #C4C4C4;
box-sizing: border-box;
border-radius:5px;
float:left;

}

#border3{
width:1018px;
height:1450px;
left:616px;
top:233px;

border:1px solid #C4C4C4;
box-sizing:border-box;
border-radius:5px;
float:right;

}


/*직원관리 employee-manage*/
#employee-manage{
 position: absolute; 
width: 210px;
height: 42px;
left: 303px;
top: 74px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 30px;
line-height: 35px;

color: #000000;
}


/* 저장하기 save*/

#save{
/* position: absolute; */
width: 82px;
height: 29px;
left: 1228px;
top: 233px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;
text-align: center;

color: #FFFFFF;

}


/* 저장하기버튼 save-surr */

#save-surr{
/* position: absolute; */
width: 90px;
height: 29px;
left: 1228px;
top: 233px;

background: #296355;
border-radius: 5px;
color:white;
float:right;
margin-right:15px;

}



#search-surr{
width: 210px;
 height: 27px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}


#main{
width:1650px;
height:1800px;

}

#small-table{
border-bottom:solid gray 1px;
border-top:solid gray 1px;
margin-left:50px;
width:210px;
height:100px;
}

#big-table{
margin-top:20px;
margin-left:20px;
border:solid black 1px; 
width:750px;
background:white;
text-align:center;
}

#first{
background: #296355;
color:white;
height:50px;
}

#second{
height:30px;
/* border:solid black 1px; */
}

#select{

width: 120px;
height: 27px;
background: white;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 0px 5px 5px 0px;
margin-top:60px;
margin-left:20px;
}

#input{
width: 250px;
height: 27px;
background: white;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 0px 5px 5px 0px;
margin-left:10px;
margin-top:60px;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="main">
	<div class="container-fluid">
		<h2 class="mt-4">일반근로자관리</h2>


<div id="main">
<div id="border">
<div id="border2">
 <div id="vertical"> </div> 
<input type="search" id="search-surr" style="margin:15px; margin-left:45px">
<table id="small-table">
<tr style="border-bottom:solid 1px #E9E9E9;">
<td> 10001</td> 
<td> 유길동 </td>
</tr>
<tr>
<td> 100002 </td>
<td> 박길동 </td>
</tr>
<tr>
<td> 100003 </td>
<td> 최길동 </td>
</tr>
<tr>
<td> 10004 </td>
<td> 조길동 </td>
</tr>
</table>
</div>
<div id="border3">

<div style="margin-top:20px"> &nbsp; <b>일반근로자 - 급여대장</b> </div> <button id="save-surr">저장하기</button>

<select id="select">
<option value="1" selected disabled hidden>일반근로자</option>
<option value="1">일반근로자</option>
<option value="2">일용근로자</option>
<option value="3">사업소득자</option>
</select>

<input type="text" id="input" style="width:250px">

<table id="big-table">
<tr>
<td id="first">구분</td>
<td id="first">사번</td>
<td id="first">이름</td>
<td id="first">실지급액</td>
<td id="first">기본급</td>
<td id="first">지급합계</td>
<td id="first">공제합계</td>
<td id="first">명세서</td>
</tr>

<tr>
<td id="second">일반근로자</td>
<td id="second">사번</td>
<td id="second">유길동</td>
<td id="second">3,051,820</td>
<td id="second">3,400,000</td>
<td id="second">3,500,000</td>
<td id="second">448,180</td>
<td id="second">급여명세서</td>
</tr>

<tr>
<td id="second">일반근로자</td>
<td id="second">사번</td>
<td id="second">유길동</td>
<td id="second">3,051,820</td>
<td id="second">3,400,000</td>
<td id="second">3,500,000</td>
<td id="second">448,180</td>
<td id="second">급여명세서</td>
</tr>
<tr>
<td id="second">일반근로자</td>
<td id="second">사번</td>
<td id="second">유길동</td>
<td id="second">3,051,820</td>
<td id="second">3,400,000</td>
<td id="second">3,500,000</td>
<td id="second"> 448,180</td>
<td id="second">급여명세서</td>
</tr>
<tr>
<td id="second">일반근로자</td>
<td id="second">사번</td>
<td id="second">유길동</td>
<td id="second">3,051,820</td>
<td id="second">3,400,000</td>
<td id="second">3,500,000</td>
<td id="second">448,180</td>
<td id="second">급여명세서</td>
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