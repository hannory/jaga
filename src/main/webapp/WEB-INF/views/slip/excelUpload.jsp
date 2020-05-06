<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<!-- 로딩? -->
	<div id="loading">
        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
    </div>
    
	<main>
		<div class="container-fluid">
			<h2 class="mt-4">엑셀 업로드</h2>
			
			<form id="excelForm">
				<input type="file" name="excelFile">
				<button type="button" id="formBtn">전송해봅시다</button>
			</form>
			
			
			<div class="card mb-4">
				<div class="card-body">
					<table>
						<thead>
							<tr>
								<th>날짜</th>
								<th>증빙</th>
								<th>차/대</th>
								<th>거래처</th>
								<th>품목</th>
								<th>차변</th>
								<th>대변</th>
							</tr>
						</thead>					
						<tbody>
						
						</tbody>
					</table>
				</div>
			</div>
		
		</div>
	</main>
	
	<script>
		$(function(){
			$("#formBtn").click(function(){
				formAjax();
			});
			
		});
		
		function formAjax(){
			var form = $("#excelForm")[0];
			var formData = new FormData(form);
			
			console.log(formData);
			
			$.ajax({
				url:"excelUpload.rp",
				type:'post',
				data: formData,
				enctype: 'multipart/form-data',
				contentType : false,
				processData : false,
				success:function(data){
					console.log(data);
				}
			});
			
		}
	</script>

<jsp:include page="../common/menubar2.jsp" />
</body>
</html>