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
   		#termDiv{
   			width:80px; 
   			height: 30px;
   			text-align: center;
   		}
   		.cc_month{
   			width:50px; 
   			height: 30px;
   		}
   		.Tex_bill_code_p{
   			font-size:14px;
   		}
   		.billMainTable{
   			width:100%;
   		}
   		#deadlineCen{
			display: none;
			border:1px solid red; 
			margin-left: -200px;
			color:red;
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
			<form action="insertCcsalesSlip.cssg" method="post">
			 
	<ol class="breadcrumb mb-4">
			<li><button id="deadlineBtn" type="submit">마감</button></li>
		
			<li><button id="deadlineCen" onclick="cencelDeadline()">마감 취소</button></li>
		
			<li><input type="text" readonly  id="termDiv" name="termDiv"></li>
            <li>조회기간:
            	<input type="text" id="search_ye1" maxlength="4" name="yearOfAttr" class="cc_year">
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
            <li><input type="button" onclick="search_cssg()" name="search" value="조회"></li>
            <li><input type="button" name="report" value="신고서미리보기"></li>
			
		</ol>
			<table align="center" class="billMainTable">   
        <tr>
            <td colspan="10">
                <div class="middleMenu">
                    <h4>2.신용카드 등 매입내역 합계</h4>
            <c:set var="comCode" value="${ sessionScope.loginCompany.companyCode }"/>
            <input type="hidden" name="rcptstmtCode" id="rcptstmtCode">
            <input type="hidden" name="comCode" value="${comCode }">
            
            <!-- Detail항목 -->
            <!-- <input type="text" name="eventDiv" id="eventDiv">Detail항목명
            <input type="text" name="dealCount" id="dealCount">Detail거래건수
            <input type="text" name="valOfSupply" id="valOfSupply">Detail공급가액
            <input type="text" name="tax" id="tax">Detail세금 -->
            
            <!-- TnxHis 항목 -->
           <!--  <input type="hidden" name="slipCode" id="slipCode">
            <input type="hidden" name="silpDate" id="silpDate">
            <input type="hidden" name="division" id="division">
            <input type="hidden" name="producer" id="producer">
            <input type="hidden" name="proNum" id="proNum">
            <input type="hidden" name="cardmemNum" id="cardmemNum">
            <input type="hidden" name="numOfTxn" id="numOfTxn">
            <input type="hidden" name="valOfSupply" id="valOfSupply"> -->
            
                </div>
            </td>
        </tr>
        <!-- $(this).find(인풋) -->
        <script type="text/javascript">
		function cencelDeadline(){  
		   $("form").attr("action", "updateccSalesSilpGap.cssg");
		}
	 	function search_cssg(){
	 		var search_ye1= $("#search_ye1").val();
	 		var search_mon1= $("#search_mon1").val();
	 		var search_mon2= $("#search_mon2").val();
	 		var comCode=${comCode};
	 		console.log(search_ye1);
	 		console.log(search_mon1);
	 		console.log(search_mon2);
	 		console.log(comCode);
	 		
	 		$.ajax({
	 			url:"ccSalesSilpGap.cssg",
	 			type:"post",
	 			data:{search_ye1:search_ye1, search_mon1:search_mon1, search_mon2:search_mon2, comCode:comCode },
	 			success: function(data){
	 				console.log(data);
	 				var cssg=data.cssg; 
	 				console.log(cssg);
					var cgDetailList=data.cgDetailList;
					console.log(cgDetailList);
					var cssgHisList=data.cssgHisList;
					console.log(cssgHisList);
					$("#termDiv").val(cssg.termDiv);
	 				$("#sum").text("합계");
	 			 	$("#cash").text("현금영수증");
	 				$("#driver").text("화물운전자복지카드");
	 				$("#bCard").text("사업용신용카드");
	 				$("#oCard").text("그밖의신용카드");
	 				$("#rcptstmtCode").val(cssg.rcptstmtCode);
	 			 // 2.신용카드등 매입내역 합계
	 			 
	 			 	//현금영수증
	 			 	var cashDeal=0;
	 			 	var cashVos=0;
	 			 	var cashTax=0;
	 			 	//화물운전자복지카드
	 			 	var driverDeal=0;
	 			 	var driverVos=0;
	 			 	var driverTax=0;
	 			 	//사업신용카드
	 			 	var bCardDeal=0;
	 			 	var bCardVos=0;
	 			 	var bCardTax=0;
	 			 	//그 밖의 신용카드
	 			 	var oCardDeal=0;
	 			 	var oCardVos=0;
	 			 	var oCardTax=0;
	 			 	var index=0;
	 				for(var key in cgDetailList){
	 					console.log(cgDetailList[key].eventDiv);
	 					if(cgDetailList[key].eventDiv =="현금영수증"){
	 						cashDeal+=cgDetailList[key].dealCount;
	 						cashVos+=cgDetailList[key].valOfSupply;
	 						cashTax+=cgDetailList[key].tax;
	 					}else if(cgDetailList[key].eventDiv =="화물운전자복지카드"){
	 						driverDeal+=cgDetailList[key].dealCount;
	 						driverVos+=cgDetailList[key].valOfSupply;
	 						driverTax+=cgDetailList[key].tax;
	 					}else if(cgDetailList[key].eventDiv =="사업용신용카드"){
	 						bCardDeal+=cgDetailList[key].dealCount;
	 						bCardVos+=cgDetailList[key].valOfSupply;
	 						bCardTax+=cgDetailList[key].tax;
	 					}else if(cgDetailList[key].eventDiv =="그 밖의 신용카드"){
	 						oCardDeal+=cgDetailList[key].dealCount;
	 						oCardVos+=cgDetailList[key].valOfSupply;
	 						oCardTax+=cgDetailList[key].tax;
	 					}
	 					index++;
	 					
	 				}
	 				
	 					
	 				for(var key in cgDetailList){
	 					if(cgDetailList[key].eventDiv =="현금영수증"){
	 						$("input[name=eventDiv]").attr("name","cssDetail["+key+"].eventDiv").val("현금영수222증");
		 					$("input[name=dealCount]").attr("name","cssDetail["+key+"].dealCount").val(cgDetailList[key].dealCount);
		 					var temp = $("input");
		 					console.log(temp);
		 					console.log("현영: "+cgDetailList[key].dealCount)
		 					$("input[name=valOfSupply]").attr("name","cssDetail["+key+"].valOfSupply").val(cgDetailList[key].valOfSupply);
		 					console.log("현영: "+cgDetailList[key].valOfSupply)
		 					$("input[name=tax]").attr("name","cssDetail["+key+"].tax").val(cgDetailList[key].tax); 
	 						
	 					}
	 					if(cgDetailList[key].eventDiv =="그 밖의 신용카드"){
	 					
	 						$("input[name=eventDiv]").attr("name","cssDetail["+key+"].eventDiv").val("그 밖의 신용카드");
	 						$("input[name=dealCount]").attr("name","cssDetail["+key+"].dealCount").val(cgDetailList[key].dealCount);
	 						console.log("그 밖"+cgDetailList[key].dealCount)
	 						$("input[name=valOfSupply]").attr("name","cssDetail["+key+"].valOfSupply").val(cgDetailList[key].valOfSupply);
	 						console.log("그 밖"+cgDetailList[key].valOfSupply)
	 						$("input[name=tax]").attr("name","cssDetail["+key+"].tax").val(cgDetailList[key].tax);
		 					
	 					}
	 					
	 				}
	 				
	 				
	 				
	 				
						//현금영수증 합계
	 					$("#cashDeal").text(cashDeal);
	 					$("#cashVos").text(cashVos);
	 					$("#valOfSupply").val(cashVos)
	 					$("#cashTax").text(cashTax);
	 						console.log("1");
	 					
	 					
	 					console.log(cashDeal);
	 					
	 					
	 					//화물 운전자
	 					$("#driverDeal").text(driverDeal);
	 					$("#driverVos").text(driverVos);
	 					$("#driverTax").text(driverTax);
	 					//사업용신용카드
	 					$("#bCardDeal").text(bCardDeal);
	 					$("#bCardVos").text(bCardVos);
	 					$("#bCardTax").text(bCardTax);
	 					//그밖의신용카드
	 					$("#oCardDeal").text(oCardDeal);
	 					$("#oCardVos").text(oCardVos);
	 					$("#oCardTax").text(oCardTax);
	 			
	 					
	 					
	 					
	 					
		 				
		 					console.log("index: "+index);

	 					
	 					
	 						
	 					//합계	
	 					var sumDeal=cashDeal+driverDeal+bCardDeal+oCardDeal;
	 					var sumVos=cashVos+driverVos+bCardVos+oCardVos;
	 					var sumTax=cashTax+driverTax+bCardTax+oCardTax;
						$("#sumDeal").text(sumDeal);
						$("#sumVos").text(sumVos);
						$("#sumTax").text(sumTax);
	 				
		
						
	 				//3.거래내역입력
	 			
	 				var $Tex_bill_detailList = $("#Tex_bill_detailList");
					$Tex_bill_detailList.html('<tr class="Tex_bill_th" style="font-weight: 800; height: 25px;"><td rowspan="2" id="Text_billNo">no</td><td rowspan="2">월/일</td><td rowspan="2">구분</td><td rowspan="2" style="width:20%;">공급자</td><td rowspan="2" style="width:20%;">공급자(가맹점)<br>사업자등록번호</td><td rowspan="2">카드회원번호</td><td colspan="3">그 밖의 신용카드 등 거래내역 합계</td></tr><tr class="Tex_bill_th" onclick="PopModalTexList()" style="font-weight: 800; height: 25px;"><td> 거래건수</td><td> 공급가액</td><td> 세액</td></tr>');
					var index=0;
					var dealCtn=0;
					var vos=0;
					var vat=0;
					for(var key in cssgHisList) {
						var $tr = $("<tr  onclick='PopModalTexList()'>");
						index++;
						dealCtn+=cssgHisList[key].numOfTxn;
						vos+=cssgHisList[key].valOfSupply;
						vat+=cssgHisList[key].tax;
						var dateSplit=cssgHisList[key].silpDate.split(' ');
						var date=dateSplit[0];
						var $noTd = $(" <td id='Text_billNo'>").text(index);
						var $dateTd = $("<td>").text(date);
						var $divisionTd = $("<td>").text(cssgHisList[key].division);
						var $prodNameTd = $("<td>").text(cssgHisList[key].proNum);
						var $prodNumTd = $("<td>").text(cssgHisList[key].producer);
						var $cardmemNumTd = $("<td>").text(cssgHisList[key].cardmemNum);
						var $numOfTxnTd = $("<td>").text(cssgHisList[key].numOfTxn);
						var $valOfSupplyTd = $("<td>").text(cssgHisList[key].valOfSupply);
						var $taxTd = $("<td>").text(cssgHisList[key].tax);
						
						
						$("#slipCode").val(cssgHisList[key].slipCode);
						$("#silpDate").val(cssgHisList[key].silpDate);
						$("#division").val(cssgHisList[key].division);
						$("#producer").val(cssgHisList[key].producer);
						$("#proNum").val(cssgHisList[key].proNum);
						$("#cardmemNum").val(cssgHisList[key].cardmemNum);
						$("#numOfTxn").val(cssgHisList[key].numOfTxn);
						$("#valOfSupply").val(cssgHisList[key].valOfSupply);
						$("#tax").val(cssgHisList[key].tax);
						
						$tr.append($noTd);
						$tr.append($dateTd);
						$tr.append($divisionTd);
						$tr.append($prodNameTd);
						$tr.append($prodNumTd);
						$tr.append($cardmemNumTd);
						$tr.append($numOfTxnTd);
						$tr.append($valOfSupplyTd);
						$tr.append($taxTd);
						
						$Tex_bill_detailList.append($tr);
					}
                  	
					var $endTr=$("<tr class='Tex_bill_th' style='font-weight: 600;'>");
					var $endTd1=$("<td colspan='6'>").text("합계");
					var $endTd2=$("<td>").text(dealCtn);
					var $endTd3=$("<td>").text(vos);
					var $endTd4=$("<td>").text(vat);
					$endTr.append($endTd1);
					$endTr.append($endTd2);
					$endTr.append($endTd3);
					$endTr.append($endTd4);
					$Tex_bill_detailList.append($endTr);
	 				
	 				
	 				
	 				//마감 버튼 종류
	 				if(cssg.deadline == 'Y'){
						console.log("마감된 애임")
						$("#deadlineCen").show();
						$("#deadlineBtn").hide();
					} 
	 				
	 				
	 				
	 			},
	 			error:function(error){
	 				console.log(error);
	 			}
	 		});/* ajax끝!!! */
	 	}
	 
	 </script>
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
                    <tr><!-- 합계영역  -->
                        <td id="sum"> </td>
                        <td id="sumDeal"> </td>
                        <td id="sumVos"> </td>
                        <td id="sumTax"> </td>
                    </tr>
                     <tr><!-- 현금영수증  -->
                        <td id="cash"> </td> 
                        <td id="cashDeal"> </td>
                        <td id="cashVos"> </td>
                        <td id="cashTax"> </td>
                    </tr>
                     <tr><!-- 화물운전자 복지카드 -->
                        <td id="driver"> </td>
                        <td id="driverDeal"> </td>
                        <td id="driverVos"> </td>
                        <td id="driverTax"> </td>
                    </tr>
                     <tr><!-- 사업용 신용카드 -->
                        <td id="bCard"> </td>
                        <td id="bCardDeal"> </td>
                        <td id="bCardVos"> </td>
                        <td id="bCardTax"> </td>
                    </tr>
                    <tr><!-- 그 밖의 신용카드 -->
                        <td id="oCard"> </td>
                        <td id="oCardDeal"> </td>
                        <td id="oCardVos"> </td>
                        <td id="oCardTax"> </td>
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
	</form>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>