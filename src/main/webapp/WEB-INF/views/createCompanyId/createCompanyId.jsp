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
		background: darkgreen;
		color:white;
		width:200px;
		height:50px;
	}
	
	.div-subjectName{
		background: darkgreen;
		color:white;
		width:200px;
		height:30px;
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
		
		<h2>사내계정생성</h2>
		
		<div class="div-menuTap"><span>직원계정생성</span></div>
		<div class="div-menuTap"><span>직원계정조회</span></div>
		
		<table>
			<tr>
				<td>
					<div class="div-subjectName">
						<label>아이디</label>
					</div>
				</td>
				<td><input type="text" name="companyPrivateId"></td>
			</tr>
			
		</table>
		
		
	<!-- //작업공간 -->
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>