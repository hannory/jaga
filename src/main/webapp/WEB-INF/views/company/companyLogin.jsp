<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인!</title>

<style>
.userId {
	position: auto;
	width: 500px;
	height: 50px;
	left: 430px;
	top: 263px;
	background: #FFFFFF;
	border: 1px solid #000000;
	box-sizing: border-box;
}

.userPwd {
	position: auto;
	width: 500px;
	height: 50px;
	left: 430px;
	top: 328px;
	background: #FFFFFF;
	border: 1px solid #000000;
	box-sizing: border-box;
}

.business_registry_number {
	position: auto;
	width: 500px;
	height: 50px;
	left: 430px;
	top: 393px;
	background: #FFFFFF;
	border: 1px solid #000000;
	box-sizing: border-box;
}

.loginBtn {
	position: auto;
	width: 500px;
	height: 50px;
	left: 430px;
	top: 500px;
	background: #1B5748;
	border: 1px solid #000000;
	box-sizing: border-box;
	border-radius: 15px;
}

.jagalogo {
	width: 350px;
	height: 300px;
	left: auto;
}

.join_id_pwd {
	position: absolute;
	width: 100px;
	height: 50px;
	left: 530px;
	top: 705px;
}

.join_id_pwd2 {
	position: absolute;
	width: 100px;
	height: 50px;
	left: 630px;
	top: 705px;
}

.join_id_pwd3 {
	position: absolute;
	width: 100px;
	height: 50px;
	left: 730px;
	top: 705px;
}

.blank {
	height: 75px;
}
</style>

</head>

<body>

	<c:set var ="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
	
	<br>
	
	<div align="center">
		<img src="${contextPath }/resources/images/logo_vertical.PNG" class="jagalogo">
	</div>
	
	<div class="loginArea" align="center">
	 	<c:if test="${empty sessionScope.loginCompany }">
		
		<form action ="login.co" method="post">
			<table id="loginTable" style="text-align:center">
				<tr>
					<td><input type="text" name="companyId" class="userId" placeholder="아이디"></td>
					<td class="blank"></td>
					<td></td>
				</tr>
				
				<tr>
					<td><input type="password" name="companyPwd" class="userPwd" placeholder="비밀번호"></td>
					<td class="blank"></td>
					<td></td>
				</tr>
				
				<tr>
					<td colspan="3">
						<button class="loginBtn" style="color:white; font-size:25px"> 로그인 </button>
					</td>
					<td class="blank"></td>
					<td></td>
				</tr>
				
				<tr>
					<td class="join_id_pwd"><a href="companyJoinView.co"> 회원가입 </a></td> 
<!-- 					<td class="join_id_pwd2"><a href="/WEB-INF/views/member/memberJoin.jsp"> 아이디찾기  </a></td> 
					<td class="join_id_pwd3"><a href="/WEB-INF/views/member/memberJoin.jsp"> 비밀번호찾기 </a></td> -->
					
<!-- 					<td><a href="/WEB-INF/views/vender/newVender.jsp">임시거래처등록세션확인</a></td> -->
				</tr>
			</table>
		</form>
 		</c:if> 

	 	<c:if test="${!empty sessionScope.loginCompany }">
			<h3 align="right"><c:out value="${sessionScope.loginCompany.companyId }님 환영합니다."></c:out></h3> 
			<button onclick="logout()">로그아웃</button> 
 		</c:if> 
	</div>
	
	<script>
		function logout(){
			location.href="${contextPath}/logout.co"
		}
	</script>
	
</body>
</html>