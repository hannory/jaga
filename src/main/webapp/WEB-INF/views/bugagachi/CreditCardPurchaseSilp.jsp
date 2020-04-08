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
            width:100%;
        }
        #totalSum tr{
        	height: 80px;
        }
        #totalSum td{
            border: 1px solid #C9CACE; 
            
        }
       .green{
            background-color: #D9EAD3;
            font-weight: 700;
        }  
        .green_value{
        	background-color: #F3F4F6;
        	width:18%;
        	
        }
        #Tex_bill_detailList{
            margin-top: 25px;
            margin-bottom: 25px;
            margin-left: auto;
            margin-right: auto;
            width: 98%;
            text-align: center;
        }
        #Tex_bill_detailList tr{
        	height: 50px;
        }
        #Tex_bill_detailList td{
            border: 1px solid #C9CACE; 
            width: 20%;
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
		.table-justify3 {
			width: 150px;
			display: flex;
			justify-content: space-between;
		}
		#tax_pur{
			align: center;
			text-align: center;
			width: 100%;
			height: 70px;
			margin-bottom: 40px;
			margin-top: 20px;
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
			<h2 class="mt-4">신용카드매출전표등 발행금액 집계표</h2>
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
                    <h4>1.인적사항</h4>
                </div>
            </td>
        </tr>
        <!-- 1.인적사항 표 -->
        <tr>
            <td colspan="10">
                <table align="center" id="totalSum">
                    <tr>
                        <td class="green">상호</td>
                        <td class="green_value"></td>
                        <td class="green">성명</td>
                        <td class="green_value"></td>
                        <td class="green">사업등록번호</td>
                        <td class="green_value"></td>
                    </tr>
                    <tr>
                    	<td class="green">사업장소재지</td>
                    	<td class="green_value" colspan="5"></td>
                    </tr>
                   
                </table>

            </td>
            
        </tr>
        <!-- 1.인적사항 표 끝 -->
        <tr>
            <td colspan="10">
                <div class="middleMenu">
                    <h4>2.신용카드매출전표 등 발행금액 현황</h4>
                </div>
            </td>
        </tr>
        <!--2.신용카드매출전표등 발행 금액 현황 표 시작 -->
        <tr>
            <td colspan="10">
                <div>
                    <table id="Tex_bill_detailList">
                        <tr class="Tex_bill_th" style="font-weight: 800; height: 25px;">
                            <td id="Text_billNo">구 분</td>
                            <td>합 계</td>
                            <td>신용/직불/기명식/선불카드</td>
                            <td style="width:20%;">현금영수증</td>
                            <td style="width:20%;">직불전자지금 수단 및<br>기명식선불 전자지급수단</td>  
                        </tr>
 						<tr>
 							<td class="green" align="center"><div class="table-justify3"><div>합</div><div>계</div></td>
 							<td class="green_value"></td>
 							<td class="green_value"></td>
 							<td class="green_value"></td>
 							<td class="green_value"></td>
 						</tr>
 						<tr>
 							<td class="green" align="center"><div class="table-justify3"><div>과</div><div>세</div><div>매</div><div>출</div><div>분</div></td>
 							<td class="green_value"></td>
 							<td></td>
 							<td></td>
 							<td></td>
 						</tr>
 						<tr>
 							<td class="green" align="center"><div class="table-justify3"><div>면</div><div>세</div><div>매</div><div>출</div><div>분</div></td>
 							<td class="green_value"></td>
 							<td></td>
 							<td></td>
 							<td></td>
 						</tr>
 						<tr>
 							<td class="green" align="center"><div class="table-justify3"><div>봉</div><div>사</div><div>료</div></td>
 							<td class="green_value"></td>
 							<td></td>
 							<td></td>
 							<td></td>
 						</tr>
                        
                    </table>
                </div>
            </td>
        </tr>
        <!--2.신용카드매출전표등 발행 금액 현황 표 끝 -->
        <!--3.신용카드매출전표 등 발행금액총 세금계산서 교부내역  -->
        <tr>
        	<td colspan="10">
                <div class="middleMenu">
                    <h4>3.신용카드매출전표 등 발행금액 중 세금계산서 교부내역</h4>
                </div>
            </td>
        </tr>
        <tr>
        	<table id="tax_pur">
        		<tr>
        			<td class="green">세금계산서발급금액</td>
        			<td class="green_value" style="width: 30%"></td>
        			<td class="green">계산서발급금액</td>
        			<td class="green_value" style="width: 30%"></td>
        		</tr>
        	
        	</table>
        	
        </tr>
        <!--3.신용카드매출전표 등 발행금액총 세금계산서 교부내역  -->
        <tr>
            <td colspan="9">
            <!-- 코드영역 -->
                <div id="Tex_bill_code">
                     <p class="Tex_bill_code_p" style="height: 70px;"></p>
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