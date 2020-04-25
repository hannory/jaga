<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가 경리</title>
<!-- sweel alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<script>
		$(function() {
			
			Swal.fire({
				icon: "warning",
				text: "${ sessionScope.msg }"
			}).then((result) => {
				location.href = "<%= request.getContextPath() %>"
			}) 
		})
	</script>
</body>
</html>