<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	}
	
	#buyTaxInvoice td{
		border:1px solid blue;
	}
	#buyTaxInvoice th{
		border:1px solid blue;
	}
	#buyTaxInvoice{
		border-collapse: collapse;
	}
	
	#taxInvoiceLap {
		margin: 0 auto;
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
			<td colspan="12"></td>
			<th rowspan="4">공<br>급<br>받<br>는<br>자</th>
			<th colspan="3">등록번호</th>
			<td colspan="12"></td>
		</tr>
		<tr>
			<th colspan="3">상호<br>(법인명)</th>
			<td colspan="6"></td>
			<th>성명</th>
			<td colspan="5"></td>
			<th colspan="3">상호<br>(법인명)</th>
			<td colspan="6"></td>
			<th>성명</th>
			<td colspan="5"></td>
		</tr>
		<tr>
			<th colspan="3">사업장<br>주소</th>
			<td colspan="12"></td>
			<th colspan="3">사업장<br>주소</th>
			<td colspan="12"></td>
		</tr>
		<tr>
			<th colspan="3">업태</th>
			<td colspan="6"></td>
			<th>종목</th>
			<td colspan="5"></td>
			<th colspan="3">업태</th>
			<td colspan="6"></td>
			<th>종목</th>
			<td colspan="5"></td>
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
			<td colspan="2">2020</td>
			<td>03</td>
			<td>24</td>
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
			<td>3</td>
			<td>24</td>
			<td colspan="7">상품</td>
			<td colspan="3"></td>
			<td colspan="3"></td>
			<td colspan="4"></td>
			<td colspan="6">50,000</td>
			<td colspan="4">5,000</td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td>3</td>
			<td>24</td>
			<td colspan="7">상품</td>
			<td colspan="3"></td>
			<td colspan="3"></td>
			<td colspan="4"></td>
			<td colspan="6">50,000</td>
			<td colspan="4">5,000</td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td>3</td>
			<td>24</td>
			<td colspan="7">상품</td>
			<td colspan="3"></td>
			<td colspan="3"></td>
			<td colspan="4"></td>
			<td colspan="6">50,000</td>
			<td colspan="4">5,000</td>
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
			<td colspan="6">55,000</td>
			<td colspan="5"> </td>
			<td colspan="5"></td>
			<td colspan="5"></td>
			<td colspan="5"></td>
		</tr>
	</table>
	
	
	<br><br><br>
	<hr>
	<br><br><br>
	
	
	
	
	
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
			<td colspan="12"></td>
			<th rowspan="4">공<br>급<br>받<br>는<br>자</th>
			<th colspan="3">등록번호</th>
			<td colspan="12"></td>
		</tr>
		<tr>
			<th colspan="3">상호<br>(법인명)</th>
			<td colspan="6"></td>
			<th>성명</th>
			<td colspan="5"></td>
			<th colspan="3">상호<br>(법인명)</th>
			<td colspan="6"></td>
			<th>성명</th>
			<td colspan="5"></td>
		</tr>
		<tr>
			<th colspan="3">사업장<br>주소</th>
			<td colspan="12"></td>
			<th colspan="3">사업장<br>주소</th>
			<td colspan="12"></td>
		</tr>
		<tr>
			<th colspan="3">업태</th>
			<td colspan="6"></td>
			<th>종목</th>
			<td colspan="5"></td>
			<th colspan="3">업태</th>
			<td colspan="6"></td>
			<th>종목</th>
			<td colspan="5"></td>
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
			<td colspan="2">2020</td>
			<td>03</td>
			<td>24</td>
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
			<td>3</td>
			<td>24</td>
			<td colspan="7">상품</td>
			<td colspan="3"></td>
			<td colspan="3"></td>
			<td colspan="4"></td>
			<td colspan="6">50,000</td>
			<td colspan="4">5,000</td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td>3</td>
			<td>24</td>
			<td colspan="7">상품</td>
			<td colspan="3"></td>
			<td colspan="3"></td>
			<td colspan="4"></td>
			<td colspan="6">50,000</td>
			<td colspan="4">5,000</td>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td>3</td>
			<td>24</td>
			<td colspan="7">상품</td>
			<td colspan="3"></td>
			<td colspan="3"></td>
			<td colspan="4"></td>
			<td colspan="6">50,000</td>
			<td colspan="4">5,000</td>
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
			<td colspan="6">55,000</td>
			<td colspan="5"> </td>
			<td colspan="5"></td>
			<td colspan="5"></td>
			<td colspan="5"></td>
		</tr>
	</table>
	</div>
</body>
</html>