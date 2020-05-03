<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jaga.companyInnerId.model.vo.SelectCompanyIdVo"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가 경리</title>
<style>
	.div-menuTap{
		display: inline-block;
		background: #24574A;
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
		background: #24574A;
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
		
		
		<!-- 로딩화면 -->
	   <div id="loading">
	        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
	    </div>
	   <!-- 로딩화면 끝-->
		
		
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
		
			<tr style="background:#24574A; height:20px;">
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
				
				
				<!-- 
				
				차장	009
				과장	010
				대리	011
				주임	012
				사원	013
				인턴	014
				알바	015
				
				 -->
				 
				
				<%--
				
				<c:if test="${ target.name eq '000' }">
					<td><c:out value="대표"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '001' }">
					<td><c:out value="회장"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '002' }">
					<td><c:out value="부회장"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '003' }">
					<td><c:out value="사장"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '004' }">
					<td><c:out value="부사장"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '005' }">
					<td><c:out value="전무"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '006' }">
					<td><c:out value="상무"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '007' }">
					<td><c:out value="이사"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '008' }">
					<td><c:out value="부장"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '009' }">
					<td><c:out value="차장"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '010' }">
					<td><c:out value="과장"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '011' }">
					<td><c:out value="대리"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '012' }">
					<td><c:out value="주임"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '013' }">
					<td><c:out value="사원"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '014' }">
					<td><c:out value="인턴"></c:out></td>
				</c:if>
				
				<c:if test="${ target.name eq '015' }">
					<td><c:out value="알바"></c:out></td>
				</c:if>
				
				--%>
				
				
				
				<td><c:out value="${ target.positionCode }"></c:out></td>
				
				
				<td><button>정보수정</button></td>
			</tr>
				
			</c:forEach>
			
			
		</table>
		</form>
		
		<div class="page-area" style="margin-left:350px; margin-top:30px;">
			
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
			
			
		</div>
		
		
		
	<!-- //작업공간 -->
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>