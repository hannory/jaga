<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* 거래처 리스트 vender-list*/


    /*  거래처 리스트 전체 컨테이너 */
    .vender-list-main-contain {
        width:1380px;
        height:1500px;
        margin-left:70px;
    }


    /* 거래처리스트 이벤트 정보 박스  */
    .vender-list-main-table-margin {

        width:1000px;
        height: auto;
        margin-left:50px;
        margin-top:10px;
        float:left;

        box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.25);
    }S



    /* 거래처리스트 흰색 테이블 (정렬용) */
    .vender-list-main-table-2nd {
        text-align: center;
        table-layout: fixed;
        width:1000px;
        height:50px;
        cursor: pointer;
    }


    /* 각 이벤트정보 테이블 상단 (검은색상 tr 라인) */
    .my-page-table-top {
        background:#296355;
        color:white; 
        height:40px;
        text-align: center;
   		margin-left:10px;
    }


    /* 테이블 내 글씨 가운데 정렬 */
    .table tbody tr td {
      vertical-align:middle;
      font-size:16px;
    }

    /* 거래처명 글씨 크기 */
    #vender-Name {
      font-size:20px;
    }
    
    #space{
    width:50px;
    float:left;
    }
    
    .paging1{
    margin-top:30px;
	margin-left:550px;
    float:left;
    
    }
    
    .boldText {
    	font-weight: bold;
    }


</style>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<div id="main">
	<div class="container-fluid">
		<h2 class="mt-4">거래처 리스트</h2>
		<ol class="breadcrumb mb-4">
		</ol>
 		<div class="card mb-4">
			<div class="card-body">
			<div id="main">
		<div id="table-total"> 
		 
		 <div class="vender-list-main-contain">

        <div style="margin-top:50px; width:1000px; float:left;">
<!--             <div style="margin-left:50px; font-size:25px;" class="thick" id="trlist">거래처 리스트</span>
 -->        </div>
        
        <div class="vender-list-main-table-margin" style="margin-top: 10px;"> 
            <table border="0" class="table table-hover vender-list-main-table-2nd" id="listArea2">
              <thead>
                <tr class="my-page-table-top">
                  <td colspan="2" style="width:500px; text-align:center;">거래처명</td>
                  <td>대표자명</td>
                  <td>연락처</td>
                  <td>사용구분</td>
                  <td>이체정보</td>
                </tr>
              </thead>
              
              <tbody>
              
               <%--     <% for(PRandTRList tr : trlist2) {%>  --%>
              
                <tr>
                  <td colspan="2" id="vender-Name">(주)123</td>
                 <td id="boss-name">유지연</td>
               	 <td id="vender-tel">010-3333-2222</td>
               	 <td id="status" >사용</td>
               	 <td id="account-status">등록</td>
              	 

                <tr>
                  <td colspan="2" id="vender-Name">(주)123</td>
                 <td id="boss-name">유지연</td>
               	 <td id="vender-tel">010-3333-2222</td>
               	 <td id="status" >사용</td>
               	 <td id="account-status">등록</td>
               	</tr>
                </tbody>
              </table>
        </div>
        
        <div id="space"></div>
        
    		<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
    
    <script>

    </script>
		 
		
		
	
		
		

</body>
</html>