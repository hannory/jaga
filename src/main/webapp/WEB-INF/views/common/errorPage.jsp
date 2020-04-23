<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src=""></script>
</head>
<body>

	
	<!--  전달한 msg 문자열 alert로 출력 (확인 클릭시 뒤로 이동)  -->
	<%-- <h1><%=msg%></h1> --%>
	
	<script>
		window.onload = function(){
			
			swal({
			  	title: "<%=msg%>",
			  	text: "",
			    icon: "warning"
			  }).then((value) => {
				  history.go(-1);
			    });
			<%-- alert("<%=msg%>"); --%>
			
			//history.go(-1);
		};
	</script>
	
	
</body>
</html>