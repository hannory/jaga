<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


#table-total{
position: absolute;
width: 650px;
height: 600px;
left: 270px;
top: 139px;
background: pink;
margin-left:70px;
/* float:left; */

}

#table1{
position:auto;
width:240px;
height:600px;
left:283px;
top:139px;
float:left;
margin-left:45px;
margin-top:25px;
background:white;
}

#table2{
position:auto;
width:379px;
height:600px;
left:300px;
top:139px;
float:left;
margin-top:25px;
background:white;

}

#account-code{
position: absolute;
width: 81px;
height: 29px;
left: 837px;
top: 146px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 14px;
line-height: 16px;
}

#account-code-surr{

position: absolute;
width: 44px;
height: 27px;
left: 940px;
top: 139px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

#account-name-surr{
position: absolute;
width: 158px;
height: 27px;
left: 1000px;
top: 139px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

#character{
position: absolute;
width: 39px;
height: 14px;
left: 837px;
top: 188px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 14px;
line-height: 16px;

color: #000000;
}

#character-surr{
position: absolute;
width: 108px;
height: 27px;
left: 940px;
top: 183px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

#status{
position: absolute;
width: 97px;
height: 18px;
left: 837px;
top: 235px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 14px;
line-height: 16px;

color: #000000;
}

#status-surr{
position: absolute;
width: 44px;
height: 27px;
left: 940px;
top: 227px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

#zero-one{
position: absolute;
width: 72px;
height: 24px;
left: 990px;
top: 229px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 12px;
line-height: 14px;
display: flex;
align-items: center;

color: #4C4C4C;
}

#std-fs{
position: absolute;
width: 90px;
height: 21px;
left: 837px;
top: 285px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 14px;
line-height: 16px;

color: #000000;
}

#std-fs-code-surr{
position: absolute;
width: 44px;
height: 27px;
left: 940px;
top: 280px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}

#std-fs-name-surr{
position: absolute;
width: 172.99px;
height: 27px;
left: 1010px;
top: 280px;

background: #FFFFFF;
border: 1px solid #C4C4C4;
box-sizing: border-box;
border-radius: 5px;
}



#brief-no-surr{

position: absolute;
width: 70px;
height: 29px;
left: 833px;
top: 344px;

background: #24574A;
border: 1px solid #888888;
box-sizing: border-box;
color:white;
text-align:center;
font-weight:normal;
}


#brief-surr{

position: absolute;
width: 380px;
height: 29px;
left: 903px;
top: 344px;

background: #24574A;
border: 1px solid #888888;
box-sizing: border-box;
color:white;
text-align:center;
font-weight:normal;

}

#blank1{

position: absolute;
width: 70px;
height: 29px;
left: 833px;
top: 370px;

background: linear-gradient(0deg, #FFFFFF, #FFFFFF), #FFFFFF;
border: 1px solid #888888;
box-sizing: border-box;
}



#blank2{

position: absolute;
width: 380px;
height: 29px;
left: 903px;
top: 370px;

background: #FFFFFF;
border: 1px solid #888888;
box-sizing: border-box;

}

#blank3{
position: absolute;
width: 70px;
height: 29px;
left: 833px;
top: 399px;

background: linear-gradient(0deg, #FFFFFF, #FFFFFF), #FFFFFF;
border: 1px solid #888888;
box-sizing: border-box;
}

#blank4{
position: absolute;
width: 380px;
height: 29px;
left: 903px;
top: 399px;

background: #FFFFFF;
border: 1px solid #888888;
box-sizing: border-box;
}

#blank5{
position: absolute;
width: 70px;
height: 29px;
left: 833px;
top: 428px;

background: linear-gradient(0deg, #FFFFFF, #FFFFFF), #FFFFFF;
border: 1px solid #888888;
box-sizing: border-box;
}

#blank6{
position: absolute;
width: 380px;
height: 29px;
left: 903px;
top: 428px;

background: #FFFFFF;
border: 1px solid #888888;
box-sizing: border-box;
}
#td{
width:235px;
text-align:center;
background: #F1F8FE;
}

#td1{
width:210px;
text-align:left;
background:white;
font-size:13px;
}

#td2{
width:175px;
text-align:center;
background: #F3F4F6;
font-size:15px;

}

#td3{
width:135px;
background:  #F3F4F6;
text-align:center;
font-size:13px;

}

#td4{
width:40px;
background:  #F3F4F6;
text-align:center;
font-size:13px;
}

#td5{
width:50px;
background:white;
text-aling:left;
font-size:13px;
}
#td5-2{
width:130px;
background:white;
text-aling:left;
font-size:13px;
}

#td6{
width:90px;
background:white;
text-aling:left;
font-size:13px;
}

#td7{
width:40px;
background:white;
text-aling:left;
font-size:13px;
}

#td-blank{
width:220px;
text-align:left;
background:white;
}

 #input{
 position:auto;
 height:700px;
 width:1350px;
 margin-left:45px;
 margin-top:25px;
 border:solid 1px #D8D8DC

/* float:left; */
} 

 #main{
position: relative;
height:1000px;
width:1800px;
background:white;
} 






