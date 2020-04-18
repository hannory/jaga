<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jaga.companyInnerId.model.vo.SelectCompanyIdVo"%>
    
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
		<div style="margin-left:68%; height:50px;">
		
		<select name="searchType">
			<option value="number">번호</option>
			<option value="position">직급</option>
			<option value="name">이름</option>
		</select>
		
		<select name="orderType">
			<option value="asc">오름차순</option>
			<option value="desc">내림차순</option>
		</select>
		
		
		
		
		
		
		
		
		
		</div>
		<div class="div-menuTap div-menuTap-no" onclick="showExpendResolutionWriteForm()"><span>지출결의서 작성</span></div>
		<div class="div-menuTap"><span>지출결의서 목록</span></div>
		<script>
			function showExpendResolutionWriteForm(){
				location.href="showExpendResolutionWriteForm.expendResolution";
			}
		</script>
		<form action="" method="post">
		<table border="1" style="width:80%; text-align:center;">
		
			<tr style="background:green; height:20px;">
				<td style="width:10%">문서번호</td>
				<td style="width:40%">지출일</td>
				<td style="width:15%">계정과목</td>
				<td style="width:15%">지출목적</td>
				<td style="width:20%">지출금액</td>
			</tr>
			
			    
			
			
		</table>
		</form>
		
		<div class="page-area" style="margin-left:350px; margin-top:50px;">
			
			
			
			
		</div>
		
		
		
	<!-- //작업공간 -->
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>