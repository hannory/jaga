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
            	<input type="text" class="cc_year">
            	<select class="cc_month">
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
            	<input type="text" class="cc_year">
            	<select class="cc_month">
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
			
		</ol>
			<table align="center">   
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
                <div id="Tex_bill_code" style="height: 100px; margin-left: auto; margin-right: auto; margin-top: 3px;margin-bottom: 3px;">
                    <h4>※[확인] 전성일자가 없는 거래는 전자세금계산서 발급분으로 반영 되므로 국세청 e세로 전송 세금계산서와 반드시 확인합니다.</h4>
                </div>
            </td>
        </tr>
        
    </table>
    </div>
    <script>
      function PopModalTexList(){
    	  console.log("모달확인");
    	  $("div#detailList_detail").modal();
      }

    </script>

    <!-- 모달 시작-->
      <!-- Modal 2012년 7월 이후변경사항 -->
  <div class="modal fade" id="changeAfter2012" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">2012년 7월 이후 변경사항</h4>
        </div>
        <div class="modal-body">
          <p>1.「매출처별,매입처별 세금계산서합계표 합계」</p>
          <b>-전자세금계산서 발급분(발급받은분) : 과세기간 종료일 다음달 11일까지 전송된 전사세금계산서 발급분(발급받은분)<br>
        -전자세금계산서 외의 발급분 : 위 전자세금계산서 외의 발급분(발급받은분)</b>
        <p>(종이로 발급(발급받은)한 세금계산서와 전자로 발급했(발급받았)더라도 <b>과세기간 종료일 다음달 11일이후</b> 국세청에 지연전송한
            전자세금계산서를 합산하여 반영합니다.)</p>
            <br>
        <p>2.「매출처별,매입처별 세금계산서합계표 명세」</p>
        <b>-전자세금계산서 외의 발급분에 대한 매출처(매입처)별 명세 -> 과세기간 종료일 다음달 11일까지 전송된 전자세금계산서 외
            발급분(발급받은) 매출처(매입처)별 명세 </b><p>(종이로 발급(발급받은)한 세금계산서와 전자로 발급했(발급받았)더라도)
                <b>과세기간 종료일 다음달 11일이후</b>국세청에 지연전송한 전자세금계산서를 합산하여 반영합니다.</p>
            <br>
        <p>※<b>「과세기간종료일 11일」</b>은 과세기간 종료 마지막 일자로부터 11일을 말합니다. 7.11일(1기 확정)과 1.11일(2기 확정)에 해당됩니다.</p>
        <p>단, 예정신고를 하는 사업자의 경우, 4.11일 또는 10.11일까지 전송된 전자세금계산서를 구분하여 위의 변경사항대로 기재하여야 합니다.</p>
        <br>
        <p style="color: red;">Θ 2012.07.01 이후 전자세금계산서 발급 및 전송기한 </p>
        <p>전자세금계산서를 발급한 경우 발급일의 다음날까지 국세청에 전송 전자세금계산서 발급기한 (다음날 10일까지 발급)은 변경이 없습니다.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
      <!-- Modal 2012년 7월 이후변경사항 -->
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
        			<td>부가세</td>
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
        			<td></td>
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