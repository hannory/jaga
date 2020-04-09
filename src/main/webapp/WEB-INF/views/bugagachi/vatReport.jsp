<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <style>
        *{
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        #titleArea{
            width: 50%;
        }
        .middleMenu{
            background-color: #24574A;
            color: white;
            height: 30px;
        }
        .middleMenu>h5{
            padding: 5px;
        }
        .totalSum{
            text-align: center;
          	  margin-top: 15px;
            margin-bottom:40px;
        }
        #deemed{
        	text-align: center;
            margin-top: 15px;
            margin-bottom:40px;
        }
        #deemed td{
        	 /* border: 1px solid #C9CACE;  */
            height: 23px;
            width:25%;
        }
        .totalSum td{
            border: 1px solid #C9CACE; 
            height: 23px;
        }
        .green{
            background-color: #D9EAD3;
            font-weight: 700;
        }
        .green_value{
        	background-color: #F3F4F6;
        	
        }
        #cho_nav1{
            background-color: #1B5748;
            color: white;
        }   
        .Tex_bill_th{
            background-color:#E7E6E6;
        }
        .Tex_bill_td{
            background-color:#E7E6E6;
            width: 10px;
        }
        #Text_billNo{
            background-color:#E7E6E6;
            height: 25px;
        }
        #Tex_bill_code{
            border: 1px solid black;
        }
        .breadcrumb>li{
        	margin: auto auto;
        }
        /* td{ border: 1px solid red;} */
        .cho_nav{
        	height: 35px;
        	border: 1px solid #C9CACE;
        	background-color:#8DABA3;
        	color: white;
			border-top-left-radius:10px;
			border-top-right-radius:10px;
        }
        .cho_nav>p{
        	margin-left:5px;
        	margin-right: 5px;
        	margin-top:3px;
        }
        .sumTableSales{
        	width: 20%;
        	padding-left:5%;
        }
   		#List_detail td{
   			border:1px solid #D2D2D6;
   		}
   		#List_detail{
   			text-align: center;
   		}
   		.cc_year{
   			width:50px;
   			height: 30px;
   		}
   		.cc_month{
   			width:50px; 
   			height: 30px;
   		}
   		.Tex_bill_code_p{
   			font-size:23px;
   		}
   		/* .billMainTable{
   			width:100%;
   		} */
   		.total_deemed{
   			text-align: center;
   			width: 99%;
   			border:1px solid #C9CACE;
   		}
   		#total_deemed_div1{
   			align:center;
   		 	width: 99%;
   		 	float: left;
   		}
   		#total_deemed_div2{
   			align:center;
   		 	width: 99%;
   		 	float: left;
   		}
   		#total_deemed_div3{
   			align:center;
   		 	width: 99%;
   		 	float: left;
   		}
   		#tax1{
   		 	width:100%; 
   		 	border:2px solid #C9CACE;
   	  	 	padding:8px;
   		}
   		#tax2{
   			width:100%; 
   		 	border:2px solid #C9CACE;
   	  	 	padding:8px;
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
			<h2 class="mt-4">의제매입세액공제 신고서</h2>
	<ol class="breadcrumb mb-4">
			<li><button id="deadlineBtn">마감</button></li>
			<li>1기예정</li>
            <li>조회기간:
            	<input type="text" name="search_ye1" class="cc_year">
            	<select class="cc_month" name="search_mon1">
            		<option value="">월</option>
            		<option value="1">1</option>
            		<option value="1">2</option>
            		<option value="1">3</option>
            		<option value="1">4</option>
            		<option value="1">5</option>
            		<option value="1">6</option>
            		<option value="1">7</option>
            		<option value="1">8</option>
            		<option value="1">9</option>
            		<option value="1">10</option>
            		<option value="1">11</option>
            		<option value="1">12</option>
            	</select> 
            	~ 
            	<input type="text" name="search_ye2" class="cc_year">
            	<select class="cc_month" name="search_mon1">
            		<option value="">월</option>
            		<option value="1">1</option>
            		<option value="1">2</option>
            		<option value="1">3</option>
            		<option value="1">4</option>
            		<option value="1">5</option>
            		<option value="1">6</option>
            		<option value="1">7</option>
            		<option value="1">8</option>
            		<option value="1">9</option>
            		<option value="1">10</option>
            		<option value="1">11</option>
            		<option value="1">12</option>
            	</select> 
            </li>
            <li><input type="button" name="search" value="조회"></li>
            <li><input type="button" name="report" value="신고서미리보기"></li>
			
		</ol>
		
		
		<div></div>
            

		<div style="height: 100vh;"></div>
		
 
	
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>