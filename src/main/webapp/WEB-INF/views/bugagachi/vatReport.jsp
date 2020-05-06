<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>자가 경리</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <style>
        *{
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        #titleArea{
            width: 50%;
        }
        .middleMenu{
            background-color: #24574A;
            color: white;
            height: 30px;
        }
        .middleMenu>h5{
            padding: 5px;
        }
        .totalSum{
            text-align: center;
          	  margin-top: 15px;
            margin-bottom:40px;
        }
        #deemed{
        	text-align: center;
            margin-top: 15px;
            margin-bottom:40px;
        }
        #deemed td{
        	 /* border: 1px solid #C9CACE;  */
            height: 23px;
            width:25%;
        }
        .totalSum td{
            border: 1px solid #C9CACE; 
            height: 23px;
        }
        .green{
            background-color: #D9EAD3;
            font-weight: 700;
        }
        .green_value{
        	background-color: #F3F4F6;
        	
        }
        #cho_nav1{
            background-color: #1B5748;
            color: white;
        }   
        .Tex_bill_th{
            background-color:#E7E6E6;
        }
        .Tex_bill_td{
            background-color:#E7E6E6;
            width: 10px;
        }
        #Text_billNo{
            background-color:#E7E6E6;
            height: 25px;
        }
        #Tex_bill_code{
            border: 1px solid black;
        }
        .breadcrumb>li{
        	margin: auto auto;
        }
        .cho_nav{
        	height: 35px;
        	border: 1px solid #C9CACE;
        	background-color:#8DABA3;
        	color: white;
			border-top-left-radius:10px;
			border-top-right-radius:10px;
        }
        .cho_nav>p{
        	margin-left:5px;
        	margin-right: 5px;
        	margin-top:3px;
        }
        .sumTableSales{
        	width: 20%;
        	padding-left:5%;
        }
   		#List_detail td{
   			border:1px solid #D2D2D6;
   		}
   		#List_detail{
   			text-align: center;
   		}
   		.cc_year{
   			width:50px;
   			height: 30px;
   		}
   		.cc_month{
   			width:50px; 
   			height: 30px;
   		}
   		.Tex_bill_code_p{
   			font-size:23px;
   		}
   		.total_deemed{
   			text-align: center;
   			width: 99%;
   			border:1px solid #C9CACE;
   		}
   		.textArea{
   			text-align: left;
   		}
   		.numberArea{
   			text-align: right;
   		}
   		.pink{
   			background-color: #F4CCCC; 
   		}
   		.blue{
   			background-color: #CFE2F3; 
   		}
   		.yellow{
   			background-color: #EFD5B9;
   		}
   		#deadlineCen{
			display: none;
			border:1px solid red; 
			color:red;
		}
   		#vat_mainDiv{
   			width: 50%; 
   			float: left; 
   			margin-right: 2px;
   		}
   		#vat_subDiv1{
   		 	width: 100%; 
   		 	float: left;
   		}
   		#vat_subDiv2{
   			width: 100%;
   		}
   		#vat_subDiv3{
   			width: 100%;
   		}
   		#report_type{
   			height: 30px;
   		}
   		.mainSubDiv{
	   		width: 100%; 
	   		text-align: center;
   		}
   		.mainSubDiv td{
   			border:1px solid #D2D2D6;
   		}
   		.subTable{
   			display: none;
   		}
   		#termDiv{
   			width:80px; 
   			height: 30px;
   		}
   		#loading {
		    width: 100%;  
		    height: 100%;  
		    top: 0px;
		    left: 0px;
		    position: fixed;  
		    display: block;  
		    opacity: 0.7;  
		    background-color: #fff;  
		    z-index: 99;  
		    text-align: center; 
		    display: none;
		} 
		     
		#loading-image {  
		    position: absolute;  
		    top: 50%;  
		    left: 50%; 
		    z-index: 100; 
		 }
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<main>
	<script type="text/javascript">
		function pri_VATReport(){
			console.log("프린트 버튼누름")
			var vatReport=window.open("vatReportPrint.vi","","width=1200,height=1000");
			
		}
	</script>
	<div class="container-fluid">
			<h2 class="mt-4">부가가치세 신고서</h2>
