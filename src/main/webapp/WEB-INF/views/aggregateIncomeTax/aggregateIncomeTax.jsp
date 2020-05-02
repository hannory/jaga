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
		border-spacing: 2px;
		border-collapse: separate;
		text-align:center;
	}
	.table-center td:nth-last-child(1),
	.table-center td:nth-last-child(2),
	.table-center td:nth-last-child(3){
		border-bottom:1px solid black;
	}
	
	.cursorPointer:hover{
		background:gray;
		color:white;
		opacity:50%;
		cursor:pointer;
	}
	
	
	
	
	
	
</style>
</head>
<body>


   
   <!-- zzzzzzzzzzz -->
		<h1 id="testTag" onclick="testTagFunc();">zzz</h1>
		<script>
		function testTagFunc(){
			var tempList = '${ bizCodeArray }';
			var bizCodeArray = new Array(JSON.parse('${ bizCodeArray }'))[0];
			console.log(bizCodeArray[0]);
			console.log(bizCodeArray[1]);
			console.log(bizCodeArray[2]);
		}
		</script>
	<!-- zzzzzzzzzzzzzz -->
		
		<!-- 업종 검색 모달영역 -->
		
		<div style="width:100%; height:100%; background-color:rgba(125, 125, 125, 0.5); overflow:auto;">
			
			<div style="width:800px; height:600px; background:white; margin:auto; margin-top:50px;">
				<div style="background:#24574A; color:white; width:100%; height:10%;">
					<h4 style="margin:auto; margin-left:50px; text-align:center; width:80%; line-height:50px; display:inline-block;">소득금액</h4>
					<div style="display:inline-block; width:30px; height:30px; text-align:center; background:white; color:black; border-radius:30px; float:right; margin-top:15px; margin-right:10px;">X</div>
				</div>
				<div style="width:100%; height:100%;"><!-- div for scroll -->
						<div style="overflow: auto; width:80%; height:500px; margin:0 auto; margin-top:30px; border:1px solid black;">
				<table border="1" id="tableSearchBiz" style="width:100%; text-align:center;">
					<tr>
						<td style="background:#24574A; color:white;"><span>검색</span></td>
						<td colspan="2"><input style="width:90%; margin-left:-10px; border-right:1px solid black;" type="text" id="inputSearchBiz"><div style="display:inline-block;"><img style="width:20px; height:20px; margin-left:15px;" src="${contextPath}/resources/images/search.PNG"></div></td>
					</tr>
					<tr id="trSearchBizSubject" style="background:#24574A; color:white;">
						<td style="width:20%">업종코드</td>
						<td style="width:40%">업태명</td>
						<td style="width:40%">종목명</td>
					</tr>
					
					<c:if test="${ bizCodeArray ne null }">
						<c:forEach var="target" items="${ bizCodeArray }">
							<tr class="cursorPointer trBizCode" onclick="trSearchBizClick(this);">
								<td><input type="hidden" class="BizPkCode" value="${ target.tobcPkCode }">${ target.typeOfBizCode }</td>
								<td>${ target.sellWayName }</td>
								<td>${ target.sellTargetName }</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
						</div>
				</div><!-- div for scroll -->
			</div>
			
		</div>
		
		<script>
		function trSearchBizClick(tr){
			console.log(tr);
		}
		
		window.onload = function(){
			var bizCodeArray = new Array(JSON.parse('${ bizCodeArray }'))[0];
			
			$("#inputSearchBiz").keyup(function(){
				
				if($("#inputSearchBiz").val() == ""){
					console.log("zzz 빈칸임");
					
				}else{
					console.log("zzz 빈칸아님 ㅎzz");
					var tempStr = ""; 
					
					for(var i = 0; i < bizCodeArray.length; i++ ){
						
						if( bizCodeArray[i].sellWayName.includes($("#inputSearchBiz").val()) || bizCodeArray[i].typeOfBizCode.includes($("#inputSearchBiz").val()) ||bizCodeArray[i].sellTargetName.includes($("#inputSearchBiz").val()) ){
							console.log(bizCodeArray[i].sellWayName);
							
							
							tempStr += "<td>" + bizCodeArray[i].typeOfBizCode + "</td>";
							tempStr += "<td>" + bizCodeArray[i].sellWayName + "</td>";
							tempStr += "<td>" + bizCodeArray[i].sellTargetName + "</td>";
							
							
						}
						
						
					}//for

					$("#trSearchBizSubject").after(
					"<tr class='cursorPointer trBizCode' onclick='trSearchBizClick(this);'>" + tempStr + "</tr>"		
					);
					
					
				}
				
				
			});
		}
		</script>


		<!-- 업종 검색 모달영역 끝 -->
		


	

	<jsp:include page="../common/menubar.jsp" />
	<main>
	<div class="container-fluid">
	<!-- 작업영역 -->
	
	<!-- 로딩화면 -->
   <div id="loading">
        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
    </div>
   <!-- 로딩화면 끝-->
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
	
		<h2 class="mt-4">종합소득세</h2>
		
		
		
		<!-- 귀속년도 -->
		<div style="float:right;">
			<label>귀속년도 : </label>
			<input id="attrYear" type="text" style="border-bottom:1px solid black;">
			<label>년</label>
		</div>
		
		<script>
		/* 귀속년도 받아온 값으로 바꿔줌 */
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
			<div class="cursorPointer" style="display:inline-block; background:#24574A; border-radius:5px; width:50px; height:30px; text-align:center; line-height:30px;color:white;">저장</div>
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
					<td style="width:5%;"><input type="text" id="inputReportType" name=""></td>
					<td onclick="reportTypeClick(1)"style="width:18%;" class="cursorPointer">1. 자기조정</td>
					<td onclick="reportTypeClick(2)" class="cursorPointer">2. 간편장부</td>
					<td onclick="reportTypeClick(3)" class="cursorPointer">3. 추계 - 기준</td>
					<td onclick="reportTypeClick(4)" class="cursorPointer">4. 추계 - 단순</td>
					<td onclick="reportTypeClick(5)" style="width:15%;" class="cursorPointer">5. 성실신고확인</td>
				</tr>
				
				<script>
				 function reportTypeClick(value){
					 $("#inputReportType").val(value);
				 }
				</script>
				
				<tr>
					<td><span>기장<br>의무</span></td>
					<td><input type="text" id="inputMilletDuty" name=""></td>
					<td onclick="milletDutyClick(1)" class="cursorPointer">1. 복식부기의무자</td>
					<td onclick="milletDutyClick(2)" class="cursorPointer">2. 간편장부대상자</td>
					<td onclick="milletDutyClick(3)" class="cursorPointer">3. 비사업자</td>
					<td style="border-bottom:1px solid white;"></td>
					<td style="border-left:1px solid white; border-right:1px solid white; border-bottom:1px solid white;"><button onclick="">소득금액명세추가</button></td>
				</tr>
				<script>
				function milletDutyClick(value){
					$("#inputMilletDuty").val(value);
				}
				</script>
			</table>
		</div>
		<!-- 상단 테이블 감싸는 div 끝 -->
		
		<!-- 본문 테이블 감싸는 div -->
		<div class="div-tableCenter" style="margin-top:30px; margin-bottom:30px;">
		<table class="table-center">
			<tr>
				<td>소득 구분 코드</td>
				<td><input type="text" id="v101" name="v101"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="v201" name="v201"></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>신고 유형 코드</td>
				<td><input type="text" id="v102" name="v102"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name=""></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>상호 또는 법인명</td>
				<td><input type="text" id="v103" name="v103"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>사업자 등록번호</td>
				<td><input type="text" id="v104" name="v104"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>주민등록번호</td>
				<td><input type="text" id="v105" name="v105"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>기장의무</td>
				<td><input type="text" id="v106" name="v106"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>주업종코드</td>
				<td><input type="text" id="v107" name="v107"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>총수입금액</td>
				<td><input type="text" id="v108" name="v108"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>필요경비</td>
				<td><input type="text" id="v109" name="v109"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>소득금액</td>
				<td><input type="text" id="v110" name="v110"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>원천징수액 - 소득세</td>
				<td><input type="text" id="v111" name="v111"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>이월결손금 공제 여부</td>
				<td><input type="text" id="v112" name="v112"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>공동사업장 여부</td>
				<td><input type="text" id="v113" name="v113"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>최저한세적용대상 소득</td>
				<td><input type="text" id="v114" name="v114"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>과세기간 시작일</td>
				<td><input type="text" id="v115" name="v115"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>과세기간 종료일</td>
				<td><input type="text" id="v116" name="v116"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>소재지</td>
				<td><input type="text" id="v117" name="v117"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>국내여부</td>
				<td><input type="text" id="v118" name="v118"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="" name="" ></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
		</table>
		</div>
		<!-- //본문 테이블 감싸는 div 끝-->
		
		
		
		
		
		<script>
		/* 값 입력 시 다음 칼럼 보이게 함 */
			$(function(){
				$("#v101").change(function(){
					$(".td02").each(function(index, item){
						item.style.display = "inline-block";
					});
				});
			})
			
			$(function(){
				$("#v201").change(function(){
					$(".td03").each(function(index, item){
						item.style.display = "inline-block";
					});
				});
			})
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




