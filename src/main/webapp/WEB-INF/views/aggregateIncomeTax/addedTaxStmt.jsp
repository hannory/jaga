<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가 경리</title>

<style>
	input{
		border:none;
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
	/* 상단4개 메뉴 > 각 메뉴 글자들을 가운데 두기 위함 */
		text-align:center;
	}
	.div-top4menu:hover{
	/* 상단 4개 메뉴 */
		cursor: pointer;
	}
	
	.table-center{
		text-align:center;
	}
	
</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<main>
	<div class="container-fluid">
	<!-- 작업영역 -->
	
	<h2 class="mt-4">종합소득세</h2>
	
	<script>
		/* form 서브밋 체크 */
		flag = false;
		tempValue = 0 ;
		
		function checkSubmit(){
			if(tempValue > 0){
				return true;
			}
			return false;
		}
		function submitFunc(){
			tempValue = 1;
			$("#formId").submit();
		}
	</script>
	
		<!-- <button onclick="submitFunc();" style="width:50px; height:30px; background:#24574A; border:none; color:white; border-radius:5px;">저장</button> -->
		
		
		
		<!-- 귀속년도 -->
		<div style="float:right;">
			<label>귀속년도 : </label>
			<input id="attrYearDisplay" type="text" style="border-bottom:1px solid black;">
			<label>년</label>
		</div>
		
		<script>
			$(function(){
				$("#attrYearDisplay").change(function(){
					$("#attrYear").val($("#attrYearDisplay").val());
				});
			})
		</script>
		<!-- //귀속년도 -->
		
		<div style="height:50px;"></div><!-- 간격 띄우기 위한 용도 -->
		
		<div class="div-top4menuWrapper">
			<div class="div-top4menu" onclick="goAggregateIncomeTax();"><h5>소득금액명세서</h5></div>
			<div class="div-top4menu" onclick="goIncomeDeductStmt();"><h5>소득공제명세서</h5></div>
			<div class="div-top4menu" style="border-bottom: 3px solid #24574A"><h5>가산세명세서</h5></div>
			<div class="div-top4menu" onclick="goAggregateCalculated();"><h5>종합소득세액계산서</h5></div>
			
			<button onclick="submitFunc();" style="width:50px; height:30px; background:#24574A; border:none; color:white; border-radius:5px;">저장</button>
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
		
		<form id="formId" action="insertAddedTaxStmt.aggregate" method="post" onsubmit="return checkSubmit();">	<!-- 포스트로 한번 보내보자 -->
		
		
		<!-- 서버로 보낼 데이터 -->
		<input type="hidden" id="attrYear" name="attrYear">
		<input type="hidden" id="comCode" name="comCode" value="${ loginCompany.companyCode }">
		
		
		
		<table class="table-center" border="1" style="background:lightgray">
		
			<tr>
				<td colspan="4">구분 및 계산기준</td>
				<td>기준금액</td>
				<td>가산세율</td>
				<td>가산세액</td>
			</tr>
			
			<tr>
				<td rowspan="4">(1) 무신고</td>
				<td rowspan="2" colspan="2">부정무신고</td>
				<td>무신고납부세액</td>
				<td><input type="text" id="in101" class="left" name="in101"></td>
				<td>40/100</td>
				<td><input type="text" id="v101" class="right" name="v101"></td>
			</tr>
			
			<tr>
				<td>수입금액</td>
				<td><input type="text" id="in102" class="left" name="in102"></td>
				<td>14/10,000</td>
				<td><input type="text" id="v102" class="right" name="v102"></td>
			</tr>
			
			<tr>
				<td colspan="2" rowspan="2">일반무신고</td>
				<td>무신고납부세액</td>
				<td><input type="text" id="in103" class="left" name="in103"></td>
				<td>20/100</td>
				<td><input type="text" id="v103"  class="right" name="v103"></td>
			</tr>
			
			<tr>
				<td>수입금액</td>
				<td><input type="text" id="in104" class="left" name="in104"></td>
				<td>7/10,000</td>
				<td><input type="text" id="v104" class="right" name="v104"></td>
			</tr>
			
			<tr>
				<td rowspan="3">(2) 과소신고</td>
				<td rowspan="2" colspan="2">부정과서신고</td>
				<td>과소신고납부세액</td>
				<td><input type="text" id="in201" class="left" name="in201"></td>
				<td>40/100</td>
				<td><input type="text" id="v201" class="right" name="v201"></td>
			</tr>
			
			<tr>
				<td>수입금액</td>
				<td><input type="text" id="in202" class="left" name="in202"></td>
				<td>14/10,000</td>
				<td><input type="text" id="v202" class="right" name="v202"></td>
			</tr>
			
			<tr>
				<td colspan="2">일반과소신고</td>
				<td>과소신고납부세액</td>
				<td><input type="text" id="in203" class="left" name="in203"></td>
				<td>10/100</td>
				<td><input type="text" id="v203" class="right" name="v203"></td>
			</tr>
			
			<tr>
				<td rowspan="2" colspan="2">(3) 납부(환급)불성실</td>
				<td colspan="2" >미납일수</td>
				<td><input type="text" id="in301" class="left" name="in301"></td>
				<td rowspan="2">2.5/10,000</td>
				<td><input type="text" id="v301" class="right" name="v301"></td>
			</tr>
			
			<tr>
				<td colspan="2">미납부(환급)세액</td>
				<td><input type="text" id="in302" class="left" name="in302"></td>
				<td><input type="text" id="v302" class="right" name="v302"></td>
			</tr>
			
			
			
			<tr>
				<td rowspan="13">(4) 보고불성실</td>
				<td rowspan="2">지급명세서</td>
				<td>미제출(불명)</td>
				<td>지급(불명)금액</td>
				<td><input type="text" id="in401" class="left" name="in401"></td>
				<td>1/100</td>
				<td><input type="text" id="v401" class="right" name="v401"></td>
			</tr>
			
			<tr>
				<td>지연 제출</td>
				<td>지연 제출 금액</td>
				<td><input type="text" id="in402" class="left" name="in402"></td>
				<td>0.5/100</td>
				<td><input type="text" id="v402" class="right" name="v402"></td>
			</tr>
			
			<tr>
				<td rowspan="6">계산서</td>
				<td>미발급(위장)</td>
				<td>공급가액</td>
				<td><input type="text" id="in403" class="left" name="in403"></td>
				<td>2/100</td>
				<td><input type="text" id="v403" class="right" name="v403"></td>
			</tr>
			
			<tr>
				<td>지연발급</td>
				<td>공급가액</td>
				<td><input type="text" id="in404" class="left" name="in404"></td>
				<td>2/100</td>
				<td><input type="text" id="v404" class="right" name="v404"></td>
			</tr>
			
			<tr>
				<td>불명</td>
				<td>불명금액</td>
				<td><input type="text" id="in405" class="left" name="in405"></td>
				<td>1/100</td>
				<td><input type="text" id="v405" class="right" name="v405"></td>
			</tr>
			
			<tr>
				<td>전자계산서 외 발급</td>
				<td>공급가액</td>
				<td><input type="text" id="in406" class="left" name="in406"></td>
				<td>1/100</td>
				<td><input type="text" id="v406" class="right" name="v406"></td>
			</tr>
			
			<tr>
				<td>전자계산서 미전송</td>
				<td>공급가액</td>
				<td><input type="text" id="in407" class="left" name="in407"></td>
				<td> - </td>
				<td><input type="text" id="v407" class="right" name="v407"></td>
			</tr>
			
			<tr>
				<td>전자계산서 지연전송</td>
				<td>지연 전송 금액</td>
				<td><input type="text" id="in408" class="left" name="in408"></td>
				<td> - </td>
				<td><input type="text" id="v408" class="right" name="v408"></td>
			</tr>
			
			<tr>
				<td rowspan="2">계산서합계표</td>
				<td>미제출(불명)</td>
				<td>공급(불명)가액</td>
				<td><input type="text" id="in409" class="left" name="in409"></td>
				<td>0.5/100</td>
				<td><input type="text" id="v409" class="right" name="v409"></td>
			</tr>
			
			<tr>
				<td>지연 제출</td>
				<td>지연 제출 금액</td>
				<td><input type="text" id="in410" class="left" name="in410"></td>
				<td>0.3/100</td>
				<td><input type="text" id="v410" class="right" name="v410"></td>
			</tr>
			
			<tr>
				<td rowspan="2">매입처별세금<br>계산서합계표</td>
				<td>미제출(불명)</td>
				<td>공급(불명)가액</td>
				<td><input type="text" id="in411" class="left" name="in411"></td>
				<td>1/100</td>
				<td><input type="text" id="v411" class="right" name="v411"></td>
			</tr>
			
			<tr>
				<td>지연 제출</td>
				<td>지연 제출 금액</td>
				<td><input type="text" id="in412" class="left" name="in412"></td>
				<td>0.3/100</td>
				<td><input type="text" id="v412" class="right" name="v412"></td>
			</tr>
			
			<tr>
				<td colspan="3">소계</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			
			<tr>
				<td rowspan="2">(5) 증빙불비</td>
				<td colspan="2">미수취</td>
				<td>미 수취 금액</td>
				<td><input type="text" id="in501" class="left" name="in501"></td>
				<td>2/100</td>
				<td><input type="text" id="v501" class="right" name="v501"></td>
			</tr>
			
			<tr>
				<td colspan="2">허위수취</td>
				<td>허위 수취 금액</td>
				<td><input type="text" id="in502" class="left" name="in502"></td>
				<td>2/100</td>
				<td><input type="text" id="v502" class="right" name="v502"></td>
			</tr>
			
			<tr>
				<td rowspan="2">(6) 영수증 수취<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명세서미제출</td>
				<td colspan="2">미제출</td>
				<td>미제출금액</td>
				<td><input type="text" id="in601" class="left" name="in601"></td>
				<td>1/100</td>
				<td><input type="text" id="v601" class="right" name="v601"></td>
			</tr>
			
			<tr>
				<td colspan="2">불명</td>
				<td>불명금액</td>
				<td><input type="text" id="in602" class="left" name="in602"></td>
				<td>1/100</td>
				<td><input type="text" id="v602" class="right" name="v602"></td>
			</tr>
			
			<tr>
				<td rowspan="2">(7) 사업장현황<br>신고불성실</td>
				<td colspan="2">무신고</td>
				<td>수입금액</td>
				<td><input type="text" id="in701" class="left" name="in701"></td>
				<td>0.5/100</td>
				<td><input type="text" id="v701" class="right" name="v701"></td>
			</tr>
			
			<tr>
				<td colspan="2">과소신고</td>
				<td>수입금액</td>
				<td><input type="text" id="in702" class="left" name="in702"></td>
				<td>0.5/100</td>
				<td><input type="text" id="v702" class="right" name="v702"></td>
			</tr>
			
			<tr>
				<td rowspan="2">(8) 공동사업장<br>등록불성실</td>
				<td colspan="2">미등록/허위등록</td>
				<td>총 수입금액</td>
				<td><input type="text" id="in801" class="left" name="in801"></td>
				<td>0.5/100</td>
				<td><input type="text" id="v801" class="right" name="v801"></td>
			</tr>
			
			<tr>
				<td colspan="2">손익분배비율 허위신고 등</td>
				<td>총 수입금액</td>
				<td><input type="text" id="in802" class="left" name="in802"></td>
				<td>0.1/100</td>
				<td><input type="text" id="v802" class="right" name="v802"></td>
			</tr>
			
			<tr>
				<td colspan="3">(9) 무기장</td>
				<td>산출세액</td>
				<td><input type="text" id="in901" class="left" name="in901"></td>
				<td>20/100</td>
				<td><input type="text" id="v901" class="right" name="v901"></td>
			</tr>
			
			<tr>
				<td rowspan="2">(10) 사업용계좌<br>미신고 등</td>
				<td colspan="2">미개설/미신고</td>
				<td>수입금액 등</td>
				<td><input type="text" id="in1001" class="left" name="in1001"></td>
				<td>0.2/100</td>
				<td><input type="text" id="v1001" class="right" name="v1001"></td>
			</tr>
			
			<tr>
				<td colspan="2">미사용</td>
				<td>미사용 금액</td>
				<td><input type="text" id="in1002" class="left" name="in1002"></td>
				<td>0.2/100</td>
				<td><input type="text" id="v1002" class="right" name="v1002"></td>
			</tr>
			
			<tr>
				<td rowspan="3">(11) 신용카드거부</td>
				<td colspan="3">거래거부/불성실금액</td>
				<td><input type="text" id="in1101" class="left" name="in1101"></td>
				<td>5/100</td>
				<td><input type="text" id="v1101" class="right" name="v1101"></td>
			</tr>
			
			<tr>
				<td colspan="3">거래거부/불성실건수</td>
				<td><input type="text" id="in1102" class="left" name="in1102"></td>
				<td>5,000원</td>
				<td><input type="text" id="v1102" class="right" name="v1102"></td>
			</tr>
			
			<tr>
				<td colspan="2">위장가공</td>
				<td>발급수취금액</td>
				<td><input type="text" id="in1103" class="left" name="in1103"></td>
				<td>2/100</td>
				<td><input type="text" id="v1103" class="right" name="v1103"></td>
			</tr>
			
			<tr>
				<td rowspan="5">(12) 현금영수증<br>미발급</td>
				<td colspan="2">미가맹</td>
				<td>수입금액</td>
				<td><input type="text" id="in1201" class="left" name="in1201"></td>
				<td>1/100</td>
				<td><input type="text" id="v1201" class="right" name="v1201"></td>
			</tr>
			
			<tr>
				<td colspan="3">미발급/불성실금액</td>
				<td><input type="text" id="in1202" class="left" name="in1202"></td>
				<td>5/100</td>
				<td><input type="text" id="v1202" class="right" name="v1202"></td>
			</tr>
			
			<tr>
				<td colspan="3">미발급/불성실건수</td>
				<td><input type="text" id="in1203" class="left" name="in1203"></td>
				<td>5,000원</td>
				<td><input type="text" id="v1203" class="right" name="v1203"></td>
			</tr>
			
			<tr>
				<td colspan="2">위장가공</td>
				<td>발급수취금액</td>
				<td><input type="text" id="in1204" class="left" name="in1204"></td>
				<td>2/100</td>
				<td><input type="text" id="v1204" class="right" name="v1204"></td>
			</tr>
			
			<tr>
				<td colspan="3">미발급금액(2019귀속부터적용)</td>
				<td><input type="text" id="in1205" class="left" name="in1205"></td>
				<td>20/100</td>
				<td><input type="text" id="v1205" class="right" name="v1205"></td>
			</tr>
			
			<tr>
				<td rowspan="2">(13) 기부금영수증<br>불성실</td>
				<td colspan="2">영수증 불성실발급</td>
				<td>불성실기재금액</td>
				<td><input type="text" id="in1301" class="left" name="in1301"></td>
				<td>2/100</td>
				<td><input type="text" id="v1301" class="right" name="v1301"></td>
			</tr>
			
			<tr>
				<td colspan="2">발급명세서 미작성/미보관</td>
				<td>미작성 등 금액</td>
				<td><input type="text" id="in1302" class="left" name="in1302"></td>
				<td>0.2/100</td>
				<td><input type="text" id="v1302" class="right" name="v1302"></td>
			</tr>
			
			<tr>
				<td colspan="4">(14) 동업기업 배분 가산세</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			
			<tr>
				<td colspan="3">(15) 성실신고확인서 미제출 가산세</td>
				<td>산출세액</td>
				<td><input type="text" id="in1501" class="left" name="in1501"></td>
				<td>5/100</td>
				<td><input type="text" id="v1501" class="right" name="v1501"></td>
			</tr>
			
			<tr>
				<td colspan="3">(16) 유보소득계산명세서 제출 불성실 가산세</td>
				<td>배당가능 유보소득금액</td>
				<td><input type="text" id="in1601" class="left" name="in1601"></td>
				<td>0.5/100</td>
				<td><input type="text" id="v1601" class="right" name="v1601"></td>
			</tr>
			
			<tr>
				<td colspan="4">16. 합계</td>
				<td><input type="text" id="in1602" name="sumLeft"></td>
				<td></td>
				<td><input type="text" id="v1602" name="sumRight"></td>
			</tr>
			
		
		
		
		</table>
		
		</form><!-- 포스트로 보내는 태그 -->
		
	
		<script>
			/* 세율 적용해서 계산하는 스크립트 */
				$(function(){
				
					$("#in101").keyup(function(key){
						if(key.keyCode == 13){
							/* 계산 해서 v에 넣어줌 */
							$("#v101").val($("#in101").val()*40/100);
							/* 다음 인풋으로 이동 */
							$("#in102").focus();
						}
					});
					
					/* 반복 */
					
					$("#in102").keyup(function(key){
						if(key.keyCode == 13){
							$("#v102").val($("#in102").val()*14/10000);
							$("#in103").focus();
						}
					});
					
					$("#in103").keyup(function(key){
						if(key.keyCode == 13){
							$("#v103").val($("#in103").val()*20/100);
							$("#in104").focus();
						}
					});
					
					$("#in104").keyup(function(key){
						if(key.keyCode == 13){
							$("#v104").val($("#in104").val()*7/10000);
							$("#in201").focus();
						}
					});
					
					$("#in201").keyup(function(key){
						if(key.keyCode == 13){
							$("#v201").val($("#in201").val()*40/100);
							$("#in202").focus();
						}
					});
					
					$("#in202").keyup(function(key){
						if(key.keyCode == 13){
							$("#v202").val($("#in202").val()*14/10000);
							$("#in203").focus();
						}
					});
					
					$("#in203").keyup(function(key){
						if(key.keyCode == 13){
							$("#v203").val($("#in203").val()*10/100);
							$("#in301").focus();
						}
					});
					
					$("#in301").keyup(function(key){
						if(key.keyCode == 13){
							$("#v301").val($("#in301").val()*2.5/10000);
							$("#in302").focus();
						}
					});
					
					$("#in302").keyup(function(key){
						if(key.keyCode == 13){
							$("#v302").val($("#in302").val()*2.5/10000);
							$("#in401").focus();
						}
					});
					
					$("#in401").keyup(function(key){
						if(key.keyCode == 13){
							$("#v401").val($("#in401").val()*1/100);
							$("#in402").focus();
						}
					});
					
					$("#in402").keyup(function(key){
						if(key.keyCode == 13){
							$("#v402").val($("#in402").val()*0.5/100);
							$("#in403").focus();
						}
					});
					
					$("#in403").keyup(function(key){
						if(key.keyCode == 13){
							$("#v403").val($("#in403").val()*2/100);
							$("#in404").focus();
						}
					});
					
					$("#in404").keyup(function(key){
						if(key.keyCode == 13){
							$("#v404").val($("#in404").val()*2/100);
							$("#in405").focus();
						}
					});
					
					$("#in405").keyup(function(key){
						if(key.keyCode == 13){
							$("#v405").val($("#in405").val()*1/100);
							$("#in406").focus();
						}
					});
					
					$("#in406").keyup(function(key){
						if(key.keyCode == 13){
							$("#v406").val($("#in406").val()*1/100);
							$("#in407").focus();
						}
					});
					
					$("#in407").keyup(function(key){
						if(key.keyCode == 13){
							$("#v407").val($("#in407").val());
							$("#in408").focus();
						}
					});
					
					$("#in408").keyup(function(key){
						if(key.keyCode == 13){
							$("#v408").val($("#in408").val());
							$("#in409").focus();
						}
					});
					
					$("#in409").keyup(function(key){
						if(key.keyCode == 13){
							$("#v409").val($("#in409").val()*0.5/100);
							$("#in410").focus();
						}
					});
					
					$("#in410").keyup(function(key){
						if(key.keyCode == 13){                                                                                                                                                                                                                                                                                                                        
							$("#v410").val($("#in410").val()*0.3/100);
							$("#in411").focus();
						}
					});
					
					$("#in411").keyup(function(key){
						if(key.keyCode == 13){
							$("#v411").val($("#in411").val()*1/100);
							$("#in412").focus();
						}
					});
					
					$("#in412").keyup(function(key){
						if(key.keyCode == 13){
							$("#v412").val($("#in412").val()*0.3/100);
							$("#in501").focus();
						}
					});
					
					$("#in501").keyup(function(key){
						if(key.keyCode == 13){
							$("#v501").val($("#in501").val()*2/100);
							$("#in502").focus();
						}
					});
					
					$("#in502").keyup(function(key){
						if(key.keyCode == 13){
							$("#v502").val($("#in502").val()*2/100);
							$("#in601").focus();
						}
					});
					
					$("#in601").keyup(function(key){
						if(key.keyCode == 13){
							$("#v601").val($("#in601").val()*1/100);
							$("#in602").focus();
						}
					});
					
					$("#in602").keyup(function(key){
						if(key.keyCode == 13){
							$("#v602").val($("#in602").val()*1/100);
							$("#in701").focus();
						}
					});
					
					$("#in701").keyup(function(key){
						if(key.keyCode == 13){
							$("#v701").val($("#in701").val()*0.5/100);
							$("#in702").focus();
						}
					});
					
					$("#in702").keyup(function(key){
						if(key.keyCode == 13){
							$("#v702").val($("#in702").val()*0.5/100);
							$("#in801").focus();
						}
					});
					
					$("#in801").keyup(function(key){
						if(key.keyCode == 13){
							$("#v801").val($("#in801").val()*0.5/100);
							$("#in802").focus();
						}
					});
					
					$("#in802").keyup(function(key){
						if(key.keyCode == 13){
							$("#v802").val($("#in802").val()*0.1/100);
							$("#in901").focus();
						}
					});
					
					$("#in901").keyup(function(key){
						if(key.keyCode == 13){
							$("#v901").val($("#in901").val()*20/100);
							$("#in1001").focus();
						}
					});
					
					$("#in1001").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1001").val($("#in1001").val()*0.2/100);
							$("#in1002").focus();
						}
					});
					
					$("#in1002").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1002").val($("#in1002").val()*0.2/100);
							$("#in1101").focus();
						}
					});
					
					$("#in1101").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1101").val($("#in1101").val()*5/100);
							$("#in1102").focus();
						}
					});
					
					$("#in1102").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1102").val($("#in1102").val()*5000);
							$("#in1103").focus();
						}
					});
					
					$("#in1103").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1103").val($("#in1103").val()*2/100);
							$("#in1201").focus();
						}
					});
					
					
					$("#in1201").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1201").val($("#in1201").val()*1/100);
							$("#in1202").focus();
						}
					});
					
					$("#in1202").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1202").val($("#in1202").val()*5/100);
							$("#in1203").focus();
						}
					});
					
					$("#in1203").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1203").val($("#in1203").val()*5000);
							$("#in1204").focus();
						}
					});
					
					$("#in1204").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1204").val($("#in1204").val()*2/100);
							$("#in1205").focus();
						}
					});
					
					$("#in1205").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1205").val($("#in1205").val()*20/100);
							$("#in1301").focus();
						}
					});
					
					$("#in1301").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1301").val($("#in1301").val()*2/100);
							$("#in1302").focus();
						}
					});
					
					$("#in1302").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1302").val($("#in1302").val()*0.2/100);
							$("#in1501").focus();
						}
					});
					
					$("#in1501").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1501").val($("#in1501").val()*5/100);
							$("#in1601").focus();
						}
					});
					
					$("#in1601").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1601").val($("#in1601").val()*0.5/100);
							$("#in1602").focus();
						}
					});
					
					/* $("#in1602").keyup(function(key){
						if(key.keyCode == 13){
							$("#v1602").val($("#in1602").val()*1/100);
							
						}
					}); */
					
					
				});
			
		</script>
		
		
		
		
		
		
		<script>
		/* 합계 */
		let leftSum = Number(0);
		let rightSum = Number(0);
		
		window.onkeyup = function(key){
			if(key.keyCode == 13){
				
				//왼쪽
				leftSum = 0;
				var left = $(".left");

				console.log(leftSum);
				for(var i = 0; i < left.length; i++ ){
					leftSum += Number(left[i].value);
				}
				$("#in1602").val(leftSum);
				
				//오른쪽
				rightSum = 0;
				var right = $(".right");

				console.log(rightSum);
				for(var i = 0; i < right.length; i++ ){
					rightSum += Number(right[i].value);
				}
				$("#v1602").val(Math.floor(rightSum / 10) * 10);
				
				
				/* 오른쪽 인풋태그 원단위 절삭 */
				for(var i = 0; i < right.length; i++){
					right[i].value = (Math.floor(right[i].value/10))*10;
				}
				$("#v1602").val() / 10 * 10;
				
				
				
			}//if : keyCode == 13
		}//function
		
		
		</script>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			
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