<form action="deadLine.vat" onsubmit="return false;" method="post">
	<ol class="breadcrumb mb-4">
			<li><button id="deadlineBtns" onclick="PopModalTexList()">마감</button></li>
			<li><button id="deadlineCen" onclick="cencelDeadline()">마감 취소</button></li>
			<li><input type="text" readonly  id="termDiv" name="termDiv"></li>
			<li>신고구분: 
                <select name="report_type" id="report_type">
                    <option value="정기신고">1.정기신고</option>
                    <option value="수정신고">2.수정신고</option>
                </select></li>
            <li>신고차수: <input type="text" name="report_order" style="width: 40px;"></li>
             <li>조회기간:
            	<input type="text" id="search_ye" class="cc_year" name="yearOfAttr" maxlength="4">
            	<select class="cc_month" id="search_mon1">
            		<option value="">월</option>
            		<option value="01">1</option>
            		<option value="07">7</option>
            	</select> 
            	~
            	<select class="cc_month" id="search_mon2">
            		<option value="">월</option>
            		<option value="06">6</option>
            		<option value="12">12</option>
            	</select> 
            </li>
			<li><input type="button" onclick="search_cis()" value="조회"></li>
			<li>부가율: <input type="text" id="vatRate" name="vatRate" readonly style="width: 50px;">
			<input type="text" name="vatRateDiv" readonly  style="width: 50px; background-color:#D9EAD3 "> </li>
			<li><input type="button" name="report" value="신고서미리보기" onclick="pri_VATReport()"></li>
			
		</ol>
		
	<!-- 인풋모음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1 -->
	<c:set var="comCode" value="${ sessionScope.loginCompany.companyCode }"/>
   	<input type="hidden" value="${comCode}" name="comCode">
   	<input type="hidden" name="vatCode" id="vatCode">
   	
   	<script type="text/javascript">

	 function PopModalTexList(){
   	  $("#detailList_detail").modal();
     }
   	
   	</script>
   	
		<script type="text/javascript">
		var deadCk;
		function cencelDeadline(){
			alert("왜안돼 ㅅㅂ");
			$("form").attr("action", "updatdDeadLineCen.vat");
		}
		 function search_cis(){
	    	 $("#loading").show();
	    	 
	    	var report_type=$("#report_type").val();
	    	var search_ye= $("#search_ye").val();
	 		var search_mon1= $("#search_mon1").val();
	 		var search_mon2= $("#search_mon2").val();
	 		var comCode='${comCode}';
	 		console.log(report_type);
	 		console.log(search_ye);
	 		console.log(search_mon1);
	 		console.log(search_mon2);
	 		console.log(comCode);
	 		
	    	
	 		$.ajax({
	 			url:"vatReport.vat",
	 			type:"post",
	 			data:{report_type:report_type,search_ye:search_ye,search_mon1:search_mon1,search_mon2:search_mon2,comCode:comCode},
	 			success: function (data){
	 				$("#loading").hide();
	 				var vat=data.vat;
	 				console.log(vat);
	 				deadCk=data.deadCk;
	 				console.log(deadCk);
	 				console.log(vat.vatCode);
	 				/* 부가율 넣어주기 */
	 				$("#vatRate").val(vat.valueRate);
	 				$("#vatCode").val(vat.vatCode);
	 				
	 				/* 다 를 여기서 계산해줘야함(가 9 -나 17) */
	 				for(var i=1;i<=85;i++){
	 					console.log("i값: "+i)
	 					
	 					var p='vat.p'+i;
	 					var pt='vat.p'+i+'T';
	 					
	 					console.log("p: "+p);
	 					console.log("pt: "+pt);
	 					$('#p'+i).text(comma(eval(p)));
	 					$('#p'+i+'T').text(comma(eval(pt)));
	 					
	 				}
	 				console.log("다: ");
	 				console.log(vat.p9T-vat.p17T);
	 				var da=vat.p9T-vat.p17T;
	 				$("#da").text(comma(da));
	 				
	 				/* 모달안에 값넣기 */
	 				var $List_detail=$("#List_detail");
	 				$List_detail.append($tbody);
	 				var $tbody=$("<tbody>")
	 				console.log("deadCk: "+deadCk);
	 				var indexModal=0;
	 				for(var key in deadCk){
	 					indexModal++;
	 					console.log("key: "+key);
	 					console.log("deadCk: "+deadCk[key]);
	 					
	 					var $tr=$("<tr>");
	 					var $numTd=$("<td>").text(indexModal);
	 					var $nameTd=$("<td>").text(key);
	 					var $deadTd=$("<td>").text(deadCk[key]);
	 					
	 					$tr.append($numTd);
	 					$tr.append($nameTd);
	 					$tr.append($deadTd);
	 					
	 					$List_detail.append($tr);
	 				}
	 				
	 				//마감여부에따라 버튼 보이기
	 				 if(vat.deadline == 'Y'){
							console.log("마감된 애임")
							$("#deadlineCen").show();
							$("#deadlineBtns").hide();
						} 
	 			},
	 			error:function(error){
	 				console.log(error);
	 			}
	 			
	 		});
	 	}
		
		</script>
			<script type="text/javascript">/* subTable 보이게하기  */
				function showsubTable1(){
			    	$("#vat_subDiv2").hide();
			    	$("#vat_subDiv3").hide();
			    	$("#vat_subDiv1").show();
			    };
			    function showsubTable2(){
			    	$("#vat_subDiv1").hide();
			    	$("#vat_subDiv3").hide();
			    	$("#vat_subDiv2").show();
			    }
			    function showsubTable3(){
			    	$("#vat_subDiv2").hide();
			    	$("#vat_subDiv1").hide();
			    	$("#vat_subDiv3").show();
			    }
				/* 콤마 찍기 */
				function comma(str) {
					str = String(str);
					return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
				}
			</script>
						<!-- 로딩? -->
   <div id="loading">
        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
    </div>

		
		
   	
   	
   	
   	
		<div style="width: 100%;"><!-- 전체 div start -->
		
			<div id="vat_mainDiv"><!-- vat_main div start -->
				<table class="mainSubDiv">
					<tr class="Tex_bill_th">
						<td colspan="5"></td>
						<td colspan="3">정기 신고 금액</td>
					</tr>
					<tr class="Tex_bill_th">
						<td colspan="5">구분</td>
						<td>금액</td>
						<td>세율</td>
						<td>세액</td>
					</tr>
					<tr onclick="showsubTable1()">
						<td rowspan="9" style="background-color: #F4CCCC; width:4%; ">과세표준및매출세액</td>
						<td rowspan="4" style="width:10%;" class="green_value">과세</td>
						<td colspan="2" class="green_value textArea">세금계산서발급분</td>
						<td class="pink">1</td>
						<td class="numberArea" id="p1"></td>
						<td class="green_value">10/100</td>
						<td class="numberArea" id="p1T"></td>
					</tr>
					<tr onclick="showsubTable1()">
						<td colspan="2" class="green_value textArea">매입자발행세금계산서</td>
						<td class="pink">2</td>
						<td class="numberArea" id="p2"></td>
						<td class="green_value">10/100</td>
						<td class="numberArea" id="p2T"></td>
					</tr>
					<tr onclick="showsubTable1()">
						<td colspan="2" class="green_value textArea">신용카드/현금 영수증 발행분</td>
						<td class="pink">3</td>
						<td class="numberArea" id="p3"></td>
						<td rowspan="2" class="green_value">10/100</td>
						<td class="numberArea" id="p3T"></td>
					</tr>
					<tr onclick="showsubTable1()">
						<td colspan="2" class="green_value textArea">기타(정규영수증외매출분)</td>
						<td class="pink">4</td>
						<td class="numberArea" id="p4"></td>
						<td class="numberArea" id="p4T"></td>
					</tr>
					<tr onclick="showsubTable1()">
						<td rowspan="2" style="width:10%;" class="green_value">영세</td>
						<td colspan="2" class="green_value textArea">세금계산서발급분</td>
						<td class="pink">5</td>
						<td class="numberArea" id="p5"></td>
						<td class="green_value">0/100</td>
						<td class="green numberArea" id="p5T"></td>
					</tr>
					<tr onclick="showsubTable1()">
						<td colspan="2" class="green_value textArea">기타</td>
						<td class="pink">6</td>
						<td class="numberArea" id="p6"></td>
						<td class="green_value">0/100</td>
						<td class="green numberArea" id="p6T"></td>
					</tr>
					<tr onclick="showsubTable1()">
						<td colspan="3" class="green_value textArea">예정신고누락분</td>
						<td class="pink">7</td>
						<td class="numberArea" id="p7"></td>
						<td class="green"></td>
						<td class="numberArea" id="p7T"></td>
					</tr>
					<tr onclick="showsubTable1()">
						<td colspan="3" class="green_value textArea">대손세액가감</td>
						<td class="pink">8</td>
						<td class="green numberArea" id="p8"></td>
						<td class="green"></td>
						<td class="numberArea" id="p8T"></td>
					</tr>
					<tr onclick="showsubTable1()">
						<td colspan="3" class="green_value textArea">합계</td>
						<td class="pink">9</td>
						<td class="green numberArea" id="p9"></td>
						<td class="green_value">㉮</td>
						<td class="green numberArea" id="p9T"></td>
					</tr>
					<tr onclick="showsubTable1()">
						<td rowspan="9" style="width:4%;" class="blue">매입세액</td>
						<td rowspan="3" colspan="2" style="width:10%;" class="green_value">세금계산서 수취분</td>
						<td class="green_value textArea">일반매입</td>
						<td class="blue">10</td>
						<td class="numberArea" id="p10"></td>
						<td class="green_value"></td>
						<td class="numberArea" id="p10T"></td>
					</tr>
					<tr onclick="showsubTable1()">
						<td class="green_value textArea">수출기업수입분납부유예</td>
						<td class="blue">10</td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td class="green_value textArea">고정자산매입</td>
						<td class="blue">11</td>
						<td class="numberArea" id="p11"></td>
						<td class="green_value"></td>
						<td class="numberArea" id="p11T"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">예정신고누락분</td>
						<td class="blue">12</td>
						<td class="numberArea" id="p12"></td>
						<td class="green_value"></td>
						<td class="numberArea" id="p12T"></td>
					</tr>
					<tr onclick="showsubTable1()">
						<td colspan="3" class="green_value textArea">매입자발행세금계산서</td>
						<td class="blue">13</td>
						<td class="numberArea" id="p13"></td>
						<td class="green_value"></td>
						<td class="numberArea" id="p13T"></td>
					</tr>
					<tr onclick="showsubTable1()">
						<td colspan="3" class="green_value textArea">그 밖의 공제매입세액</td>
						<td class="blue">14</td>
						<td class="numberArea" id="p14"></td>
						<td class="green_value"></td>
						<td class="numberArea" id="p14T"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">합계(10)-(10-1)+(11)+(12)+(13)+(14)</td>
						<td class="blue">15</td>
						<td class="green numberArea" id="p15"></td>
						<td class="green_value"></td>
						<td class="green numberArea" id="p15T"></td>
					</tr>
					<tr onclick="showsubTable2()">
						<td colspan="3" class="green_value textArea">공제받지못할매입세액</td>
						<td class="blue">16</td>
						<td class="numberArea" id="p16"></td>
						<td class="green_value"></td>
						<td class="numberArea" id="p16T"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">차감계(15-16)</td>
						<td class="blue">17</td>
						<td class="green numberArea" id="p17"></td>
						<td class="green_value">㉯</td>
						<td class="green numberArea" id="p17T"></td>
					</tr>
					<tr>
						<td colspan="6" class="green_value textArea">납부(환급)세액(매출세액㉮-매입세액㉯)</td>
						<td class="green_value">㉰</td>
						<td class="green numberArea" id="da"></td>
					</tr>
					<tr>
						<td colspan="3" rowspan="3" class="green">경감공제세액</td>
						<td class="green_value textArea">그 밖의 경감,공제세액</td>
						<td class="green_value">18</td>
						<td class="green numberArea" id="p18"></td>
						<td class="green_value"></td>
						<td class="green numberArea" id="p18T"></td>
					</tr>
					<tr onclick="showsubTable2()">
						<td class="green_value textArea">신용카드매출전표등 발행공제등</td>
						<td class="green_value">19</td>
						<td class="numberArea" id="p19"></td>
						<td class="green_value"></td>
						<td class="numberArea" id="p19T"></td>
					</tr>
					<tr onclick="showsubTable2()">
						<td class="green_value textArea">합계</td>
						<td class="green_value">20</td>
						<td class="green numberArea" id="p20"></td>
						<td class="green_value">㉱</td>
						<td class="numberArea" id="p20T"></td>
					</tr>
					<tr onclick="showsubTable2()">
						<td colspan="4" class="green_value textArea">예정신고미환급세액</td>
						<td class="green_value">21</td>
						<td class="green numberArea" id="p21"></td>
						<td class="green_value">㉲</td>
						<td class="numberArea" id="p21T"></td>
					</tr>
					<tr onclick="showsubTable2()">
						<td colspan="4" class="green_value textArea">예정고지세액</td>
						<td class="green_value">22</td>
						<td class="green numberArea" id="p22"></td>
						<td class="green_value">㉳</td>
						<td class="numberArea" id="p22T"></td>
					</tr>
					<tr onclick="showsubTable2()">
						<td colspan="4" class="green_value textArea">사업양수자의 대리납부 기납부세액</td>
						<td class="green_value">23</td>
						<td class="green numberArea" id="p23"></td>
						<td class="green_value">㉴</td>
						<td class="numberArea" id="p23T"></td>
					</tr>
					<tr onclick="showsubTable3()">
						<td colspan="4" class="green_value textArea">매입자 납부특례 기납부세액</td>
						<td class="green_value">24</td>
						<td class="green numberArea" id="p24"></td>
						<td class="green_value">㉵</td>
						<td class="numberArea" id="p24T"></td>
					</tr>
					<tr onclick="showsubTable3()">
						<td colspan="4" class="green_value textArea">신용카드업자의 대리납부 기납부세액</td>
						<td class="green_value">25</td>
						<td class="numberArea" id="p25"></td>
						<td class="green_value">㉶</td>
						<td class="numberArea" id="p25T"></td>
					</tr>
					<tr onclick="showsubTable3()">
						<td colspan="4" class="green_value textArea">가산세액계</td>
						<td class="green_value">26</td>
						<td class="green numberArea" id="p26"></td>
						<td class="green_value">㉷</td>
						<td class="numberArea" id="p26T"></td>
					</tr>
					<tr>
						<td colspan="6" class="green_value textArea">차감,가감하여 납부할세액(환급받을세액)(㉰-㉱-㉲-㉴-㉵-㉶+㉷)</td>
						<td class="green_value">27</td>
						<td class="green numberArea" id="p27T"></td>
					</tr>
					<tr onclick="showsubTable3()">
						<td colspan="6" class="green_value textArea">총괄납부사업자가 납부할 세액(환급받을 세액)</td>
						<td class="green_value"></td>
						<td class="numberArea" id="totalBizTax"></td>
					</tr>
				</table>

			</div><!-- vat_main div end -->
			
			
		<div style="float: left; width: 49%;"><!-- 오른쪽 서브 영역 !!!!!!!!!!!!!!!!!!!!!!!!!!1-->
			<div class="subTable" id="vat_subDiv1"><!--7,12,14 vat_sub1 start-->
				<table class="mainSubDiv">
					<tr class="Tex_bill_th">
						<td colspan="5">구분</td>
						<td>금액</td>
						<td>세율</td>
						<td>세액</td>
					</tr>
					<tr class="green textArea">
						<td colspan="8">7.매출(예정신고누락분)</td>
					</tr>
					<tr>
						<td rowspan="5" style="width:4%;" class="yellow">예정누락분</td>
						<td rowspan="2" style="width:10%;"class="green_value">과세</td>
						<td colspan="2" class="green_value textArea">세금계산서발급분</td>
						<td class="pink">33</td>
						<td class="numberArea" id="p33"></td>
						<td class="green_value">10/100</td>
						<td class="numberArea" id="p33T"></td>
					</tr>
					<tr>
						<td colspan="2" class="green_value textArea">기타</td>
						<td class="pink">34</td>
						<td class="numberArea" id="p34"></td>
						<td class="green_value">10/100</td>
						<td class="numberArea" id="p34T"></td>
					</tr>
					<tr>
						<td rowspan="2" style="width:10%;" class="green_value">영세</td>
						<td colspan="2" class="green_value textArea">세금계산서발급분</td>
						<td class="pink">35</td>
						<td class="numberArea" id="p35"></td>
						<td class="green_value">0/100</td>
						<td class="green numberArea" id="p35T"></td>
					</tr>
					<tr>
						<td colspan="2" class="green_value textArea">기타</td>
						<td class="pink">36</td>
						<td class="numberArea" id="p36"></td>
						<td class="green_value">0/100</td>
						<td class="numberArea green" id="p36T"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value">합계</td>
						<td class="pink">37</td>
						<td class="numberArea green" id="p37"></td>
						<td class="green"></td>
						<td class="numberArea green" id="p37T"></td>
					</tr>
					<tr>
						<td colspan="8" class="green textArea">12.매입(예정신고누락분)</td>
					</tr>
					<tr>
						<td rowspan="12" style="width:4%;" class="yellow">예정누락분</td>
						<td colspan="3" class="green_value textArea">세금계산서발급분</td>
						<td class="blue">38</td>
						<td class="numberArea" id="p38"></td>
						<td class="green_value"></td>
						<td class="numberArea" id="p38T"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">그 밖의 공제매입세액</td>
						<td class="blue">39</td>
						<td class="numberArea" id="p39"></td>
						<td class="green_value"></td>
						<td class="numberArea" id="p39T"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value">합계</td>
						<td class="blue">40</td>
						<td class="numberArea green" id="p40"></td>
						<td class="green"></td>
						<td class="numberArea green" id="p40T"></td>
					</tr>
					<tr>
						<td  colspan="2" rowspan="2"  class="green_value">신용카드매출<br>수령금액합계</td>
						<td class="green_value textArea">일반매입</td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td class="green_value textArea">고정매입</td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">의제매입세액</td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">재활용폐자원등매입세액</td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">과세사업전환매입세액</td>
						<td class="green_value"></td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">재고매입세액</td>
						<td class="green_value"></td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">변제대손세액</td>
						<td class="green_value"></td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">외국인관광객에대한 환급세액</td>
						<td class="green_value"></td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value">합계</td>
						<td class="green_value"></td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea green"></td>
					</tr>
					<tr>
						<td colspan="8" class="green textArea">14.그 밖의 공제매입세액</td>
					</tr>
					<tr>
						<td rowspan="2" colspan="3" class="green_value textArea">신용카드매출수령금액합계표</td>
						<td class="green_value textArea">일반매입</td>
						<td class="blue">41</td>
						<td class="numberArea" id="p41"></td>
						<td class="green_value"></td>
						<td class="numberArea" id="p41T"></td>
					</tr>
					<tr>
						<td class="green_value textArea">고정매입</td>
						<td class="blue">42</td>
						<td class="numberArea" id="p42"></td>
						<td class="green_value"></td>
						<td class="numberArea" id="p42T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">의제매입세액</td>
						<td class="blue">43</td>
						<td class="numberArea" id="p43"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea" id="p43T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">재활용폐자원등매입세액</td>
						<td class="blue">44</td>
						<td class="numberArea" id="p44"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea" id="p44T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">과세사업전환매입세액</td>
						<td class="blue">45</td>
						<td class="numberArea green" id="p45"></td>
						<td class="green"></td>
						<td class="numberArea" id="p45T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">재고매입세액</td>
						<td class="blue">46</td>
						<td class="numberArea green" id="p46"></td>
						<td class="green"></td>
						<td class="numberArea" id="p46T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">변제대손세액</td>
						<td class="blue">47</td>
						<td class="green numberArea" id="p47"></td>
						<td class="green"></td>
						<td class="numberArea" id="p47T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">외국인관광객에대한환급세액</td>
						<td class=blue>48</td>
						<td class="numberArea green" id="p48"></td>
						<td class="green"></td>
						<td class="numberArea" id="p48T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value">합계</td>
						<td class="blue">49</td>
						<td class="numberArea green" id="p49"></td>
						<td class="green"></td>
						<td class="numberArea green" id="p49T"></td>
					</tr>
					
				</table>
			</div><!--7,12,14 vat_sub1 end -->
			
			
			<div class="subTable" id="vat_subDiv2"><!--16,18 vat_sub2 start  -->
				<table class="mainSubDiv">
					<tr  class="Tex_bill_th">
						<td colspan="5">구분</td>
						<td>금액</td>
						<td>세율</td>
						<td>세액</td>
					</tr>
					<tr class="green teatArea">
						<td colspan="8">16.공제받지 못할 매입세액</td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">공제받지못할 매입세액</td>
						<td class="green_value">50</td>
						<td class="numberArea" id="p50"></td>
						<td class="green"></td>
						<td class="numberArea" id="p50T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">공통매입세액면세등사업분</td>
						<td class="green_value">51</td>
						<td class="numberArea" id="p51"></td>
						<td class="green"></td>
						<td class="numberArea" id="p51T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">대손처분받은세액</td>
						<td class="green_value">52</td>
						<td class="numberArea" id="p52"></td>
						<td class="green"></td>
						<td class="numberArea" id="p52T"></td>
					</tr>
					<tr class="green_value">
						<td colspan="4" class="textArea">합계</td>
						<td>53</td>
						<td class="numberArea" id="p53"></td>
						<td></td>
						<td class="numberArea" id="p53T"></td>
					</tr>
					<tr class="green textArea">
						<td colspan="8">18.그 밖의 경감/공제세액</td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">전자신고세액공제</td>
						<td class="green_value">54</td>
						<td class="green numberArea" id="p54"></td>
						<td class="green"></td>
						<td class="numberArea" id="p54T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">전자세금계산서발급세액공제</td>
						<td class="green_value">55</td>
						<td class="green numberArea" id="p55"></td>
						<td class="green"></td>
						<td class="numberArea" id="p55T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">택시운송사업자경감세액</td>
						<td class="green_value">56</td>
						<td class="numberArea green" id="p56"></td>
						<td class="green"></td>
						<td class="numberArea" id="p56T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">대리납부세액공제</td>
						<td class="green_value">57</td>
						<td class="green numberArea" id="p57"></td>
						<td class="green"></td>
						<td class="numberArea" id="p57T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">현금영수증사업자세액공제</td>
						<td class="green_value">58</td>
						<td class="green numberArea" id="p58"></td>
						<td class="green"></td>
						<td class="numberArea" id="p58T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">기타</td>
						<td class="green_value">59</td>
						<td class="green numberArea" id="p59"></td>
						<td class="green"></td>
						<td class="numberArea" id="p59T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value">합계</td>
						<td class="green_value">60</td>
						<td class="green numberArea" id="p60"></td>
						<td class="green"></td>
						<td class="green_value numberArea" id="p60T"></td>
					</tr>
				</table>
			</div><!--16,18 vat_sub2 end -->
			<div  class="subTable" id="vat_subDiv3"><!--25 vat_sub3 start  -->
				<table class="mainSubDiv">
					<tr class="Tex_bill_th">
						<td colspan="5">구분</td>
						<td>금액</td>
						<td>세율</td>
						<td>세액</td>
					</tr>
					<tr>
						<td colspan="8" class="green textArea">25.가산세명세</td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">사업자미등록등</td>
						<td class="green_value">61</td>
						<td class="numberArea" id="p61"></td>
						<td class="green">1/100</td>
						<td class="numberArea" id="p61T"></td>
					</tr>
					<tr>
						<td colspan="3" rowspan="3" class="green_value">세금<br>계산서</td>
						<td class="green_value textArea">자연발급 등</td>
						<td class="green_value">62</td>
						<td class="numberArea" id="p62"></td>
						<td class="green">1/100</td>
						<td class="numberArea" id="p62T"></td>
						
					</tr>
					<tr>
						<td class="green_value textArea">자연수취</td>
						<td class="green_value">63</td>
						<td class="numberArea" id="p63"></td>
						<td class="green">5/1,000</td>
						<td class="numberArea" id="p63T"></td>
					</tr>
					<tr>
						<td class="green_value textArea">미발급 등</td>
						<td class="green_value">64</td>
						<td class="numberArea" id="p64"></td>
						<td class="green">뒤쪽참조</td>
						<td class="numberArea" id="p64T"></td>
					</tr>
					<tr>
						<td colspan="3" rowspan="2" class="green_value">전자세금<br>발급명세</td>
						<td class="green_value textArea">자연전송</td>
						<td class="green_value">65</td>
						<td class="numberArea" id="p65"></td>
						<td class="green">3/1,100</td>
						<td class="numberArea" id="p65T"></td>
					</tr>
					<tr>
						<td class="green_value textArea">자연전송</td>
						<td class="green_value">66</td>
						<td class="numberArea" id="p66"></td>
						<td class="green">5/1,000</td>
						<td class="numberArea" id="p66T"></td>
					</tr>
					<tr>
						<td colspan="3" rowspan="2" class="green_value">세금계산서<br>합계표</td>
						<td class="green_value textArea">제출불성실</td>
						<td class="green_value">67</td>
						<td class="numberArea" id="p67"></td>
						<td class="green">5/1,100</td>
						<td class="numberArea" id="p67T"></td>
					</tr>
					<tr>
						<td class="green_value textArea">지연제출</td>
						<td class="green_value">68</td>
						<td class="numberArea" id="p68"></td>
						<td class="green">3/1,000</td>
						<td class="numberArea" id="p68T"></td>
					</tr>
					<tr>
						<td colspan="3" rowspan="4" class="green_value">신고<br>불성실</td>
						<td class="green_value textArea">무신고(일반)</td>
						<td class="green_value">69</td>
						<td class="numberArea" id="p69"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea" id="p69T"></td>
						
					</tr>
					<tr>
						<td class="green_value textArea">무신고(부당)</td>
						<td class="green_value">70</td>
						<td class="numberArea" id="p70"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea" id="p70T"></td>
					</tr>
					<tr>
						<td class="green_value textArea">과소,초과환급(일반)</td>
						<td class="green_value">71</td>
						<td class="numberArea" id="p71"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea" id="p71T"></td>
					</tr>
					<tr>
						<td class="green_value textArea">과소,초과환급(부당)</td>
						<td class="green_value">72</td>
						<td class="numberArea" id="p72"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea" id="p72T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">납부불성실</td>
						<td class="green_value">73</td>
						<td class="numberArea" id="p73"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea" id="p73T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">영세율과세표준신고불성실</td>
						<td class="green_value">74</td>
						<td class="numberArea" id="p74"></td>
						<td class="green">5/1,000</td>
						<td class="numberArea" id="p74T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">현금매출명세서불성실</td>
						<td class="green_value">75</td>
						<td class="numberArea" id="p75"></td>
						<td class="green">1/100</td>
						<td class="numberArea" id="p75T"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">부동산임대공급가액명세서</td>
						<td class="green_value">76</td>
						<td class="numberArea" id="p76"></td>
						<td class="green">1/100</td>
						<td class="numberArea" id="p76T"></td>
					</tr>
					<tr>
						<td colspan="3" rowspan="2" class="green_value">매입자<br>납부특례</td>
						<td class="green_value textArea">거래계좌미사용</td>
						<td class="green_value">77</td>
						<td class="numberArea" id="p77"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea" id="p77T"></td>
					</tr>
					<tr>
						<td class="green_value textArea">거래계좌 지연입금</td>
						<td class="green_value">78</td>
						<td class="numberArea" id="p78"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea" id="p78T"></td>
					</tr>
					<tr class="green_value">
						<td colspan="4" class="textArea">합계</td>
						<td>79</td>
						<td class="numberArea"  id="p79"></td>
						<td class="green"></td>
						<td  class="numberArea" id="p79T"></td>
					</tr>
					</table>
			
			</div><!--25 vat_sub3 end  -->
	</div><!-- 오른쪽 서브영역 -->
		</div><!-- 전체 div end -->
            

<!-- 모달 시작-->
      <!-- 세부거래내역 -->
  <div class="modal fade" id="detailList_detail" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1B5748">
          <h4 class="modal-title" style="color:white;">전표조회</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
        
        <div>
        	<table id="List_detail" style=" width:100%; margin-left:auto; margin-right: auto;">
        		<thead>
        		<tr class="modal_detailList" style="background-color:#E7E6E6;">
        			<td>신고서 번호</td>
        			<td>신고서 이름</td>
        			<td>마감여부</td>
        		</tr>
        		</thead>
        		
        		
        	</table>
        </div>
        <div class="modal-footer">
          <input type="button" onclick="submit();" class="btn btn-default" value="마감">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 모달 끝-->


		<div style="height: 100vh;"></div>
		
 
	</div>
	</form>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>