<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="textFit.min.js"></script>
<title>Insert title here</title>
<style>
	#saleTaxInvoice td{
		border:1px solid red;
	}
	#saleTaxInvoice th{
		border:1px solid red;
	}
	#saleTaxInvoice{
		border-collapse: collapse;
		width:750px;
	}
	
	#buyTaxInvoice td{
		border:1px solid blue;
	}
	#buyTaxInvoice th{
		border:1px solid blue;
	}
	#buyTaxInvoice{
		border-collapse: collapse;
		width:750px;
	}
	
	#taxInvoiceLap {
		margin: 0 auto;
	}
	
	tr {
		height: 30px;
	}
	
	
</style>
</head>
<body>
<div id="taxInvoiceLap">
	<table id="saleTaxInvoice">
		<!-- 세액 칸 25 -->
		<tr>
			<th colspan="20">세금계산서(공급자용)</th>
			<th colspan="4">승인번호</th>
			<th colspan="8"> </th>
		</tr>
		<tr>
			<th rowspan="4">공<br>급<br>자</th>
			<th colspan="3">등록번호</th>
			<td colspan="12"><c:out value="${ info.bizNum }"/></td>
			<th rowspan="4">공<br>급<br>받<br>는<br>자</th>
			<th colspan="3">등록번호</th>
			<td colspan="12"><c:out value="${ info.bizRegNum }"/></td>
		</tr>
		<tr>
			<th colspan="3">상호<br>(법인명)</th>
			<td colspan="6"><c:out value="${ info.bizName }"/></td>
			<th>성명</th>
			<td colspan="5"><c:out value="${ info.bossName }"/></td>
			<th colspan="3">상호<br>(법인명)</th>
			<td colspan="6"><c:out value="${ info.venderName }"/></td>
			<th>성명</th>
			<td colspan="5"><c:out value="${ info.venderBossName }"/></td>
		</tr>
		<tr>
			<th colspan="3">사업장<br>주소</th>
			<td colspan="12"><c:out value="${ info.bizLocation }"/></td>
			<th colspan="3">사업장<br>주소</th>
			<td colspan="12"><c:out value="${ info.venderAddress }"/></td>
		</tr>
		<tr>
			<th colspan="3">업태</th>
			<td colspan="6"><c:out value="${ info.sellWayName }"/></td>
			<th>종목</th>
			<td colspan="5"><c:out value="가방"/></td>
			<th colspan="3">업태</th>
			<td colspan="6"><c:out value="${ info.sellWay }"/></td>
			<th>종목</th>
			<td colspan="5"><c:out value="${ info.sellTarget }"/></td>
		</tr>
		<tr>
			<th colspan="4">작성</th>
			<th colspan="12">공급가액</th>
			<th colspan="10">세액</th>
			<th colspan="4">비고</th>
		</tr>
		<tr>
			<th colspan="2">년</th>
			<th>월</th>
			<th>일</th>
			<th>공란</th>
			<th>백</th>
			<th>십</th>
			<th>억</th>
			<th>천</th>
			<th>백</th>
			<th>십</th>
			<th>만</th>
			<th>천</th>
			<th>백</th>
			<th>십</th>
			<th>일</th>
			<th>십</th>
			<th>억</th>
			<th>천</th>
			<th>백</th>
			<th>십</th>
			<th>만</th>
			<th>천</th>
			<th>백</th>
			<th>십</th>
			<th>일</th>
			<th colspan="4" rowspan="2"> </th>
		</tr>
		<tr>
			<td colspan="2"><c:out value="${ info.year }"/></td>
			<td><c:out value="${ info.month }"/></td>
			<td><c:out value="${ info.date }"/></td>
			<td class="space"></td>
			<td class="supply"></td>
			<td class="supply"></td>
			<td class="supply"></td>
			<td class="supply"></td>
			<td class="supply"></td>
			<td class="supply"></td>
			<td class="supply"></td>
			<td class="supply"></td>
			<td class="supply"></td>
			<td class="supply"></td>
			<td class="supply">1</td>
			<td class="tax"></td>
			<td class="tax"></td>
			<td class="tax"></td>
			<td class="tax"></td>
			<td class="tax"></td>
			<td class="tax"></td>
			<td class="tax"></td>
			<td class="tax"></td>
			<td class="tax"></td>
			<td class="tax"></td>
		</tr>
		<tr>
			<th>월</th>
			<th>일</th>
			<th colspan="7">품목</th>
			<th colspan="3">규격</th>
			<th colspan="3">수량</th>
			<th colspan="4">단가</th>
			<th colspan="6">공급가액</th>
			<th colspan="4">세액</th>
			<th colspan="3">비고</th>
		</tr>
		<tr>
			<td><c:out value="${ info.month }"/></td>
			<td><c:out value="${ info.date }"/></td>
			<td colspan="7">상품</td>
			<td colspan="3"></td>
			<td colspan="3"></td>
			<td colspan="4"></td>
			<td colspan="6"><fmt:formatNumber value="${ info.supplyValue }" type="currency" currencySymbol=""></fmt:formatNumber></td>
			<td colspan="4"><fmt:formatNumber value="${ info.valueTax }" type="currency" currencySymbol=""></fmt:formatNumber></td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td> </td>
			<td> </td>
			<td colspan="7"> </td>
			<td colspan="3"></td>
			<td colspan="3"></td>
			<td colspan="4"></td>
			<td colspan="6"> </td>
			<td colspan="4"> </td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td> </td>
			<td> </td>
			<td colspan="7"> </td>
			<td colspan="3"></td>
			<td colspan="3"></td>
			<td colspan="4"></td>
			<td colspan="6"> </td>
			<td colspan="4"> </td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<th colspan="6">합계금액</th>
			<th colspan="5">현금</th>
			<th colspan="5">수표</th>
			<th colspan="5">어음</th>
			<th colspan="5">외상</th>
			<th colspan="6" rowspan="2">위 금액을 영수 함</th>
		</tr>
		<tr>
			<td colspan="6"><fmt:formatNumber value="${ info.supplyDeaga }" type="currency" currencySymbol=""/></td>
			<td colspan="5"> </td>
			<td colspan="5"></td>
			<td colspan="5"></td>
			<td colspan="5"></td>
		</tr>
	</table>
	
	
	<br>
	<hr>
	<br>
	
	
	
	
	
	<table id="buyTaxInvoice">
		<!-- 세액 칸 25 -->
		<tr>
			<th colspan="20">세금계산서(공급받는자용)</th>
			<th colspan="4">승인번호</th>
			<th colspan="8"> </th>
		</tr>
		<tr>
			<th rowspan="4">공<br>급<br>자</th>
			<th colspan="3">등록번호</th>
			<td colspan="12"><c:out value="${ info.bizNum }"/></td>
			<th rowspan="4">공<br>급<br>받<br>는<br>자</th>
			<th colspan="3">등록번호</th>
			<td colspan="12"><c:out value="${ info.bizRegNum }"/></td>
		</tr>
		<tr>
			<th colspan="3">상호<br>(법인명)</th>
			<td colspan="6"><c:out value="${ info.bizName }"/></td>
			<th>성명</th>
			<td colspan="5"><c:out value="${ info.bossName }"/></td>
			<th colspan="3">상호<br>(법인명)</th>
			<td colspan="6"><c:out value="${ info.venderName }"/></td>
			<th>성명</th>
			<td colspan="5"><c:out value="${ info.venderBossName }"/></td>
		</tr>
		<tr>
			<th colspan="3">사업장<br>주소</th>
			<td colspan="12"><c:out value="${ info.bizLocation }"/></td>
			<th colspan="3">사업장<br>주소</th>
			<td colspan="12"><c:out value="${ info.venderAddress }"/></td>
		</tr>
		<tr>
			<th colspan="3">업태</th>
			<td colspan="6"><c:out value="${ info.sellWayName }"/></td>
			<th>종목</th>
			<td colspan="5"><c:out value="가방"/></td>
			<th colspan="3">업태</th>
			<td colspan="6"><c:out value="${ info.sellWay }"/></td>
			<th>종목</th>
			<td colspan="5"><c:out value="${ info.sellTarget }"/></td>
		</tr>
		<tr>
			<th colspan="4">작성</th>
			<th colspan="12">공급가액</th>
			<th colspan="10">세액</th>
			<th colspan="4">비고</th>
		</tr>
		<tr>
			<th colspan="2">년</th>
			<th>월</th>
			<th>일</th>
			<th>공란</th>
			<th>백</th>
			<th>십</th>
			<th>억</th>
			<th>천</th>
			<th>백</th>
			<th>십</th>
			<th>만</th>
			<th>천</th>
			<th>백</th>
			<th>십</th>
			<th>일</th>
			<th>십</th>
			<th>억</th>
			<th>천</th>
			<th>백</th>
			<th>십</th>
			<th>만</th>
			<th>천</th>
			<th>백</th>
			<th>십</th>
			<th>일</th>
			<th colspan="4" rowspan="2">희</th>
		</tr>
		<tr>
			<td colspan="2"><c:out value="${ info.year }"/></td>
			<td><c:out value="${ info.month }"/></td>
			<td><c:out value="${ info.date }"/></td>
			<td class="space"></td>
			<td class="supply1"></td>
			<td class="supply1"></td>
			<td class="supply1"></td>
			<td class="supply1"></td>
			<td class="supply1"></td>
			<td class="supply1"></td>
			<td class="supply1"></td>
			<td class="supply1"></td>
			<td class="supply1"></td>
			<td class="supply1"></td>
			<td class="supply1"></td>
			<td class="tax1"></td>
			<td class="tax1"></td>
			<td class="tax1"></td>
			<td class="tax1"></td>
			<td class="tax1"></td>
			<td class="tax1"></td>
			<td class="tax1"></td>
			<td class="tax1"></td>
			<td class="tax1"></td>
			<td class="tax1"></td>
		</tr>
		<tr>
			<th>월</th>
			<th>일</th>
			<th colspan="7">품목</th>
			<th colspan="3">규격</th>
			<th colspan="3">수량</th>
			<th colspan="4">단가</th>
			<th colspan="6">공급가액</th>
			<th colspan="4">세액</th>
			<th colspan="3">비고</th>
		</tr>
		<tr>
			<td><c:out value="${ info.month }"/></td>
			<td><c:out value="${ info.date }"/></td>
			<td colspan="7">상품</td>
			<td colspan="3"></td>
			<td colspan="3"></td>
			<td colspan="4"></td>
			<td colspan="6"><fmt:formatNumber value="${ info.supplyValue }" type="currency" currencySymbol=""></fmt:formatNumber></td>
			<td colspan="4"><fmt:formatNumber value="${ info.valueTax }" type="currency" currencySymbol=""></fmt:formatNumber></td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td> </td>
			<td> </td>
			<td colspan="7"> </td>
			<td colspan="3"></td>
			<td colspan="3"></td>
			<td colspan="4"></td>
			<td colspan="6"> </td>
			<td colspan="4"> </td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td> </td>
			<td> </td>
			<td colspan="7"> </td>
			<td colspan="3"></td>
			<td colspan="3"></td>
			<td colspan="4"></td>
			<td colspan="6"> </td>
			<td colspan="4"> </td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<th colspan="6">합계금액</th>
			<th colspan="5">현금</th>
			<th colspan="5">수표</th>
			<th colspan="5">어음</th>
			<th colspan="5">외상</th>
			<th colspan="6" rowspan="2">위 금액을 영수 함</th>
		</tr>
		<tr>
			<td colspan="6"><fmt:formatNumber value="${ info.supplyDeaga }" type="currency" currencySymbol=""/></td>
			<td colspan="5"> </td>
			<td colspan="5"></td>
			<td colspan="5"></td>
			<td colspan="5"></td>
		</tr>
	</table>
	</div>
	
	
	<script>
		$(function(){
			setTimeout(function() { 
				print();
				
			}, 1000);
			var supplyL = "${supplyLength}";
			var taxL = "${taxLength}";
			var supply = ${supply};
			var tax = ${tax};
			
			var supplyM = 11-supplyL;
			
			$(".space").text(supplyM);
			var num = 0;
			$(".supply").each(function(index){
				if(supplyM < index+1){
					$(this).text(supply[num]);
					num++;
				}
			});
			var num = 0;
			$(".supply1").each(function(index){
				if(supplyM < index+1){
					$(this).text(supply[num]);
					num++;
				}
			});
			
			var taxM = 10-taxL;
			
			var number = 0;
			$(".tax").each(function(index){
				if(taxM < index+1){
					$(this).text(supply[number]);
					number++;
				}
			});
			var number = 0;
			$(".tax1").each(function(index){
				if(taxM < index+1){
					$(this).text(supply[number]);
					number++;
				}
			});
			
		});
	</script>
</body>
</html>