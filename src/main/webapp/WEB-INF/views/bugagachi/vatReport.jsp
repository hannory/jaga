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
        /* td{ border: 1px solid red;} */
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
   		/* .billMainTable{
   			width:100%;
   		} */
   		.total_deemed{
   			text-align: center;
   			width: 99%;
   			border:1px solid #C9CACE;
   		}
   		#total_deemed_div1{
   			align:center;
   		 	width: 99%;
   		 	float: left;
   		}
   		#total_deemed_div2{
   			align:center;
   		 	width: 99%;
   		 	float: left;
   		}
   		#total_deemed_div3{
   			align:center;
   		 	width: 99%;
   		 	float: left;
   		}
   		#tax1{
   		 	width:100%; 
   		 	border:2px solid #C9CACE;
   	  	 	padding:8px;
   		}
   		#tax2{
   			width:100%; 
   		 	border:2px solid #C9CACE;
   	  	 	padding:8px;
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
			<h2 class="mt-4">부가가체시 신고서</h2>
	<ol class="breadcrumb mb-4">
			<li><button id="deadlineBtn">마감</button></li>
			<li>1기예정</li>
			<li>신고구분: 
                <select name="report_type">
                    <option>1.정기신고</option>
                    <option>2.수정신고</option>
                </select></li>
            <li>조회기간:
            	<input type="text" name="search_st" class="datepicker"> ~ <input type="text" name="search_ed"class="datepicker">
            </li>
			<li><input type="button" name="search" value="조회"></li>
			<li>부가율: <input type="text" name="vatRate" readonly style="width: 50px;">
			<input type="text" name="vatRateDiv" readonly  style="width: 50px; background-color:#D9EAD3 "> </li>
			<li><input type="button" name="report" value="신고서미리보기"></li>
			
		</ol>
		
		
		<div style="width: 100%;"><!-- 전체 div start -->
		
			<div style="width: 50%; float: left; margin-right: 2px;"><!-- vat_main div start -->
				<table border="1" style="width: 100%; text-align: center;">
					<tr>
						<td colspan="5"></td>
						<td colspan="3">정기 신고 금액</td>
					</tr>
					<tr>
						<td colspan="5">구분</td>
						<td>금액</td>
						<td>세율</td>
						<td>세액</td>
					</tr>
					<tr>
						<td rowspan="9" style="width:4%;">과세표준및매출세액</td>
						<td rowspan="4" style="width:10%;">과세</td>
						<td colspan="2">세금계산서발급분</td>
						<td>1</td>
						<td></td>
						<td>10/100</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2">매입자발행세금계산서</td>
						<td>2</td>
						<td></td>
						<td>10/100</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2">신용카드/현금 영수증 발행분</td>
						<td>3</td>
						<td></td>
						<td rowspan="2">10/100</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2">기타(정규영수증외매출분)</td>
						<td>4</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td rowspan="2" style="width:10%;">영세</td>
						<td colspan="2">세금계산서발급분</td>
						<td>5</td>
						<td></td>
						<td>0/100</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2">기타</td>
						<td>6</td>
						<td></td>
						<td>0/100</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3">예정신고누락분</td>
						<td>7</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3">대손세액가감</td>
						<td>8</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3">합계</td>
						<td>9</td>
						<td></td>
						<td>㉮</td>
						<td></td>
					</tr>
					<tr>
						<td rowspan="9" style="width:4%;">매입세액</td>
						<td rowspan="3" colspan="2" style="width:10%;">세금계산서 수취분</td>
						<td>일반매입</td>
						<td>10</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>수출기업수입분납부유예</td>
						<td>10</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>고정자산매입</td>
						<td>11</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3">예정신고누락분</td>
						<td>12</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3">매입자발행세금계산서</td>
						<td>13</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3">그 밖의 공제매입세액</td>
						<td>14</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3">합계(10)-(10-1)+(11)+(12)+(13)+(14)</td>
						<td>15</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3">공제받지못할매입세액</td>
						<td>16</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3">차감계(15-16)</td>
						<td>17</td>
						<td></td>
						<td>㉯</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="6">납부(환급)세액(매출세액㉮-매입세액㉯)</td>
						<td>㉰</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3" rowspan="3">경감공제세액</td>
						<td>그 밖의 경감,공제세액</td>
						<td>18</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>신용카드매출전표등 발행공제등</td>
						<td>19</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>합계</td>
						<td>20</td>
						<td></td>
						<td>㉱</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="4">예정신고미환급세액</td>
						<td>21</td>
						<td></td>
						<td>㉲</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="4">예정고지세액</td>
						<td>22</td>
						<td></td>
						<td>㉳</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="4">사업양수자의 대리납부 기납부세액</td>
						<td>23</td>
						<td></td>
						<td>㉴</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="4">매입자 납부특례 기납부세액</td>
						<td>24</td>
						<td></td>
						<td>㉵</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="4">신용카드업자의 대리납부 기납부세액</td>
						<td>25</td>
						<td></td>
						<td>㉶</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="4">가산세액계</td>
						<td>26</td>
						<td></td>
						<td>㉷</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="6">차감,가감하여 납부할세액(환급받을세액)(㉰-㉱-㉲-㉴-㉵-㉶+㉷)</td>
						<td>27</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="6">총괄납부사업자가 납부할 세액(환급받을 세액)</td>
						<td></td>
						<td></td>
					</tr>
				</table>

			</div><!-- vat_main div end -->
			
			
			
			<div style="width: 49%; float: left;"><!--7,12,14 vat_sub1 start -->
				<table border="1" style="width: 100%; text-align: center;">
					<tr>
						<td colspan="5">구분</td>
						<td>금액</td>
						<td>세율</td>
						<td>세액</td>
					</tr>
					<tr>
						<td colspan="8">7.매출(예정신고누락분)</td>
					</tr>
					<tr>
						<td rowspan="5" style="width:4%;">예정누락분</td>
						<td rowspan="2" style="width:10%;">과세</td>
						<td colspan="2">세금계산서발급분</td>
						<td>33</td>
						<td></td>
						<td>10/100</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2">기타</td>
						<td>34</td>
						<td></td>
						<td>10/100</td>
						<td></td>
					</tr>
					<tr>
						<td rowspan="2" style="width:10%;">영세</td>
						<td colspan="2">세금계산서발급분</td>
						<td>35</td>
						<td></td>
						<td>0/100</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2">기타</td>
						<td>36</td>
						<td></td>
						<td>0/100</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3">합계</td>
						<td>37</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="8">12.매입(예정신고누락분)</td>
					</tr>
					<tr>
						<td rowspan="12" style="width:4%;">예정누락분</td>
						<td colspan="3">세금계산서발급분</td>
						<td>38</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3">그 밖의 공제매입세액</td>
						<td>39</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="3">합계</td>
						<td>40</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td  colspan="2" rowspan="2" style="width: ">신용카드매출<br>수령금액합계</td>
						<td>일반매입</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td>고정매입</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					
				</table>
			</div><!--7,12,14 vat_sub1 end -->
			
			<div style="width: 50%; float: left;"><!--16,18 vat_sub2 start  -->
			
			</div><!--16,18 vat_sub2 end -->
			<div style="width: 50%; float: left;"><!--25 vat_sub3 start  -->
			</div><!--25 vat_sub3 end  -->
		
		</div><!-- 전체 div end -->
            

		<div style="height: 100vh;"></div>
		
 
	
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>