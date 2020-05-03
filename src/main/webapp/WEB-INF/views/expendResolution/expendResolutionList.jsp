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
	
	
	<!-- 로딩화면 -->
   <div id="loading">
        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
    </div>
   <!-- 로딩화면 끝-->
	
		
		
		
		
		
		
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
		
			<tr style="background:#24574A; color:white; height:20px;">
				<td style="width:8%">문서번호</td>
				<td style="width:38%">지출일</td>
				<td style="width:13%">계정과목</td>
				<td style="width:13%">지출목적</td>
				<td style="width:18%">지출금액</td>
				<td style="width:10%">승인여부</td>
			</tr>
			
			<c:if test="${ !empty dtoList }">
				<c:forEach var="target" items="${ dtoList }"> 
					<tr>
						<td>${ target.resolutionNo }</td>
						<td>${ target.expendDate }</td>
						<td>${ target.accountTitleCode }</td>
						<td>${ target.expendPurpose }</td>
						<td>${ target.expendSummary }</td>
						<td>${ target.approvalStatus }</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<script>
			/* 리스트에서 행 클릭 시 해당 문서 번호 가져오기 ,, 이후 문서번호로 데이터 받아와서 모달에 보여주자 */
				$(function(){
					$("table tr").click(function(e){
						var resolutionNo = this.children[0].innerText;
						console.log(resolutionNo);
						
						
						
						$.ajax({
							url: "swyTestUrl",
							data : {
								"k01":"v01",
								"k02":"v02"
							},
							success: function(data){
								alert("success");
								alert(data);
							},
							error: function(status){
								alert("error");
								alert(status);
							}
						});//ajax
						
						
						
					})	
				});
			</script>
			
			
			<!-- 
				//EXPEND_RESOLUTION 테이블 			//[지출결의서]
				private String resolutionNo = "시퀀스넣기";		//결의서 코드
				private String comResolutionCode;	//회사 코드
				private String initiativeDate;		//발의일
				private String departmentCode;		//담당부서(코드)
				private String managerNo;			//담당자(번호)
				private String managerPosition;		//담당자 직급
				private String expendPurpose;		//지출목적
				private String expendDate;			//지출일
				private String accountTitleCode;	//계정과목(코드)
				private String expendSummary;		//지출합계
				private String createUser;			//작성자
				private String createDate;			//작성일
				private String approvalStatus;		//승인여부
				private String paymentTypeCode;		//결재코드
				private String evidenceCode;		//관련증빙코드
				private String comCode;				//회사코드
			 -->
			    
			
			
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