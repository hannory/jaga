<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />

	<main>
	<div class="container-fluid">

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
            height: 30px;
        }
        #middleMenu >h3{
            padding: 3px;
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
        .click_li a{
            background-color: #8DABA3;
            color: white;
            margin-right: 1px;
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
        }
        
    </style>
    <script>
        $(function(){
            $(click)
        });
    </script>

    <table align="center">
        <tr>
            <td id="titleArea" colspan="3"><h1>세금계산서 합계표</h1></td>
            <td><button id="deadlineBtn">마감</button></td>
            <td>1기예정</td>
            <td>신고구분: 
                <select>
                    <option>1.정기신고</option>
                    <option>2.수정신고</option>
                </select>
            </td>
            <td>조회기간: </td>
            <td><input type="date"> ~ <input type="date"></td>
            <td><img src=""></td>
        </tr>
        <tr>
            <td><h3>매출</h3></td>            
            <td><h3>매입</h3></td>
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
                    <h3>2.매출세금계산서 총합계</h3>
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
                        <td style="width: 15%;">세  액</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 45%;" id="green">합  계</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 15%;"> </td>
                    </tr>
                    <tr>
                        <td rowspan="3" style="width: 25%;" id="green">과세기간 종료일 다음달<br>11일 까지 전송된<br>
                        전자세금계산서 발급분</td>
                        <td style="width: 25%;" id="green">사업자 번호 발급분</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 15%;"> </td>

                    </tr>
                    <tr>
                        <td style="width: 25%;" id="green">주민등록 번호 발급분</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 15%;"> </td>

                    </tr>
                    <tr>
                        <td style="width: 25%;" id="green">소계</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 15%;"> </td>

                    </tr>

                    <tr>
                        <td rowspan="3" style="width: 25%;" id="green">위 전자세금계산서 외의<br>발급분(종이발급분+과세기간<br>
                        종료일 다움달 12일 이후분)</td>
                        <td style="width: 25%;" id="green">사업자 번호 발급분</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 15%;"> </td>

                    </tr>
                    <tr>
                        <td style="width: 25%;" id="green">주민등록 번호 발급분</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 15%;"> </td>

                    </tr>
                    <tr>
                        <td style="width: 25%;" id="green">소계</td>
                        <td style="width: 15%;"> </td>
                        <td style="width: 10%;"> </td>
                        <td style="width: 15%;"> </td>
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
                        <li class="click_li"><a id="cho_nav1" href="#">과세기간 종료일 다음달 11일까지(전자분)</a></li>
                        <li class="click_li" id=""><a id="cho_nav2" href="#">과세기간 종료일 다음달 12일이후 (전자분분) ,그외</a></li>
                        <li class="click_li"><a id="cho_nav3" href="#">전체데이터</a></li>
                        <li class="click_li" style="margin-top:6px; float: right;">
                            <input style="background-color: #D9EAD3;" type="button" value="2012년 7월 이후 변경사항"  data-toggle="modal" data-target="#changeAfter2012"></li>
                        
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
                            <td>코드</td>
                            <td>거래처명</td>
                            <td>매수</td>
                            <td>공급가액</td>
                            <td>세   액</td>
                            <td>대표자성명</td>
                            <td>업   태</td>
                            <td>종   목</td>
                            <td>주류코드</td>
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
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr id="Tex_bill_th" style="font-weight: 600;">
                            <td id="Text_billNo" rowspan="2" style="height: 50px;"> </td>
                            <td colspan="3"> 합   계 </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                            <td> </td>
                        </tr>
                        <tr id="Tex_bill_th" style="font-weight: 600;">
                            <td colspan="3"> 마감합계 </td>
                            <td> </td>
                            <td> </td>
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
                <div id="Tex_bill_code" style="height: 100px; margin-left: auto; margin-right: auto; margin-top: 3px;margin-bottom: 3px;">
                    <h4>※[확인] 전성일자가 없는 거래는 전자세금계산서 발급분으로 반영 되므로 국세청 e세로 전송 세금계산서와 반드시 확인합니다.</h4>
                </div>
            </td>
        </tr>
        
    </table>
    <script>
        function PopModalTexList(){
            data-toggle:"modal";
            data-target:"#changeAfter2012";
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
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>This is a large modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 모달 끝-->
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />

</body>
</html>