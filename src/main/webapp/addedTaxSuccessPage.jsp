<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>successPage</h1>
	<h2><%= request.getAttribute("message") %></h2>
	
	<hr>
	<a href="showAggregateCalculated.aggregate"> go </a>
	
			
			
	<script>
	window.onload = function(){
		
		Swal.fire({
			  title: '가산세 명세서 입력 완료',
			  text: '',
			  icon: 'info',
			  confirmButtonText: '확인'
		}).then((result) => {
			if(result.value){
				alert('<%= request.getAttribute("message") %>');
				location.href="showAggregateCalculated.aggregate";
			}
		})
		
	};
	</script>
	
	
	
</body>
</html>