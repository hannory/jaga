<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<main>
	<div class="container-fluid">
			<h2 class="mt-4">계산서 합계표</h2>
	<ol class="breadcrumb mb-4">
			<li><button id="deadlineBtn">마감</button></li>
			<li>1기예정</li>
            <li>조회기간:
            	<input type="date"> ~ <input type="date">
            </li>
			
		</ol>
		<div class="card mb-4">
			<div class="card-body">
				<p class="mb-0">본문내용 영역임니다.</p>
			</div>
		</div>
		<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>