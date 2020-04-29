<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가 경리</title>

<style>
	input{
		border: none;
		text-align:center;
	}


	.div-top4menuWrapper{
	/* 상단 메뉴 4개 설정 */
		width:80%;
	}
	.div-top4menu{
	/* 상단 4개 메뉴에 대한 설정(탭ㄴㄴ완전상단ㅇㅇ) */
		display:inline-block;
		width:20%;
		height:30px;
	}
	.div-top4menu h5{
	/* 각 메뉴 글자들을 가운데 두기 위함 */
		text-align:center;
	}
	.div-top4menu:hover{
	/* 상단 4개 메뉴 */
		cursor: pointer;
	}
	
	
	
	.table-top input{
		/* 상단테이블 인풋태그 수정 */
		border:none;
		width:100%;
		height:100%;
	}
	.table-top td{
	/* 상단 신고유형 구분 테이블 하위 td 조정 */
		padding: 5px;
	}
	
	
	
	.table-center td:first-child{
	/* 본문 테이블 1열에 색깔 넣기 */
		background:#24574A;
		color:white;
		border-radius: 5px;
		text-align:center;
	}
	.table-center td{
	/* 테이블 하위 td들 넓이 설정 */
		width:200px;
	}
	.table-center{
	/* 본문테이블 td 간격 두기 */
		border-spacing: 5px;
		border-collapse: separate;
		text-align:center;
	}
	.table-center td:nth-last-child(1){
		border-bottom:1px solid black;
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
			<input id="attrYear" type="text" style="border-bottom:1px solid black;">
			<label>년</label>
		</div>
		
		<script>
		/* 귀속연도 받아온 값으로 바꿔줌 */
		$(function(){
			/* if(${ dto.attrYear eq null }){
				alert("null true");
				console.log(dto.attrYear);
			} */
			$("#attrYear").val("2020");
		});
			
		</script>
		
		<!-- //귀속년도 -->
		
		<div style="height:50px;"></div><!-- 간격 띄우기 위한 용도 -->
		
		<div class="div-top4menuWrapper">
			<div class="div-top4menu" style="border-bottom: 3px solid #24574A"><h5>소득금액명세서</h5></div>
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
		
		
		
		
		
		
		
		
		
		
		
		
		
		<!-- 상단 테이블 감싸는 div -->
		<div style="width:70%; background:white;">
			<table border="1" class="table-top" style="text-align:center;">
				<tr>
					<td style="width:6%;"><span>신고<br>유형</span></td>
					<td style="width:5%;"><input type="text" id="" name=""></td>
					<td style="width:18%;">1. 자기조정</td>
					<td>2. 간편장부</td>
					<td>3. 추계 - 기준</td>
					<td>4. 추계 - 단순</td>
					<td style="width:15%;">5. 성실신고확인</td>
				</tr>
				<tr>
					<td><span>기장<br>의무</span></td>
					<td><input type="text" id="" name=""></td>
					<td>1. 복식부기의무자</td>
					<td>2. 간편장부대상자</td>
					<td>3. 비사업자</td>
					<td style="border-bottom:1px solid white;"></td>
					<td style="border-left:1px solid white; border-right:1px solid white; border-bottom:1px solid white;"><button onclick="">소득금액명세추가</button></td>
				</tr>
			</table>
		</div>
		<!-- 상단 테이블 감싸는 div 끝 -->
		
		<!-- 본문 테이블 감싸는 div -->
		<div class="div-tableCenter" style="margin-top:30px; margin-bottom:30px;">
		<table class="table-center">
			<tr>
				<td>소득 구분 코드</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>신고 유형 코드</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>상호 또는 법인명</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>사업자 등록번호</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>주민등록번호</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>기장의무</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>주업종코드</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>총수입금액</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>필요경비</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>소득금액</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>원천징수액 - 소득세</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>이월결손금 공제 여부</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>공동사업장 여부</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>최저한세적용대상 소득</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>과세기간 시작일</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>과세기간 종료일</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>소재지</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td>국내여부</td>
				<td><input type="text" id="" name=""></td>
			</tr>
		</table>
		</div>
		<!-- //본문 테이블 감싸는 div 끝-->
		
		
		
		
		
		
		
		
		
		
		
		
		
		
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




