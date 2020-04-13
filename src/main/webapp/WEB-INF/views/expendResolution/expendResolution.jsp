<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.confirmTable{
		background:gray;
		float:right;
		text-align:center;
	}
	.topTr{
		background:aqua;
		height:30px;
		
	}
	.botTr{
		background:red;
		height:100px;
	}
	.topTd{
		width:100px;
	}
	.botTd{
		width:100px;
	}
	.div-menuTap{
		display: inline-block;
		background: #8DABA3;
		color:white;
		width:160px;
		height:30px;
		border-top-left-radius:10px;
		border-top-right-radius:10px;
		text-align:center;
		line-height:30px;
		clear:both;
	}
	.div-menuTap:hover{
		cursor:pointer;
		opacity:80%;
	}
	.div-menuTap-no{
		opacity:50%;
	}
	.div-menuTap-no:hover{
		opacity:80%;
	}
	.div-box-area{
		/* background:red; */
		width:100%;
		border:1px solid #C9CACE;
	}
	.table01{
		width:100%;
		text-align:center;
	}
	.table02{
		margin-top:10px;
		width:100%;
		text-align:center;
	}
	.table03{
		margin-top:10px;
		width:100%;
		text-align:center;
	}
	.color-green{
		background:green;
	}
	.label-sign:hover{
		background:gray;
	}
	
	/* 모달(담당부서) */
	.modal-layer{
		position:fixed;
		width:1335px;
		height:730px;
		background:gray;
		z-index: 1;
		display:none;
		background:rgba(150, 150, 150, 0.5);
		margin-left:-25px;
		animation: fadein 2s;
	}
	.modal-section{
		z-index: -1;
		width:50%;
		height:70%;
		background:white;
		margin:auto;
		margin-top:10%;
		border:1px solid white;
	}
	.modal-dept-top{
		width:100%;
		height:10%;
		background:pink;
	}/* 모달(담당부서) 끝 */
	
	
	
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<main>
	<div class="container-fluid">
	<!-- 작업공간 -->
	
	<!-- 모달창 영역(담당부서 검색) -->
		<div class="modal-layer" id="modalLayer"><!-- 회색영역 -->
			
			<!-- 모달 내 작업영역 -->
			<div class="modal-section">
			<button onclick="closeModal()" style="float:right;">X</button>
		
				<table border="1" style="margin-top:50px; margin-left:140px; text-align:center;">
					<tr>
						<td style="width:100px; background:green;"><span>직원검색</span></td>
						<td><input type="text" style="width:100%; height:100%;"></td>
						<td style="width:100px;">
						<div class="searchBtn" onclick="searchDept()">
						<img style="width:30px; height:30px;" src="${contextPath}/resources/images/search.PNG">
						</div>
						</td>
					</tr>
					<tr style="background:green;">
						<td>사번</td>
						<td>이름</td>
						<td>직책</td>
					</tr>
					<tr>
						<td>20130872</td>
						<td>홍길동</td>
						<td>팀장</td>
					</tr>
				</table>
			</div>
			<!-- //모달 내 작업영역 -->
		</div><!-- //회색영역 -->
	<!-- //모달창 영역 -->
	<script>
	/* 담당부서 검색 */
	/* 모달 보여주기 */
	function showModalDept(){
		$("#modalLayer").fadeIn(200);
	}
	/* 모달 닫기 */
	function closeModal(){
		$("#modalLayer").fadeOut(200);
	}
	function searchDept(){
		alert("zzasd");
	}
	
	$(function(){
		$("#inputDept").focus(function(e){
			e.target.blur();
			showModalDept();
			
		});
	});
	/* --담당부서 검색 끝--*/
	</script>
	
	
	
	
	
	
	
	
	<!-- 모달창 영역(계정과목 검색) -->
		<div class="modal-layer" id="modalLayerSubject"><!-- 회색영역 -->
			
			<!-- 모달 내 작업영역 -->
			<div class="modal-section">
			<button onclick="closeModalSubject()" style="float:right;">X</button>
		
				<table border="1" style="margin-top:50px; margin-left:140px; text-align:center;">
					<tr>
						<td style="width:100px; background:green;"><span>직원검색</span></td>
						<td><input type="text" style="width:100%; height:100%;"></td>
						<td style="width:100px;">
						<div class="searchBtnSubject" onclick="searchSubject()">
						<img style="width:30px; height:30px;" src="${contextPath}/resources/images/search.PNG">
						</div>
						</td>
					</tr>
					<tr style="background:green;">
						<td>코드</td>
						<td>계정과목명</td>
						<td>비고</td>
					</tr>
					<tr>
						<td>923</td>
						<td>접대비</td>
						<td></td>
					</tr>
				</table>
			</div>
			<!-- //모달 내 작업영역 -->
		</div><!-- //회색영역 -->
	<!-- //모달창 영역 -->
	<script>
	/* 담당부서 검색 */
	/* 모달 보여주기 */
	function showModalSubject(){
		$("#modalLayerSubject").fadeIn(200);
	}
	/* 모달 닫기 */
	function closeModalSubject(){
		$("#modalLayerSubject").fadeOut(200);
	}
	function searchSubject(){
		alert("searchSubjectMethodExecute");
	}
	
	$(function(){
		$("#inputSubject").focus(function(e){
			e.target.blur();
			showModalSubject();
			
		});
	});
	/* --계정과목 검색 끝--*/
	</script>
	
	
	
	
	
	
	
	
	
	
	<!-- 모달창 영역(담당자 검색) -->
		<div class="modal-layer" id="modalLayerEmployee"><!-- 회색영역 -->
			
			<!-- 모달 내 작업영역 -->
			<div class="modal-section">
			<button onclick="closeModalEmployee()" style="float:right;">X</button>
		
				<table border="1" style="margin-top:50px; margin-left:140px; text-align:center;">
					<tr>
						<td style="width:100px; background:green;"><span>직원검색</span></td>
						<td><input type="text" style="width:100%; height:100%;"></td>
						<td style="width:100px;">
						<div class="searchBtnEmployee" onclick="searchEmployee()">
						<img style="width:30px; height:30px;" src="${contextPath}/resources/images/search.PNG">
						</div>
						</td>
					</tr>
					<tr style="background:green;">
						<td>직원코드</td>
						<td>직원명</td>
						<td>직급</td>
					</tr>
					<tr>
						<td>923</td>
						<td>홍길동</td>
						<td>팀장</td>
					</tr>
				</table>
			</div>
			<!-- //모달 내 작업영역 -->
		</div><!-- //회색영역 -->
	<!-- //모달창 영역 -->
	<script>
	/* 담당부서 검색 */
	/* 모달 보여주기 */
	function showModalEmployee(){
		$("#modalLayerEmployee").fadeIn(200);
	}
	/* 모달 닫기 */
	function closeModalEmployee(){
		$("#modalLayerEmployee").fadeOut(200);
	}
	function searchEmployee(){
		alert("searchEmployeeMethodExecute");
	}
	
	$(function(){
		$("#inputEmployee").focus(function(e){
			e.target.blur();
			showModalEmployee();
			
		});
	});
	/* --담당자 검색 끝--*/
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		<form action="zzzzz" method="post">
		<!-- 우측상단 결재 관련 -->
		<h2 class="mt-4">지출결의서</h2>
		
		
		<table class="confirmTable" border="1">
			<tr class="topTr" id="confirmTopRow">
				<td class="" style="width:30px;" onclick="addBtn()">+</td>
				<td class="topTd">품의자</td>
				<td class="topTd">품의자</td>
			</tr>
			
			<tr class="botTr" id="confirmBotRow">
				<td class="">결재</td>
				<td class="botTd">본인싸인 </td>
				<td class="botTd">싸인 </td>
			</tr>
			
		</table>
		<!-- //우측상단 결재 관련 -->
		
		
		
		<!-- 탭메뉴 영역 -->
		<div class="div-menuTap" style="margin-top:105px;">
			<span>지출결의서 작성</span>
		</div>
		<div class="div-menuTap div-menuTap-no" onclick="showExpendResolutionList()">
			<span>지출결의서 목록</span>
		</div>
		
		<script>
		/* 지출결의서 조회 탭으로 이동 */
			function showExpendResolutionList(){
				alert("asd");
			}
		</script>


		<!-- //탭메뉴 영역 -->

		<!-- 테이블 3개 감싸는 박스 -->		
		<div class="div-box-area">

		<!-- 테이블 1번 -->
		<table class="table01" border="1">
			<tr>
				<td style="width:15%" class="color-green">발의일</td>
				<td style="width:25%"><input readonly id="datepicker01" style="width:100%; text-align:center;"></td>
				<td style="width:10%"><span>
				<img id="dateTestBtn01" src="${contextPath}/resources/images/calendar.png" style="width:25px; height:25px;">
				</span></td>
				<td style="width:15%" class="color-green">지출일</td>
				<td style="width:25%"><input readonly id="datepicker02" style="width:100%; text-align:center;"></td>
				<td style="width:10%"><span>
				<img id="dateTestBtn02" src="${contextPath}/resources/images/calendar.png" style="width:25px; height:25px;">
				</span>
				
				</td>			
			</tr>
			<tr>
				<td class="color-green">담당부서</td>
				<td><input readonly id="inputDept" type="text" style="width:100%; height:100%; text-align:center;"></td>
				<td onclick="showModalDept()"><img style="width:20px; height:20px;" src="${contextPath}/resources/images/search.PNG"></td>
				<td class="color-green">계정과목</td>
				<td><input readonly id="inputSubject" type="text" style="width:100%; height:100%; text-align:center;"></td>
				<td onclick="showModalSubject()"><img style="width:20px; height:20px;" src="${contextPath}/resources/images/search.PNG"></td>			
			</tr>
			<tr>
				<td class="color-green">담당자</td>
				<td><input type="text" style="width:100%; height:100%; text-align:center;"></td>
				<td onclick="showModalEmployee()"><img style="width:20px; height:20px;" src="${contextPath}/resources/images/search.PNG"></td>
				<td class="color-green">지출합계</td>
				<td colspan="2" style="text-align:right"><input id="totalExpend" type="text" style="width:100%; height:100%; text-align:right;"></td>
			</tr>
			<tr>
				<td class="color-green">지출목적</td>
				<td colspan="5"><input type="text" style="width:100%"></td>
			</tr>
		</table>
		<!-- //테이블 1번 -->

		<hr>

		<!-- 테이블 2번 -->
			<table class="table02" border="1">
				<tr>
					<td class="color-green">일자</td>
					<td class="color-green">적요</td>
					<td class="color-green">거래처</td>
					<td class="color-green">금액</td>
					<td class="color-green">비고</td>
				</tr>
				<tr>
					<td>111</td>
					<td>222</td>
					<td>333</td>
					<td>444</td>
					<td>555</td>
				</tr>
			</table>
		<!-- //테이블 2번 -->

		<hr>

		<!-- 테이블 3번 -->
		<table class="table03" border="1">
			<tr>
				<td class="color-green" style="width:10%">결제구분</td>
				<td style="width:10%;"><input type="radio" name="paymentType" value="cash" id="radioCash"><label for="radioCash">현금</label></td>
				<td style="width:10%;"><input type="radio" name="paymentType" value="card" id="radioCard"><label for="radioCard">카드</label></td>
				<td style="width:10%; border-top:1px solid white;"></td>
				<td style="width:10%;"class="color-green">합계</td>
				<td style="width:20%;">140,000</td>
			</tr>
			<tr>
				<td class="color-green">관련증빙</td>
				<td colspan="2'"><input type="radio" name="receptionType" value="taxReception" id="radiotaxReception"><label for="radiotaxReception">세금계산서</label></td>
				<td><input type="radio" name="receptionType" value="cashReception" id="radiocashReception"><label for="radiocashReception">현금영수증</label></td>
				<td><input type="radio" name="receptionType" value="cardReception" id="radiocardReception"><label for="radiocardReception">카드영수증</label></td>
				<td><span id="receptionLabel">증빙파일을 선택하세요</span> </td>
			</tr>
		</table>
		<!-- //테이블 3번 -->
		
		
		</div>
		<!-- 테이블 3개 감싸는 박스 -->
		
		
		
		<!-- 하단 영역 감싸는 박스 -->
		<div class="div-bot">
			<div><!-- 두개 묶어주기 위한 div -->
			<br>
				<span>위와 같이 지출을 결의하오니 허가하여주시기 바랍니다.</span>
				
				<div style="float:right; margin-top:20px;">
					<input type="text" maxlength="4" style="width:50px; text-align:right; border:1px solid white; border-bottom:1px solid black">년
					<input type="text" maxlength="2" style="width:50px; text-align:right; border:1px solid white; border-bottom:1px solid black">월
					<input type="text" maxlength="2" style="width:50px; text-align:right; border:1px solid white; border-bottom:1px solid black">일
					<br>
					<label>작성자</label><input type="text" style="text-align:right; border:1px solid white; border-bottom:1px solid black;">
					<label class="label-sign" for="signInput">(인)</label>
					<input id="signInput" type="file" style="display:none" onchange="loadFileName(this)">
					<br>
					<label id="signFileName" for="signInput" style="float:right;">서명 파일을 업로드하세요</label>
				</div>
			</div><!-- //두개 묶어주기 위한 div -->
			<div class="buttonArea" style="margin-top:70px; margin-left:500px;">
				<button type="submit">등록</button>
				<button type="reset">취소</button>
			</div>
			<br><br><br>
			<input type="file" id="receptionFile" style="display:none;">
			
			<script>
			/* 파일이름 읽어와서 라벨에 넣어주기 */
				function loadFileName(signFileTag){
					if(signFileTag.files && signFileTag.files[0]){
						var signInput = document.getElementById("signInput");
						var signFileName = document.getElementById("signFileName");
						signFileName.innerHTML = signInput.value.substring(signInput.value.lastIndexOf("\\") + 1);
					}
				}
			
			/* 체크박스 클릭 시 파일 선택창 클릭 */
			window.onload = function(){
				$("input[name=receptionType]").click(function(){
					$("#receptionFile").click();
				});
			}
			
			/* 영수증 파일 선택 완료 시 파일 명  표시 */
			$(function(){
				$("#receptionFile").change(function(e){
					var receptionFileName = e.target.value.substring(e.target.value.lastIndexOf("\\") + 1);
					$("#receptionLabel").text(receptionFileName);
				});
			});
			</script>
			
			
			
			
			
		</div>
		<!-- //하단 영역 감싸는 박스 -->
		
		
		
		</form>
		
		<script>
		/* 우측상단 결재박스 늘리기 */
			function addBtn(){

				var nodeTop = document.createElement("td");                 
				var textnodeTop = document.createTextNode("품의자");         
				nodeTop.appendChild(textnodeTop);                              
				document.getElementById("confirmTopRow").appendChild(nodeTop);
				
				var nodeBot = document.createElement("td");
				var textnodeBot = document.createTextNode("싸인");
				nodeBot.appendChild(textnodeBot);
				document.getElementById("confirmBotRow").appendChild(nodeBot);
				
			}
		</script>
		
		
		
		<script>
		/* 지출합계에 숫자 3개마다 콤마 찍기 */
		window.onload = function(){
			$("#totalExpend").blur(function(){
				var num = $("#totalExpend").val();
				$("#totalExpend").val(num.toLocaleString());	
			});
			
		}
		

		
		
		</script>
		
		
		
		
		
		
		
		<script>
		/* btn01 클릭하면 달력 나옴 */
		$(function(){
			$("#dateTestBtn01").click(function(){
				$("#datepicker01").focus();
			});
		});
		$(function(){
			$("#dateTestBtn02").click(function(){
				$("#datepicker02").focus();
			});
		});
		/* 날짜 input jquery ui */
		$.datepicker.setDefaults({
			showOn : "both",
			buttonImageOnly : true,
			buttonImage : "${contextPath}/resources/images/calendar.png",
			dateFormat : 'yy-mm-dd'

		});
		/* datepicker 동작하게 설정 */
		$(function() {
			$("#datepicker01").datepicker({});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px; display:none;");
			   $('.ui-datepicker ').css({ "margin-left" : "0px", "margin-top": "0px"});  //달력(calendar) 위치
		});
		$(function() {
			$("#datepicker02").datepicker({});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px; display:none;");
			   $('.ui-datepicker ').css({ "margin-left" : "0px", "margin-top": "0px"});  //달력(calendar) 위치
		});
	 </script>
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
		
		
		<!-- footer -->
		<div class="card mb-4">
			<div class="card-body">
			도움말입니다. 읽어주세요*^^*
			</div>
		</div>
		<!-- ///footer -->
	<!-- //작업공간 -->
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>






