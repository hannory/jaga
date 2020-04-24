<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.div-menuTap{
		display: inline-block;
		background: #8DABA3;
		color:white;
		width:200px;
		height:30px;
		border-top-left-radius:10px;
		border-top-right-radius:10px;
		text-align:center;
		line-height:30px;
	}
	.div-menuTap:hover{
		cursor:pointer;
		opacity:80%;
	}
	
	.div-subjectName{
		/* background: darkgreen; */
		color:black;
		width:200px;
		height:30px;
	}
	input{
		width:200px;
		border-radius:10px;
	}
	select{
		border-radius:10px;
	}
	.div-box-area{
		/* background:red; */
		width:85%;
		height:50%;
		border:1px solid #C9CACE;
	}
	.div-input-area{
		/* background:pink; */
		margin:50px;
	}
	.div-subjectName{
		text-align:center;
		border-radius:10px;
		border:2px solid green;
	}
	.formBtn{
		width:100px;
		border-radius:10px;
		border:1px solid green;
	}
	.div-menuTap-no{
		opacity:50%;
	}
	.div-menuTap-no:hover{
		opacity:80%;
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
		
		<h2 class="mt-4">사내계정생성</h2>
		
		
		<div style="height:50px;"></div>
		
		
		<div class="div-menuTap"><span>직원 계정 생성</span></div>
		<div class="div-menuTap div-menuTap-no" onclick="selectId()"><span>직원 계정 조회</span></div>
		<script>
			function selectId(){
				location.href="showViewComInnerIdList.comInId";
			}
			
		</script>
		
		<form action="createComInnerId.comInId" method="post" enctype="multipart/form-data">
		<div class="div-box-area">
		<div class="div-input-area">
		<table cellpadding="20px">
		
			<tr>
				<td>
					<div class="div-subjectName">
						<label>아이디</label>
					</div>
				</td>
				<td><input type="text" name="id"></td>
				
				<td>
					<div class="div-subjectName">
						<label>이메일</label>
					</div>
				</td>
				<td><input type="email" name="email"></td>
			</tr>
			
			<tr>
				<td>
					<div class="div-subjectName">
						<label>비밀번호</label>
					</div>
				</td>
				<td><input type="password" name="pwd"></td>
				
					<td>
					<div class="div-subjectName">
						<label>이름</label>
					</div>
				</td>
				<td><input type="text" name="name"></td>
			</tr>
			
			<tr>
				<td>
					<div class="div-subjectName">
						<label>비밀번호 확인</label>
					</div>
				</td>
				<td><input type="password" name="pwd2"></td>
				
				<td>
					<div class="div-subjectName">
						<label>직급</label>
					</div>
				</td>
				<td>
					<select name="position" style="width:200px;">
						<option value="000">대표</option>
						<option value="001">회장</option>
						<option value="002">부회장</option>
						<option value="003">사장</option>
						<option value="004">부사장</option>
						<option value="005">전무</option>
						<option value="006">상무</option>
						<option value="007">이사</option>
						<option value="008">부장</option>
						<option value="009">차장</option>
						<option value="010">과장</option>
						<option value="011">대리</option>
						<option value="012">주임</option>
						<option value="013">사원</option>
						<option value="014">인턴</option>
						<option value="015">알바</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>
					<div class="div-subjectName">
						<label>서명 또는 도장</label>
					</div>
				</td>
				
				<td>
					<div id="fileArea" style="width:100px; height:100px; border:1px solid black;">
					<img id="imgArea" style="width:100%; height:100%;">
					</div>
				</td>
				
				<td>
					<div class="div-subjectName">
						<label>부서</label>
					</div>
				</td>
				
				<td>
					<select style="width:200px;">
						<option value="001">총무팀</option>
						<option value="002">경리부(회계)</option>
						<option value="003">경영지원팀</option>
						<option value="004">경영개선팀</option>
						<option value="005">인사과</option>
						<option value="006">인사팀</option>
						<option value="007">재경부</option>
						<option value="008">고객만족팀</option>
						<option value="009">구매부서</option>
						<option value="010">관리부서</option>
						<option value="011">기술지원팀</option>
						<option value="012">기획팀</option>
						<option value="013">전략기획팀</option>
						<option value="014">연구기획팀</option>
						<option value="015">연구개발팀</option>
						<option value="016">비서실</option>
						<option value="017">생산관리팀</option>
						<option value="018">시설관리팀</option>
						<option value="019">R&D</option>
						<option value="020">영업팀</option>
						<option value="021">영업기획팀</option>
						<option value="022">영업지원팀</option>
						<option value="023">품질관리팀</option>
						<option value="024">해외사업부</option>
						<option value="025">해외사업팀</option>
						<option value="026">홍보팀</option>
						<option value="027">e-Biz팀</option>
					</select>
				</td>
				
			</tr>
			
		</table>
		
		<!-- 
				003
				004
				005
				006
				007
				008
				009
				010
				011
				012
				013
				014
				015
				016
				017
				018
				019
				020
				021
				022
				023
				024
				025
				026
				027
		 -->
			
			<input type="file" id="fileBtn" name="signFile" onchange="loadImg(this)" style="display:none;">
		
			<div align="center" style="margin-top:100px;">
			<button class="formBtn" type="submit">생성</button>
			<button class="formBtn" type="reset">취소</button>
			</div>
		
		</div>
		</div>
		</form>
		
		<script>
			window.onload = function(){
				var fileArea = document.getElementById("fileArea");
				fileArea.onclick = function(event){
					fileBtn.click();
				}
			}
			
			
			
			function loadImg(fileTag){
				if(fileTag.files && fileTag.files[0]){
					var reader = new FileReader();
					
					reader.onload = function(event){
						imgArea.setAttribute("src", event.target.result);
					}
					reader.readAsDataURL(fileTag.files[0]);
				}
			}
			 
			
			
			
		</script>
		
		
		
		
	<!-- //작업공간 -->
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>