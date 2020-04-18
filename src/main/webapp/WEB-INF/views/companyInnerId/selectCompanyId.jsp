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
		background: darkgreen;
		color:white;
		width:200px;
		height:50px;
		border-top-left-radius:10px;
		border-top-right-radius:10px;
		text-align:center;
		line-height:50px;
	}
	.div-menuTap:hover{
		cursor:pointer;
		opacity:80%;
	}
	
	.div-subjectName{
		background: darkgreen;
		color:white;
		width:200px;
		height:30px;
	}
	input{
		width:200px;
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
		<div class="div-menuTap div-menuTap-no" onclick="createId()"><span>직원 계정 생성</span></div>
		<div class="div-menuTap"><span>직원 계정 조회</span></div>
		<script>
			function createId(){
				location.href="showViewCeateCompanyId.vi";
			}
			
		</script>
		<form action="" method="post">
		<table border="1" style="width:80%; text-align:center;">
		
			<tr style="background:darkgreen; height:20px;">
				<td style="width:10%">번호</td>
				<td style="width:40%">이메일</td>
				<td style="width:15%">이름</td>
				<td style="width:15%">직급</td>
				<td style="width:20%">비고</td>
			</tr>
			
			
			<c:forEach var="target" items="${ list }">
			
			<tr>
				<td><c:out value="${ target.comInnerIdNum }"></c:out></td>
				<td><c:out value="${ target.email }"></c:out></td>
				<td><c:out value="${ target.name }"></c:out></td>
				<td><c:out value="${ target.positionCode }"></c:out></td>
				<td><button>정보수정</button></td>
			</tr>
				
			</c:forEach>
			
			
		</table>
		</form>
		
		<div class="page-area" style="margin-left:350px; margin-top:50px;">
			
			<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" step="1" var="n">
				
				<c:if test="${ pi.currentPage != n}">
					<c:url value="showViewComInnerIdList.comInId" var="pagePath">
						<c:param name="currentPage" value="${ n }"></c:param>
					</c:url>
					<a href="${ pagePath }"><span><c:out value="${ n }"></c:out></span></a>
				</c:if>
				
				<c:if test="${ pi.currentPage eq n }">
					<b><span><c:out value="${ n }"></c:out></span></b>
				</c:if>
				
				
				
			</c:forEach>
			
			
			<!-- 
			<button><<</button>
			<button><</button>
			<button>1</button>
			<button>2</button>
			<button>3</button>
			<button>4</button>
			<button>5</button>
			<button>></button>
			<button>>></button>
			-->
		</div>
		
		
		
	<!-- //작업공간 -->
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>