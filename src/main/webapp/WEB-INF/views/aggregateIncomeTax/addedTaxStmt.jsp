<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가 경리</title>

<style>
	.div-top4menuWrapper{
	/* 상단 메뉴 4개 설정 */
		width:70%;
	}
	.div-top4menu{
	/* 상단 4개 메뉴에 대한 설정(탭ㄴㄴ완전상단ㅇㅇ) */
		display:inline-block;
		width:20%;
		height:30px;
	}
	.div-top4menu h5{
	/* 상단4개 메뉴 > 각 메뉴 글자들을 가운데 두기 위함 */
		text-align:center;
	}
	.div-top4menu:hover{
	/* 상단 4개 메뉴 */
		cursor: pointer;
	}
</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<main>
	<div class="container-fluid">
	<!-- 작업영역 -->
	
	<h2 class="mt-4">종합소득세</h2>
		
		
		
		
		<!-- 귀속년도 -->
		<div style="float:right;">
			<label>귀속년도 : </label>
			<input type="text" style="">
			<label>년</label>
		</div>
		<!-- //귀속년도 -->
		
		<div style="height:50px;"></div><!-- 간격 띄우기 위한 용도 -->
		
		<div class="div-top4menuWrapper">
			<div class="div-top4menu" style="border-bottom: 3px solid green"><h5>소득금액명세서</h5></div>
			<div class="div-top4menu" onclick="goIncomeDeductStmt();"><h5>소득공제명세서</h5></div>
			<div class="div-top4menu" onclick="goAddedTaxStmt();"><h5>가산세명세서</h5></div>
			<div class="div-top4menu" onclick="goAggregateCalculated();"><h5>종합소득세액계산서</h5></div>
		</div>
		<!-- //class="div-top4menu" -->
		
		
		<script type="text/javascript">
		/* 상단 메뉴 탭 이동 함수들 */
		
		function goAggregateIncomeTax(){
			/* 소득금액명세서 */
			location.href="showAggregateIncomeTax.aggregate";
		}
		function goIncomeDeductStmt(){
			/* 소득공제명세서 */
			location.href="showIncomeDeductStmt.aggregate";
		}
		function goAddedTaxStmt(){
			/* 가산세명세서 */
			location.href="showAddedTaxStmt.aggregate";
		}
		function goAggregateCalculated(){
			/* 종합소득세액계산서 */
			location.href="showAggregateCalculated.aggregate";
		}
		</script>		
		
		<br>
		
		<table class="table-center" border="1">
		
			<tr>
				<td colspan="4">구분 및 계산기준</td>
				<td>기준금액</td>
				<td>가산세율</td>
				<td>가산세액</td>
			</tr>
			
			<tr>
				<td rowspan="4">무신고</td>
				<td rowspan="2" colspan="2">부정무신고</td>
				<td>무신고납부세액</td>
				<td><input type="text" id=""></td>
				<td>40/100</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			
			<tr>
				<td>수입금액</td>
				<td><input type="text"></td>
				<td>14/10,000</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="2" rowspan="2">일반무신고</td>
				<td>무신고납부세액</td>
				<td><input type="text" id=""></td>
				<td>20/100</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			
			<tr>
				<td>수입금액</td>
				<td><input type="text"></td>
				<td>7/10,000</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td rowspan="3">과소신고</td>
				<td rowspan="2" colspan="2">부정과서신고</td>
				<td>과소신고납부세액</td>
				<td><input type="text"></td>
				<td>40/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td>수입금액</td>
				<td><input type="text"></td>
				<td>14/10,000</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="2">일반과소신고</td>
				<td>과소신고납부세액</td>
				<td><input type="text"></td>
				<td>10/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td rowspan="2" colspan="2">납부(환급)불성실</td>
				<td colspan="2" >미납일수</td>
				<td><input type="text"></td>
				<td rowspan="2">2.5/10,000</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="2">미납부(환급)세액</td>
				<td><input type="text"></td>
				<td><input type="text"></td>
			</tr>
			
			
			
			<tr>
				<td rowspan="13">보고불성실</td>
				<td rowspan="2">지급명세서</td>
				<td>미제출(불명)</td>
				<td>지급(불명)금액</td>
				<td><input type="text"></td>
				<td>1/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td>지연 제출</td>
				<td>지연 제출 금액</td>
				<td><input type="text"></td>
				<td>0.5/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td rowspan="6">계산서</td>
				<td>미발급(위장)</td>
				<td>공급가액</td>
				<td><input type="text"></td>
				<td>2/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td>지연발급</td>
				<td>공급가액</td>
				<td><input type="text"></td>
				<td>2/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td>불명</td>
				<td>불명금액</td>
				<td><input type="text"></td>
				<td>1/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td>전자계산서 외 발급</td>
				<td>공급가액</td>
				<td><input type="text"></td>
				<td>1/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td>전자계산서 미전송</td>
				<td>공급가액</td>
				<td><input type="text"></td>
				<td> - </td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td>전자계산서 지연전송</td>
				<td>지연 전송 금액</td>
				<td><input type="text"></td>
				<td> - </td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td rowspan="2">계산서합계표</td>
				<td>미제출(불명)</td>
				<td>공급(불명)가액</td>
				<td><input type="text"></td>
				<td>0.5/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td>지연 제출</td>
				<td>지연 제출 금액</td>
				<td><input type="text"></td>
				<td>0.3/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td rowspan="2">매입처별세금<br>계산서합계표</td>
				<td>미제출(불명)</td>
				<td>공급(불명)가액</td>
				<td><input type="text"></td>
				<td>1/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td>지연 제출</td>
				<td>지연 제출 금액</td>
				<td><input type="text"></td>
				<td>0.3/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="3">소계</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			
			<tr>
				<td rowspan="2">증빙불비</td>
				<td colspan="2">미수취</td>
				<td>미 수취 금액</td>
				<td><input type="text"></td>
				<td>2/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="2">허위수취</td>
				<td>허위 수취 금액</td>
				<td><input type="text"></td>
				<td>2/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td rowspan="2">영수증 수취<br>명세서미제출</td>
				<td colspan="2">미제출</td>
				<td>미제출금액</td>
				<td><input type="text"></td>
				<td>1/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="2">불명</td>
				<td>불명금액</td>
				<td><input type="text"></td>
				<td>1/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td rowspan="2">사업장현황<br>신고불성실</td>
				<td colspan="2">무신고</td>
				<td>수입금액</td>
				<td><input type="text"></td>
				<td>0.5/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="2">과소신고</td>
				<td>수입금액</td>
				<td><input type="text"></td>
				<td>0.5/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td rowspan="2">공동사업장<br>등록불성실</td>
				<td colspan="2">미등록/허위등록</td>
				<td>총 수입금액</td>
				<td><input type="text"></td>
				<td>0.5/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="2">손익분배비율 허위신고 등</td>
				<td>총 수입금액</td>
				<td><input type="text"></td>
				<td>0.1/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="3">무기장</td>
				<td>산출세액</td>
				<td><input type="text"></td>
				<td>20/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td rowspan="2">사업용계좌<br>미신고 등</td>
				<td colspan="2">미개설/미신고</td>
				<td>수입금액 등</td>
				<td><input type="text"></td>
				<td>0.2/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="2">미사용</td>
				<td>미사용 금액</td>
				<td><input type="text"></td>
				<td>0.2/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td rowspan="3">신용카드거부</td>
				<td colspan="3">거래거부/불성실금액</td>
				<td><input type="text"></td>
				<td>5/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="3">거래거부/불성실건수</td>
				<td><input type="text"></td>
				<td>5,000원</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="2">위장가공</td>
				<td>발급수취금액</td>
				<td><input type="text"></td>
				<td>2/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td rowspan="5">현금영수증<br>미발급</td>
				<td colspan="2">미가맹</td>
				<td>수입금액</td>
				<td><input type="text"></td>
				<td>1/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="3">미발급/불성실금액</td>
				<td><input type="text"></td>
				<td>5/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="3">미발급/불성실건수</td>
				<td><input type="text"></td>
				<td>5,000원</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="2">위장가공</td>
				<td>발급수취금액</td>
				<td><input type="text"></td>
				<td>2/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="3">미발급금액(2019귀속부터적용)</td>
				<td><input type="text"></td>
				<td>20/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td rowspan="2">기부금영수증<br>불성실</td>
				<td colspan="2">영수증 불성실발급</td>
				<td>불성실기재금액</td>
				<td><input type="text"></td>
				<td>2/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="2">발급명세서 미작성/미보관</td>
				<td>미작성 등 금액</td>
				<td><input type="text"></td>
				<td>0.2/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="4">동업기업 배분 가산세</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			
			<tr>
				<td colspan="3">성실신고확인서 미제출 가산세</td>
				<td>산출세액</td>
				<td><input type="text"></td>
				<td>5/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="3">유보소득계산명세서 제출 불성실 가산세</td>
				<td>배당가능 유보소득금액</td>
				<td><input type="text"></td>
				<td>0.5/100</td>
				<td><input type="text"></td>
			</tr>
			
			<tr>
				<td colspan="4">합계</td>
				<td><input type="text"></td>
				<td></td>
				<td><input type="text"></td>
			</tr>
			
		
		
		
		</table>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			
		<!-- footer -->
		<div class="card mb-4">
			<div class="card-body">
				도움말입니다. 읽어주세요*^^*
				<h1>${ test }ㅋㅋㅋ</h1>
			</div>
		</div>
		<!-- ///footer -->
		
	<!-- //작업영역 -->
	</div><!-- class="container-fluid" -->
	</main>
	<jsp:include page="../common/menubar2.jsp" />
	
</body>
</html>