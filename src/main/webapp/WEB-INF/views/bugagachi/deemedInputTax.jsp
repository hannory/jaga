<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            height: 40px;
        }
        .middleMenu>h4{
            padding: 8px;
        }
        #totalSum{
            text-align: center;
            margin-top: 15px;
            margin-bottom:40px;
        }
        #totalSum td{
            border: 1px solid #C9CACE; 
            height: 23px;
            width:25%;
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
        .Tex_bill_th{
            background-color:#E7E6E6;
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
   		.billMainTable{
   			width:100%;
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
			<h2 class="mt-4">신용카드매출전표등 수령명세서(갑)(을)</h2>
	<ol class="breadcrumb mb-4">
			<li><button id="deadlineBtn">마감</button></li>
			<li>1기예정</li>
            <li>조회기간:
            	<input type="text" name="search_ye1" class="cc_year">
            	<select class="cc_month" name="search_mon1">
            		<option value="">월</option>
            		<option value="1">1</option>
            		<option value="1">2</option>
            		<option value="1">3</option>
            		<option value="1">4</option>
            		<option value="1">5</option>
            		<option value="1">6</option>
            		<option value="1">7</option>
            		<option value="1">8</option>
            		<option value="1">9</option>
            		<option value="1">10</option>
            		<option value="1">11</option>
            		<option value="1">12</option>
            	</select> 
            	~ 
            	<input type="text" name="search_ye2" class="cc_year">
            	<select class="cc_month" name="search_mon1">
            		<option value="">월</option>
            		<option value="1">1</option>
            		<option value="1">2</option>
            		<option value="1">3</option>
            		<option value="1">4</option>
            		<option value="1">5</option>
            		<option value="1">6</option>
            		<option value="1">7</option>
            		<option value="1">8</option>
            		<option value="1">9</option>
            		<option value="1">10</option>
            		<option value="1">11</option>
            		<option value="1">12</option>
            	</select> 
            </li>
            <li><input type="button" name="search" value="조회"></li>
            <li><input type="button" name="report" value="신고서미리보기"></li>
			
		</ol>
			<table align="center" class="billMainTable">   
        <tr>
            <td colspan="10">
                <div class="middleMenu">
                    <h4>2.신용카드 등 매입내역 합계</h4>
                </div>
            </td>
        </tr>
        <!-- 매출세금계산서 총합계 표 -->
        <tr>
            <td colspan="10">
                <table align="center" id="totalSum" style="width: 99%;">
                    <tr style="background-color: #E7E6E6;font-weight: 700;">
                        <td>구  분</td>
                        <td>거래건수</td>
                        <td>공급가액</td>
                        <td>세  액</td>
                    </tr>
                    <tr>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                    </tr>
                     <tr>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                    </tr>
                     <tr>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                    </tr>
                     <tr>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                    </tr>
                    
                </table>

            </td>
            
        </tr>
        <!-- 매출세금계산서 총합계 표 끝 -->
        <tr>
            <td colspan="10">
                <div class="middleMenu">
                    <h4>3.거래내역입력</h4>
                </div>
            </td>
        </tr>
        <!-- 상세리스트 -->
        <tr>
            <td colspan="10">
                <div>
                    <table id="Tex_bill_detailList">
                        <tr class="Tex_bill_th" style="font-weight: 800; height: 25px;">
                            <td rowspan="2" id="Text_billNo">no</td>
                            <td rowspan="2">월/일</td>
                            <td rowspan="2">구분</td>
                            <td rowspan="2" style="width:20%;">공급자</td>
                            <td rowspan="2" style="width:20%;">공급자(가맹점)<br>사업자등록번호</td>
                            <td rowspan="2">카드호원번호</td>
                            <td colspan="3">그 밖의 신용카드 등 거래내역 합계</td>
                        </tr>
                        <tr class="Tex_bill_th" onclick="PopModalTexList()" style="font-weight: 800; height: 25px;">
                           
                            <td> 거래건수</td>
                            <td> 공급가액</td>
                            <td> 세액</td>
                        </tr>
                        <tr onclick="PopModalTexList()">
                            <td id="Text_billNo"> </td>
                            <td> </td>
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
                            <td> </td>
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
                            <td> </td>
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
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr class="Tex_bill_th" style="font-weight: 600;">
                            <td colspan="6"> 합계 </td>
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

		<div style="height: 100vh;"></div>
		
 
	
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