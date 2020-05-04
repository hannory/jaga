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
	
	.colorGreen{
		background:#24574A;
		color:white;
	}
	.cursorPointer:hover{
		background:gray;
		opacity:80%;
	}
	
	/* 모달 */
	.modal-layer {
		position: fixed;
		width: 100%;
		height: 100%;
		z-index: 1;
		display: none;
		background: rgba(150, 150, 150, 0.9);
		margin-left: -25px;
		margin-top:-30px;
		animation: fadein 2s;
		text-align:center;
	}
	.white-layer {
		z-index: -1;
		width: 60%;
		height: 80%;
		background: white;
		margin-left: 150px;
		margin-top: 50px;
		border: 1px solid white;
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
   
   
   
   
   
   
   <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 상세내역 모달 창 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
   
   <div id="divModal" class="modal-layer">
   	<div id="" class="white-layer" style="border:1px solid #24574A">
   		<div style="width:100%; height:10%; background:#24574A;">
   			<h1 style="color:white; margin:0 auto; line-height:65px;">지출결의서 상세내역</h1>
   		</div>
   		
   		<table id="" class="" border="1" style="text-align:center; float:right; width:220px; height:120px; margin-right:5%; margin-top:5%;">
   				<tr style="height:20px;">
   					<td style="width:20px;"></td>
   					<td style="width:100px;">${ loginEmp.name }</td>
   					<td style="width:100px;">결재자</td>
   				</tr>
   				<tr>
   					<td>결재</td>
   					<td>싸인</td>
   					<td>싸인</td>
   				</tr>
   			</table>
   			
   			<table border="1" style="width:60%; height:40%; margin:5%; margin-left:5%">
   				<tr>
   					<td class="colorGreen">1</td>
   					<td>1</td>
   					<td class="colorGreen">1</td>
   					<td>1</td>
   				</tr>
   				<tr>
   					<td class="colorGreen">1</td>
   					<td>1</td>
   					<td class="colorGreen">1</td>
   					<td>1</td>
   				</tr>
   				<tr>
   					<td class="colorGreen">1</td>
   					<td>1</td>
   					<td class="colorGreen">1</td>
   					<td>1</td>
   				</tr>
   				<tr>
   					<td class="colorGreen">1</td>
   					<td colspan="3">1</td>
   					
   				</tr>
   			</table>
   			
   			<div style="width:220px; height:50px; float:right; margin-top:-100px; margin-right:5%;">
   				<div id="" class="colorGreen cursorPointer" style="border-radius:5px; display:inline-block; width:30%; height:30px%; line-height:30px; margin-top:5%;">승인</div>
   				<div id="" class="colorGreen cursorPointer" style="border-radius:5px; display:inline-block; width:30%; height:30px; line-height:30px; margin-top:10%;">반려</div>
   			</div>
   			
   			<table border="1" style="margin:0 auto; width:90%; height:30%;">
   				<tr class="colorGreen">
   					<td>일자</td>
   					<td>적요</td>
   					<td>거래처</td>
   					<td>금액</td>
   					<td>비고</td>
   				</tr>
   				<tr>
   					<td>1</td>
   					<td>1</td>
   					<td>1</td>
   					<td>1</td>
   					<td>1</td>
   				</tr>
   				<tr>
   					<td>1</td>
   					<td>1</td>
   					<td>1</td>
   					<td>1</td>
   					<td>1</td>
   				</tr>
   				<tr>
   					<td>1</td>
   					<td>1</td>
   					<td>1</td>
   					<td>1</td>
   					<td>1</td>
   				</tr>
   			</table>
   		
   	</div>
   </div>
   
   <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 상세내역 모달 창 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
   
   
   
   
   
   
   
	
		
		
		
		
		
		
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
						
						$("#divModal").css("display","block");
						
						var resolutionNo = this.children[0].innerText;
						console.log(resolutionNo);
						
						
						
						$.ajax({
							url: "selectExpendResolutionDetail.expendResolution",
							type: "post",
							data : {"expendResolutionNo":resolutionNo},
							success: function(data){
								alert("success");
								var data = JSON.parse(data);
								console.log(data);
								console.log(data.selectOneResult);
								console.log(data.detailList);
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