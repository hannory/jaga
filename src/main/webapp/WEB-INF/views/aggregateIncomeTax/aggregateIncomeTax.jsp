<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	/* 상단 메뉴 4개 설정 */
	.div-top4menuWrapper{
		width:70%;
	}
	.div-top4menu{
		display:inline-block;
		width:23%;
		height:30px;
		
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<main>
	<div class="container-fluid">
		<h2 class="mt-4">종합소득세</h2>
		
		<!-- 귀속년도 -->
		<div style="float:right;">
			<label>귀속년도 : </label>
			<input type="text" style="">
			<label>년</label>
		</div>
		<!-- //귀속년도 -->
		
		<div class="div-top4menuWrapper">
			<div class="div-top4menu"><h5>소득금액명세서</h5></div>
			<div class="div-top4menu"><h5>소득공제명세서</h5></div>
			<div class="div-top4menu"><h5>가산세명세서</h5></div>
			<div class="div-top4menu"><h5>종합소득세액계산서</h5></div>
		</div><!-- //class="div-top4menu" -->
		
		
		
		
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>