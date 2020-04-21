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
	<main>
	<div class="container-fluid">
		<h2 class="mt-4">대시보드</h2>
		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="index.html">끨끨끨</a></li>
			<li class="breadcrumb-item active">희희희희희희희희희</li> 
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