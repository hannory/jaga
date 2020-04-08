<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <style>
       *{
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        #titleArea{
            width: 50%;
        }
        #middleMenu{
            background-color: #24574A;
            color: white;
            height: 40px;
        }
        #middleMenu>h4{
            padding: 8px;
        }
        #totalSum{
            text-align: center;
            margin-top: 15px;
            margin-bottom:40px;
        }
        #totalSum td{
            border: 1px solid #C9CACE; 
        }
        #green{
            background-color: #D9EAD3;
            font-weight: 700;
        }
        #cho_nav1{
            background-color: #1B5748;
            color: white;
        }   
        #Tex_bill_detailList{
            margin-top: 25px;
            margin-bottom: 25px;
            margin-left: auto;
            margin-right: auto;
            width: 98%;
            text-align: center;
        }
        #Tex_bill_detailList td{
            border: 1px solid #C9CACE; 
        }
        #Tex_bill_th{
            background-color:#E7E6E6;
        }
        #Text_billNo{
            background-color:#E7E6E6;
            height: 25px;
        }
        #Tex_bill_code{
            border: 1px solid black;
            height: 100px; 
            margin-left: auto; 
            margin-right: auto; 
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .breadcrumb>li{
        	margin: auto auto;
        }
        /* td{ border: 1px solid red;} */
        .cho_nav{
        	height: 35px;
        	border: 1px solid #C9CACE;
        	border-radius: 5pt;
        	background-color:#8DABA3;
        	color: white;
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
   		/* td{
   			border:1px solid red;
   		} */
   		.cho_sumTableMainTable{
   			width:100%;
   		}
   		.Tex_bill_code_p{
   			font-size:23px;
   		}
   	
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />

	<main>
	<div class="container-fluid">
	<h2 class="mt-4">계산서 합계표</h2>
	<ol class="breadcrumb mb-4">
			<li><button id="deadlineBtn">마감</button></li>
			<li>1기예정</li>
            <li>조회기간:
            	<input type="text" name="search_st" class="datepicker"> ~ <input type="text" name="serach_ed" class="datepicker">
            </li>
            <li><input type="button" name="search" value="조회"></li>
            <li><input type="button" name="report" value="신고서미리보기"></li>
			
		</ol>
		
     <script>
        $(function(){
          $("#purchase").css("display","none");
          
            $(".cho_nav").click(function(){
            	$(".cho_nav").css("background","#8DABA3")
            	$(this).css("background","#1B5748");
            	$(this).css("color","white");
            });

        	$("#showsumTable_purchase").css("border-bottom","5px solid #1B5748 ");

        	$("#showsumTable_sales").css("border-bottom","5px solid #1B5748 ");
        });
    </script>
	<script type="text/javascript">
	function showsumTable_purchase(){
    	$("#sales").hide();
    	$("#purchase").show();
    };
    function showsumTable_sales(){
    	$("#sales").show();
    	$("#purchase").hide();
    }
	
	</script>
	<div id="sales">
    <table class="cho_sumTableMainTable" align="center">
        
        <tr>
             <td><div class="sumTableSales" onclick="showsumTable_sales()" id="showsumTable_sales"><h4>매출</h4></div></td>            
            <td><div class="sumTableSales" onclick="showsumTable_purchase()" ><h4>매입</h4></div></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <!-- <tr>
            <td>
                
            </td>
        </tr> -->
        <tr>
            <td colspan="10">
                <div id="middleMenu">
                    <h4>2.매출계산서 총합계</h4>
                </div>
            </td>
        </tr>
        <!-- 매출세금계산서 총합계 표 -->
        <tr>
            <td colspan="10">
                <table align="center" id="totalSum" style="width: 99%;">
                    <tr style="background-color: #E7E6E6;font-weight: 700;">
                        <td colspan="2" style="width: 45%;">구  분</td>
                        <td style="width: 15%;">매출처수</td>
                        <td style="width: 10%;">매   수</td>
                        <td style="width: 15%;">공급가액</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 45%;" id="green">합  계</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>
                    </tr>
                    <tr>
                        <td rowspan="3" style="width: 25%;" id="green">과세기간 종료일 다음달<br>11일 까지 전송된<br>
                        전자세금계산서 발급분</td>
                        <td style="width: 25%;" id="green">사업자 번호 발급분</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>

                    </tr>
                    <tr>
                        <td style="width: 25%;" id="green">주민등록 번호 발급분</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>

                    </tr>
                    <tr>
                        <td style="width: 25%;" id="green">소계</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>

                    </tr>

                    <tr>
                        <td rowspan="3" style="width: 25%;" id="green">위 전자세금계산서 외의<br>발급분(종이발급분+과세기간<br>
                        종료일 다움달 12일 이후분)</td>
                        <td style="width: 25%;" id="green">사업자 번호 발급분</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>

                    </tr>
                    <tr>
                        <td style="width: 25%;" id="green">주민등록 번호 발급분</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>

                    </tr>
                    <tr>
                        <td style="width: 25%;" id="green">소계</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>

                    </tr>
                </table>

            </td>
            
        </tr>
        <!-- 매출세금계산서 총합계 표 끝 -->
        <tr>
            <td colspan="10">
                <div>
                    <ul class="nav nav-pills">
                        <li class="click_li"><div class="cho_nav" id="cho_nav1"><p>과세기간 종료일 다음달 11일까지(전자분)</p></div></li>
                        <li class="click_li"><div class="cho_nav" id="cho_nav2"><p>과세기간 종료일 다음달 12일이후 (전자분분) ,그외</p></div></li>
                        <li class="click_li"><div class="cho_nav" id="cho_nav3"><p>전체데이터</p></div></li>
                        
                        
                    </ul>
                </div>
            </td>
        </tr>
        <!-- 상세리스트 -->
        <tr>
            <td colspan="10">
                <div>
                    <table id="Tex_bill_detailList">
                        <tr id="Tex_bill_th" style="font-weight: 800;">
                            <td id="Text_billNo">no</td>
                            <td>사업자등록번호</td>
                           <!--  <td>코드</td> -->
                            <td>거래처명</td>
                            <td>매수</td>
                            <td>공급가액</td>
                            <!-- <td>세   액</td> -->
                            <td>대표자성명</td>
                            <td>업   태</td>
                            <td>종   목</td>
                            <!-- <td>주류코드</td> -->
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <!-- <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <!-- <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                           <!--  <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <!-- <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                           <!--  <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <!-- <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <!-- <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                           <!--  <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                           <!--  <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <!-- <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <!-- <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                           <!--  <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr id="Tex_bill_th" style="font-weight: 600;">
                            <td id="Text_billNo" rowspan="2" style="height: 50px;"> </td>
                            <td colspan="2"> 합   계 </td>
                            <!-- <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr id="Tex_bill_th" style="font-weight: 600;">
                            <td colspan="2"> 마감합계 </td>
                           <!--  <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                    </table>
                </div>
            </td>
        </tr>
        <!-- 상세리스트끝 -->
        <tr>
            <td colspan="9">
            <!-- 코드영역 -->
                <div id="Tex_bill_code">
                    <p class="Tex_bill_code_p">[확인]전성일자가 없는 거래는 전자세금계산서 발급분으로 반영 되므로 국세청 e세로 전송 세금계산서와 반드시 확인합니다.</p>
                </div>
            </td>
        </tr>
        
    </table>
    </div>
    <!-- 매출영역 끝 -->
    <script>
      function PopModalTexList(){
    	  console.log("모달확인");
    	  $("div#detailList_detail").modal();
      }

    </script>

    <!-- 모달 시작-->
      <!-- 세부거래내역 -->
  <div class="modal fade" id="detailList_detail" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#1B5748">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:white;">전표조회</h4>
        </div>
        <div class="modal-body">
        <table style="margin-left:auto; margin-right: auto;">
        	<tr>
        		<td ><p>거래처코드</p></td>
        		<td><input style="width:100px;" type="text" readonly></td>
        		<td><p>거래처명</p></td>
        		<td><input style="width:150px;" name="companyName" type="text" readonly></td>
        		<td><input style="width:150px;" name="personName" type="text" readonly></td>
        		<td><input style="width:150px;" name="companyCode" type="text" readonly></td>
        	</tr>
        </table>
        <div>
        	<table id="List_detail" style=" width:100%; margin-left:auto; margin-right: auto;">
        		<tr class="modal_detailList" style="background-color:#E7E6E6;">
        			<td>월/일</td>
        			<td>유형</td>
        			<td>품목</td>
        			<td>수량</td>
        			<td>단가</td>
        			<td>매수</td>
        			<td>공급가액</td>
        			<td>분개</td>
        			<td>예정누락분</td>
        			<td>전자여부</td>
        		</tr>
        		<tr class="modal_detail" style="height: 25px;">
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        		</tr>
        		<tr class="modal_detailList" style="background-color:#E7E6E6;">
        			<td colspan="3">합계</td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        		</tr>
        	</table>
        </div>
        <div class="modal-footer">
          <input type="button" class="btn btn-default" value="인쇄">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 모달 끝-->
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 매입영역 -->
	<div id="purchase">
	<table class="cho_sumTableMainTable" align="center">
        
        <tr>
             <td><div class="sumTableSales" onclick="showsumTable_sales()" ><h4>매출</h4></div></td>            
            <td><div class="sumTableSales" onclick="showsumTable_purchase()" id="showsumTable_purchase"><h4>매입</h4></div></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <!-- <tr>
            <td>
                
            </td>
        </tr> -->
        <tr>
            <td colspan="10">
                <div id="middleMenu">
                    <h4>2.매입계산서 총합계</h4>
                </div>
            </td>
        </tr>
        <!-- 매입세금계산서 총합계 표 -->
        <tr>
            <td colspan="10">
                <table align="center" id="totalSum" style="width: 99%;">
                    <tr style="background-color: #E7E6E6;font-weight: 700;">
                        <td colspan="2" style="width: 45%;">구  분</td>
                        <td style="width: 15%;">매출처수</td>
                        <td style="width: 10%;">매   수</td>
                        <td style="width: 15%;">공급가액</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 45%;" id="green">합  계</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>
                    </tr>
                    <tr style="height: 75px;">
                        <td style="width: 25%;" id="green">과세기간 종료일 다음달<br>11일 까지 전송된<br>
                        전자세금계산서 발급분</td>
                        <td style="width: 25%;" id="green">사업자 번호 발급분</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>

                    </tr>

                    <tr style="height: 75px;">
                        <td style="width: 25%;" id="green">위 전자세금계산서 외의<br>발급분(종이발급분+과세기간<br>
                        종료일 다움달 12일 이후분)</td>
                        <td style="width: 25%;" id="green">사업자 번호 발급분</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>

                    </tr>
               
                </table>

            </td>
            
        </tr>
        <!-- 매출세금계산서 총합계 표 끝 -->
        <tr>
            <td colspan="10">
                <div>
                    <ul class="nav nav-pills">
                        <li class="click_li"><div class="cho_nav" id="cho_nav1"><p>과세기간 종료일 다음달 11일까지(전자분)</p></div></li>
                        <li class="click_li"><div class="cho_nav" id="cho_nav2"><p>과세기간 종료일 다음달 12일이후 (전자분분) ,그외</p></div></li>
                        <li class="click_li"><div class="cho_nav" id="cho_nav3"><p>전체데이터</p></div></li>
                        
                        
                    </ul>
                </div>
            </td>
        </tr>
        <!-- 상세리스트 -->
        <tr>
            <td colspan="10">
                <div>
                    <table id="Tex_bill_detailList">
                        <tr id="Tex_bill_th" style="font-weight: 800;">
                            <td id="Text_billNo">no</td>
                            <td>사업자등록번호</td>
                           <!--  <td>코드</td> -->
                            <td>거래처명</td>
                            <td>매수</td>
                            <td>공급가액</td>
                            <!-- <td>세   액</td> -->
                            <td>대표자성명</td>
                            <td>업   태</td>
                            <td>종   목</td>
                            <!-- <td>주류코드</td> -->
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <!-- <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <!-- <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                           <!--  <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <!-- <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                           <!--  <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <!-- <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <!-- <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                           <!--  <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                           <!--  <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <!-- <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <!-- <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                           <!--  <td> </td>
                            <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr id="Tex_bill_th" style="font-weight: 600;">
                            <td id="Text_billNo" rowspan="2" style="height: 50px;"> </td>
                            <td colspan="2"> 합   계 </td>
                            <!-- <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr id="Tex_bill_th" style="font-weight: 600;">
                            <td colspan="2"> 마감합계 </td>
                           <!--  <td> </td>
                            <td> </td> -->
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        
                    </table>
                </div>
            </td>
        </tr>
        <!-- 상세리스트끝 -->
        <tr>
            <td colspan="9">
            <!-- 코드영역 -->
                 <div id="Tex_bill_code">
                    <p class="Tex_bill_code_p">[확인]전성일자가 없는 거래는 전자세금계산서 발급분으로 반영 되므로 국세청 e세로 전송 세금계산서와 반드시 확인합니다.</p>
                </div>
            </td>
        </tr>
        
    </table>
	</div>
	<!-- 매입영역끝 -->
	<script>
	/* 날짜 input jquery ui */
		$.datepicker.setDefaults({
			showOn : "both",
			buttonImageOnly : true,
			buttonImage : "${contextPath}/resources/images/calendar.png",
			dateFormat : 'yy-mm-dd'

		});
		$(function() {
			$(".datepicker").datepicker({});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");

		});
	 </script>
	</main>
	<jsp:include page="../common/menubar2.jsp" />

</body>
</html>