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
			var alertCode = "${ sessionScope.alertCode }";
						
			console.log("alertCode : " + alertCode);
			
			switch(alertCode) {
			case "withoutLogin" : 
				Swal.fire({
					icon: "warning",
					text: "로그인이 필요합니다"
				}).then((result) => {
					location.href = "<%= request.getContextPath() %>"
				})
				break;
			case "failMfrg" :
				Swal.fire({
					icon: "warning",
					text: "실패하였습니다"
				}).then((result) => {
					location.href = "mfrgStmt.fs"
				})
				break;
			case "successMfrg" :
				Swal.fire({
					icon: "success",
					text: "완료되었습니다!"
				}).then((result) => {
					location.href = "mfrgStmt.fs"
				})
				break;
			case "failIncome" :
				Swal.fire({
					icon: "warning",
					text: "실패하였습니다"
				}).then((result) => {
					location.href = "incomeStmt.fs"
				})
				break;
			case "successIncome" :
				Swal.fire({
					icon: "success",
					text: "완료되었습니다!"
				}).then((result) => {
					location.href = "incomeStmt.fs"
				})
				break;
			case "createComInIdOk" :
				Swal.fire({
					icon: "success",
					text: "사내계정 생성 완료 !"
				}).then((result) => {
					location.href = "showViewComInnerIdList.comInId"
				})
				break;
			}
		})
	</script>
</body>
</html>