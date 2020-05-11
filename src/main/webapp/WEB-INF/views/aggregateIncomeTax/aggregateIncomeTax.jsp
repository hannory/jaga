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
	
	/* 
	.inputNumber{
		text-align:right;
	} 
	*/


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


		
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 업종 검색 모달영역 , modal @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		
		<div id="modalSearchBizCode" style="position:fixed; width:100%; height:100%; z-index:99; background-color:rgba(125, 125, 125, 0.5); overflow:auto; display:none;">
			
			<div style="width:800px; height:600px; background:white; margin:auto; margin-top:50px;">
				<div style="background:#24574A; color:white; width:100%; height:10%;">
					<h4 style="margin:auto; margin-left:50px; text-align:center; width:80%; line-height:50px; display:inline-block;">소득금액</h4>
					<div onclick="closeModalSearchBiz();" class="cursorPointer" style="display:inline-block; width:30px; height:30px; text-align:center; background:white; color:black; border-radius:30px; float:right; margin-top:15px; margin-right:10px;">X</div>
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
								<td><input type="hidden" class="BizPkCode" value="${ target.tobcPkCode }"><span>${ target.typeOfBizCode }</span></td>
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
		
		/* 모달 검색 결과 행 클릭 시  값 넣기 */
		function trSearchBizClick(tr){
			var bizCodePk = tr.childNodes[1].childNodes[0].value;		//input 태그의 value //프라이머리 키
			var bizCode = tr.childNodes[1].childNodes[1].innerText;	//span 태그의 text // 업종코드(사용자노출되는 값)
			
			$("#v107").val(bizCodePk);
			$("#v107dp").val(bizCode);
			
			closeModalSearchBiz();
			
		};
		</script>


		
		<script>
		/* 모달 검색 스크립트 */
		window.onload = function(){
			
			alert("모달 검색 스크립트 와드");
			
			var bizCodeArray = new Array(JSON.parse('${ bizCodeArray }'))[0];
			
			$("#inputSearchBiz").keyup(function(){
				
				if($("#inputSearchBiz").val() == ""){
					console.log("zzz 빈칸임");
					
				}else{
					console.log("zzz 빈칸아님 ㅎzz");
					var bizSearchResult = ""; 
					
					for(var i = 0; i < bizCodeArray.length; i++ ){
						
						if( bizCodeArray[i].sellWayName.includes($("#inputSearchBiz").val()) || bizCodeArray[i].typeOfBizCode.includes($("#inputSearchBiz").val()) ||bizCodeArray[i].sellTargetName.includes($("#inputSearchBiz").val()) ){
							
							bizSearchResult += "<tr class='trBizCode'>";
							bizSearchResult += "<td>" + bizCodeArray[i].typeOfBizCode + "</td>";
							bizSearchResult += "<td>" + bizCodeArray[i].sellWayName + "</td>";
							bizSearchResult += "<td>" + bizCodeArray[i].sellTargetName + "</td>";
							bizSearchResult += "</tr>";
							
						}
						
						
					}//for

					$(".trBizCode").remove();
					$("#trSearchBizSubject").after(
							bizSearchResult
					);
					
					
				}
				
				
			});
		}
		</script>
		
		

		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 업종 검색 모달영역 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
		


	

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
		
	
		
		
		<form id="tagForm" action="insertIncomeAmount.aggregate" method="post" onsubmit="return checksubmit();">
		
		<input type="hidden" name="comCode" value="${ loginCompany.companyCode  }">
		
		<script>
		submitFlag = 0;
		function checksubmit(){
			if(submitFlag == 0){
				 Swal.fire({
					   title: '귀속년도를 입력해주세요',
					   icon: 'info',
					   showCancelButton: false,
					   confirmButtonColor: '#24574A',
					   cancelButtonColor: '#d33',
					   confirmButtonText: '확인'
					 })
					   
				return false;
			}else{
				return true;
			}
		}
		</script>
		
		<!-- 귀속년도 -->
		<div style="float:right;">
			<label>귀속년도 : </label>
			<input id="attrYear" name="yearOfAttr" type="number" style="width:60px; border-bottom:1px solid black;">
			<label>년</label>
			<div onclick="selectStmt();" class="cursorPointer" style="padding:5px; display:inline-block; background:#24574A; color:white; border-radius:5px;">조회</div>
		</div>
		
		<script>
			function selectStmt(){
				alert("조회버튼클릭");
				
			}
		</script>
		<!-- //귀속년도 -->
		
		<div style="height:50px;"></div><!-- 간격 띄우기 위한 용도 -->
		
		<div class="div-top4menuWrapper">
			<div class="div-top4menu" style="border-bottom: 3px solid #24574A"><h5>소득금액명세서</h5></div>
			<div class="div-top4menu" onclick="goIncomeDeductStmt();"><h5>소득공제명세서</h5></div>
			<div class="div-top4menu" onclick="goAddedTaxStmt();"><h5>가산세명세서</h5></div>
			<div class="div-top4menu" onclick="goAggregateCalculated();"><h5>종합소득세액계산서</h5></div>
			<div onclick="doSubmit();" class="cursorPointer" style="display:inline-block; background:#24574A; border-radius:5px; width:50px; height:30px; text-align:center; line-height:30px;color:white;">저장</div>
		</div>
		<!-- //class="div-top4menu" -->
		
		<script>
		function doSubmit(){
			
			if( Number($("#attrYear").val()) > 1900){
				submitFlag = 1;
			}else{
				console.log("else 블럭 진입..서브밋 안될거임");
			}
			
			$("#tagForm").submit();
		}
		</script>
		
		
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
					<td style="width:5%;"><input type="text" id="inputReportType" name="type" value="1"></td>
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
					<td><input type="text" id="inputMilletDuty" name="duty" value="1"></td>
					<td onclick="milletDutyClick(1)" class="cursorPointer">1. 복식부기의무자</td>
					<td onclick="milletDutyClick(2)" class="cursorPointer">2. 간편장부대상자</td>
					<td onclick="milletDutyClick(3)" class="cursorPointer">3. 비사업자</td>
					<td style="border-bottom:1px solid white; border-right:1px solid white;"></td>
					<!-- <td style="border-left:1px solid white; border-right:1px solid white; border-bottom:1px solid white;"><button onclick="">소득금액명세추가</button></td> -->
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
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="v301" name="v301"></td>
			</tr>
			<!-- <tr>
				<td>신고 유형 코드</td>
				<td><input type="text" id="v102" name="v102"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="v202" name="v202"></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr> -->
			<tr>
				<td>상호 또는 법인명</td>
				<td><input type="text" id="v103" name="v103"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="v203" name="v203"></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>사업자 등록번호</td>
				<td><input type="text" id="v104" name="v104"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="v204" name="v204"></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>주민등록번호</td>
				<td><input type="text" id="v105" name="v105"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="v205" name="v205"></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<!-- <tr>
				<td>기장의무</td>
				<td><input type="text" id="v106" name="v106"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="v206" name="v206"></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr> -->
			<tr>
				<td>주업종코드</td>
				<td><input type="hidden" id="v107" name="v107"><input type="text" id="v107dp"></td><!-- 보여주는거랑 들어가는거랑 값 다름 -->
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="v207" name="v207"></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>총수입금액</td>
				<td><input class="inputNumber" "type="text" id="v108" name="v108"></td>
				<td class="td02 inputNumber" style="display:none; margin-left:8px;"><input type="text" id="v208" name="v208"></td>
				<td class="td03 inputNumber" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>필요경비</td>
				<td><input class="inputNumber" type="text" id="v109" name="v109"></td>
				<td class="td02 inputNumber" style="display:none; margin-left:8px;"><input type="text" id="v209" name="v209"></td>
				<td class="td03 inputNumber" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>소득금액</td>
				<td><input class="inputNumber" type="text" id="v110" name="v110"></td>
				<td class="td02 inputNumber" style="display:none; margin-left:8px;"><input type="text" id="v210" name="v210"></td>
				<td class="td03 inputNumber" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>원천징수액 - 소득세</td>
				<td><input class="inputNumber" type="text" id="v111" name="v111"></td>
				<td class="td02 inputNumber" style="display:none; margin-left:8px;"><input type="text" id="v211" name="v211"></td>
				<td class="td03 inputNumber" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>이월결손금 공제 여부</td>
				<td><input type="text" id="v112" name="v112"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="v212" name="v212"></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>공동사업장 여부</td>
				<td><input type="text" id="v113" name="v113"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="v213" name="v213"></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<!-- <tr>
				<td>최저한세적용대상 소득</td>
				<td><input type="text" id="v114" name="v114"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="v214" name="v214"></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr> -->
			<!-- <tr>
				<td>과세기간 시작일</td>
				<td><input type="date" id="v115" name="v115"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="v215" name="v215"></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>과세기간 종료일</td>
				<td><input type="date" id="v116" name="v116"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="v216" name="v216"></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr> -->
			<!-- <tr>
				<td>소재지</td>
				<td><input type="text" id="v117" name="v117"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="v217" name="v217"></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr>
			<tr>
				<td>국내여부</td>
				<td><input type="text" id="v118" name="v118"></td>
				<td class="td02" style="display:none; margin-left:8px;"><input type="text" id="v218" name="v218"></td>
				<td class="td03" style="display:none; margin-left:10px;"><input type="text" id="" name="" class="td03"></td>
			</tr> -->
		</table>
		</div>
		<!-- //본문 테이블 감싸는 div 끝-->
		</form>
		
		
		
		
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
		
		
		
		
		 
		<!-- 
		if($("#v101").val() == '40'){
					//사업소득(40) 일 경우
					$("#v102").val('-');
					$("#v102").prop('readonly',true);
					
					$("#v103").val('-');
					$("#v103").prop('readonly',true);
					
					$("#v104").val('-');
					$("#v104").prop('readonly',true);
					
					/* $("#v105").val('-');
					$("#v105").prop('readonly',true); */
					
					$("#v106").val('-');
					$("#v106").prop('readonly',true);
					
					$("#v107").val('-');
					$("#v107").prop('readonly',true);
					
					$("#v108").val('-');
					$("#v108").prop('readonly',true);
					
					$("#v109").val('-');
					$("#v109").prop('readonly',true);
					
					/* $("#v110").val('-');
					$("#v110").prop('readonly',true); */
					
					/* $("#v111").val('-');
					$("#v111").prop('readonly',true); */
					
					/* $("#v112").val('-');
					$("#v112").prop('readonly',true); */
					
					$("#v113").val('-');
					$("#v113").prop('readonly',true);
					
					/* $("#v114").val('-');
					$("#v114").prop('readonly',true); */
					
					$("#v115").val('-');
					$("#v115").prop('readonly',true);
					
					$("#v116").val('-');
					$("#v116").prop('readonly',true);
					
					$("#v117").val('-');
					$("#v117").prop('readonly',true);
					
					$("#v118").val('-');
					$("#v118").prop('readonly',true);
				}	//if end 
				
				-->




		
		<script>
		
		$(function(){
			
		/* 첫번째 열에 대해서 처리 */
			$("#v101").blur(
					
					function(){
						
						if($("#v101").val() == '40'){
							
							$.ajax({
								url: "getData40.aggregate",
								type: "post",
								data: {"attrYear":$("#attrYear").val(),
										"comCode":'${ loginCompany.companyCode }'
										},
								success: function(data){
									
									console.log(data);
									var data01 = JSON.parse(data);
									
									$("#v108").val(data01.sum10);
									$("#v109").val(data01.sum20);
									$("#v110").val(Number(data01.sum10) - Number(data01.sum20));
									
									/* data01.sum10
									data01.sum20
									data01.sum40 */
									
									
									
									
								},
								error: function(status){
									alert("error!!!\n" + status);
								}
								
							});
							
							
							/* $("#v102").val('-');
							$("#v102").prop('readonly',true); */
							
							/* $("#v103").val('-');
							$("#v103").prop('readonly',true); */
							
							/* $("#v104").val('-');
							$("#v104").prop('readonly',true); */
							
							$("#v105").val('X');
							$("#v105").prop('readonly',true);
							
							$("#v106").val('X');
							$("#v106").prop('readonly',true);
							
							$("#v107").val('X');
							$("#v107").prop('readonly',true);
							
							/* $("#v108").val('X');
							$("#v108").prop('readonly',true); */
							
							/* $("#v109").val('X');
							$("#v109").prop('readonly',true); */
							
							/* $("#v110").val('-');
							$("#v110").prop('readonly',true); */
							
							$("#v111").val('X');
							$("#v111").prop('readonly',true);
							
							/* $("#v112").val('-');
							$("#v112").prop('readonly',true); */
							
							$("#v113").val('부');
							$("#v113").prop('readonly',true);
							
							/* $("#v114").val('-');
							$("#v114").prop('readonly',true); */
							
							/* $("#v115").val('-');
							$("#v115").prop('readonly',true); */
							
							/* $("#v116").val('-');
							$("#v116").prop('readonly',true); */
							
							$("#v117").val('X');
							$("#v117").prop('readonly',true);
							
							$("#v118").val('X');
							$("#v118").prop('readonly',true);
							
							/* 40번이므로 맞는 값 넣어주기 */
							$("#v103").val('${ loginCompany.bizName }');
							$("#v104").val('${ loginCompany.bizNum }');
							$("#v107").val('${ loginCompany.bizType }');
							$("#v107dp").val('${ loginCompany.bizType }');
							$("#v112").val("부");
							
							
							
							
						}
						
						
						
						
						
						
						
						
						
						
					}
					
			);
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			/* 두번째 열에 대해서 처리 */
			$("#v201").blur(
					
					function(){
						if($("#v201").val() == '51'){
							//근로소득(51) 일 경우
							$("#v202").val('X');
							$("#v202").prop('readonly',true);

							/* $("#v203").val('-');
							$("#v203").prop('readonly',true); */
							
							$("#v204").val('X');
							$("#v204").prop('readonly',true);
						
							/* $("#v205").val('-');
							$("#v205").prop('readonly',true); */
							
							$("#v206").val('X');
							$("#v206").prop('readonly',true);
							
							$("#v207").val('X');
							$("#v207").prop('readonly',true);
							
							/* $("#v208").val('-');
							$("#v208").prop('readonly',true); */
							
							$("#v209").val('X');
							$("#v209").prop('readonly',true);
							
							$("#v210").val('X');
							$("#v212").prop('readonly',true);
							
							/* $("#v211").val('-');
							$("#v211").prop('readonly',true); */
							
							$("#v212").val('X');
							$("#v212").prop('readonly',true);
							
							$("#v213").val('X');
							$("#v213").prop('readonly',true);
							
							$("#v214").val('X');
							$("#v214").prop('readonly',true);
							
							$("#v215").val('X');
							$("#v215").prop('readonly',true);
							
							$("#v216").val('X');
							$("#v216").prop('readonly',true);
							
							$("#v217").val('X');
							$("#v217").prop('readonly',true);
							
							$("#v218").val('X');
							$("#v218").prop('readonly',true);
							
							$("#v203").prop("placeholder","이름을 입력하세요");
							
							
							
						}
					}
			
			
			);//blur end
		});
		
		</script>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<script>
		
		/* 주업종코드 포커스 할 때 모달 띄우기 */
		
		window.onload = function(){
			$("#v107dp").focus(function(){
				$("#modalSearchBizCode").css("display","block");
			});
		}
		
		/* x 누르면 모달 닫기 */
		function closeModalSearchBiz(){
			$("#modalSearchBizCode").css("display","none");
		};
		
		</script>
		
		
		
		<script>
		/* 도움말 부분 설정 */
		
		
		
		$("#v101").focus(function(){
			$("#divHelp").html(
			"<소득구분코드> <br> 11:비영업대금이익 &nbsp;21:배당가산하는배당&nbsp;30:부동산소득&nbsp;40:사업소득&nbsp;51:근로소득&nbsp;60:기타소득&nbsp;66:연금소득&nbsp;67:종교인소득"		
			);
		});
		</script>
		
		
		<!-- footer -->
		<div class="card mb-4">
			<div class="card-body" id="divHelp">
				귀속년도에 해당하는 소득금액을 구분별로 입력
			</div>
		</div>
		<!-- ///footer -->
		
	<!-- //작업영역 -->
	</div><!-- class="container-fluid" -->
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>




