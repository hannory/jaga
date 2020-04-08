<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.confirmTable{
		background:gray;
		float:right;
	}
	.topArea{
		background:aqua;
	}
	.botArea{
		background:red;
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
		
		<h2 class="mt-4">지출결의서</h2>
		
		
		<table class="confirmTable">
			<tr class="topArea">
				<td>11</td>
				<td>12</td>
			</tr>
			
			<tr class="botArea">
				<td>21</td>
				<td>22</td>
			</tr>
		</table>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<!-- //작업공간 -->
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>






