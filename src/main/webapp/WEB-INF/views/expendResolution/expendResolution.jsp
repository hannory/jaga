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
	
	/* 모달 */
	.test{
		width:300px;
		height:300px;
		background:red;
		
	}
	.test:hover{
		width:500px;
		height:500px;
		duration:300;
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
	<!-- 작업공간 -->
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
		<script>
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
				<td style="width:25%">2000-04-09</td>
				<td style="width:10%">달력</td>
				<td style="width:15%" class="color-green">지출일</td>
				<td style="width:25%">2000-04-04</td>
				<td style="width:10%">달력</td>			
			</tr>
			<tr>
				<td class="color-green">담당부서</td>
				<td>경영지원팀</td>
				<td>돋보기</td>
				<td class="color-green">계정과목</td>
				<td>접대비</td>
				<td>돋보기</td>			
			</tr>
			<tr>
				<td class="color-green">담당자</td>
				<td>홍길동(개발팀)</td>
				<td>돋보기</td>
				<td class="color-green">지출합계</td>
				<td colspan="2" style="text-align:right">140,000</td>
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
				<td style="width:10%;">현금</td>
				<td style="width:10%;">카드</td>
				<td style="width:10%; border-top:1px solid white;"></td>
				<td style="width:10%;"class="color-green">합계</td>
				<td style="width:20%;">140,000</td>
			</tr>
			<tr>
				<td class="color-green">관련증빙</td>
				<td colspan="2'"><input type="radio" name="receptionType" value="tax">세금계산서</td>
				<td><input type="radio" name="receptionType" value="cash">현금영수증</td>
				<td><input type="radio" name="receptionType" value="card">카드영수증</td>
				<td><label id="receptionLabel"></label> </td>
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
		
		<div class="test">
			zzzzzzzzzzzzzzzzzzzzzzzzz
		</div>
		
	<!-- //작업공간 -->
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>