</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<div id="main">
	<div class="container-fluid">
		<h2 class="mt-4">계정과목등록</h2>
		<ol class="breadcrumb mb-4">
		</ol>

		 
		<div id= "table1">
		<table>
		<tr> <td style="border:1px solid #D8D8DC" id="td" > 계       정      체      계  </td> 
		</tr>
		<tr> <td id="td-blank"></td> 
		</tr>
		<tr> <td style="border:1px solid #D8D8DC" id="td1"> 당  좌   자   산  : 0101-0145 </td> 
		</tr>
		<tr> <td style="border:1px solid #D8D8DC" id="td1"> 재  고   자   산  : 0146-0175 </td> 
		</tr>				
		<tr> <td style="border:1px solid #D8D8DC" id="td1"> 투  자   자   산  : 0176-0194 </td> 
		</tr>		
		<tr> <td style="border:1px solid #D8D8DC" id="td1"> 유형자산 :0195-0217/0471-0500 </td> 
		</tr>		
		<tr> <td style="border:1px solid #D8D8DC" id="td1"> 무형자산 :0218-0230/0431-0450 </td> 
		</tr>		
		<tr> <td style="border:1px solid #D8D8DC" id="td1"> 기타비유동자산  : 0231-0250 </td> 
		</tr>		
		<tr> <td style="border:1px solid #D8D8DC" id="td1"> 유   동   부   채  : 0251-0290 </td> 
		</tr>		
		<tr> <td style="border:1px solid #D8D8DC" id="td1"> 비  유  동  부  채  : 0291-0330 </td> 
		</tr>		
		<tr> <td style="border:1px solid #D8D8DC" id="td1"> 자      본      금  : 0331-0340 </td> 
		</tr>		
		<tr> <td style="border:1px solid #D8D8DC" id="td1"> 자  본  잉  여  금  : 0341-0350 </td> 
		</tr>		
		<tr> <td style="border:1px solid #D8D8DC" id="td1"> 자   본   조   정  : 0381-0391 </td> 
		</tr>		
		<tr> <td style="border:1px solid #D8D8DC" id="td1"> 기타  포괄손익  : 0392-0399 </td> 
		</tr>		
		<tr> <td style="border:1px solid #D8D8DC" id="td1"> 이  익  잉  여  금  : 0351-0380 </td> 
		</tr>		
		<tr> <td id="td-blank"></td> 
		</tr>		
		<tr>  <td style="border:1px solid #D8D8DC" id="td1"> 매             출  : 0401-0430 </td> 
		</tr>		
		<tr>  <td style="border:1px solid #D8D8DC" id="td1"> 매   출   원   가  : 0451-0470 </td> 
		</tr>		
		<tr>  <td style="border:1px solid #D8D8DC" id="td1"> 제   조   원   가  : 0501-0600 </td> 
		</tr>		
		<tr>  <td style="border:1px solid #D8D8DC" id="td1"> 도   급   원   가  : 0601-0650 </td> 
		</tr>		
		<tr>  <td style="border:1px solid #D8D8DC" id="td1"> 보   관   원   가  : 0651-0700 </td> 
		</tr>		
		<tr>  <td style="border:1px solid #D8D8DC" id="td1"> 분   양   원   가  : 0701-0750 </td> 
		</tr>		
		<tr>  <td style="border:1px solid #D8D8DC" id="td1"> 운   송   원   가   : 0751-0800 </td> 
		</tr>		
		<tr>  <td style="border:1px solid #D8D8DC" id="td1"> 판  매  관  리  비  : 0801-0900 </td> 
		</tr>		
		<tr>  <td style="border:1px solid #D8D8DC" id="td1"> 영  업  외  수  익  : 0901-0950 </td> 
		</tr>		
		<tr>  <td style="border:1px solid #D8D8DC" id="td1"> 영  업  외  비  용  : 0951-0997 </td> 
		</tr>		
		<tr>  <td style="border:1px solid #D8D8DC" id="td1"> 법   인  (소  득) : 0998-0999 </td> 
		</tr>		
		<tr> <td id="td-blank"></td> 
		</tr>		
		<tr> <td style="border:1px solid #D8D8DC" id="td1"> 특수  계정  과목: 1000-1010 </td> 
		</tr>		
	
		
		</table>
		</div>
		
		
		
		<div id="table2" style="overflow-y:scroll;">
		<table>
		<tr> <td colspan="2" style="border:1px solid #D8D8DC" id="td2" >코드/계정과목 </td> 
			<td style="border:1px solid  #D8D8DC" id="td3">성격</td>
			<td style="border:1px solid  #D8D8DC" id="td4">관계</td>
		</tr>
		
		<tr> <td style="border:1px solid #D8D8DC" id="td5">0162 </td> 
			 <td style="border:1px solid #D8D8DC" id="td5-2">부재료</td> 
			 <td style="border:1px solid #D8D8DC" id="td6">1.일반재고</td> 
			 <td style="border:1px solid #D8D8DC" id="td7">0161</td> 
		</tr>
		
		
		
		</table>
		</div>
		
		</div>
		
		
		
		
		
		
<!-- 		<table id="table3"> -->
		<div id="input">
		<tr>
			<td><b id="account-code">계정코드(명)</b>
			<input type="text" name="" id="account-code-surr">
			<input type="text" name="" id="account-name-surr"></td>
		</tr>


		<tr>
			<td><b id="character">성격</b>
			<input type="text" name="" id="character-surr">
			</td>
		</tr>
		
		
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