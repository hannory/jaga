<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        height:1300px;
        margin-left:30px;
    }

 
    /* 거래처리스트 이벤트 정보 박스  */
    .vender-list-main-table-margin {

        width:1300px;
        height: auto;
        margin-left:50px;
        margin-top:10px;
        float:left;
/*         
        box-shadow: 4px 4px 4px rgba(0, 0, 0, 0.25); */
    }



    /* 거래처 리스트 흰색 테이블 (정렬용) */
    .vender-list-main-table-2nd {
        text-align: center;
        table-layout: fixed;
        width:900px;
        height:40px;
        cursor: pointer;
    }


    /* 각  테이블 상단 (검은색상 tr 라인) */
    .my-page-table-top {
        background:#296355;
        color:white; 
        height:40px;
        text-align: center;
   		margin-left:20px;
    }


    /* 테이블 내 글씨 가운데 정렬 */
    .table tbody tr td {
      vertical-align:middle;
      font-size:16px;
      text-align:center;
    }

    /* 거래처명 글씨 크기 */
    #vender-Name {
      font-size:20px;
      text-align:center;
    }
    
    #vender-tel{
    text-align:center;
    }

	#boss-name{
	text-align:center;
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
	
	#account-status{
	text-align:center;
	}

#table2{
position:auto;
width:1200px;
height:900px;
left:100px;
top:139px;
float:left;
margin-top:5px;
background:white;

}
</style>
<body>

	<jsp:include page="../common/menubar.jsp" />
	<div id="main">
	<div class="container-fluid">
		<h2 class="mt-4">거래처 리스트</h2>
		</ol>
 		<div class="card mb-4">
			<div class="card-body">
			<div id="main">
		<div id="table-total"> 
		 
		 <div class="vender-list-main-contain">

        <div style="margin-top:50px; width:1000px; float:left;">
        </div>
        
        <div class="vender-list-main-table-margin" style="margin-top: 10px;"> 
		<div id="table2" style="overflow-y:auto; overflow-x:hidden; -ms-overflow-style:none;">
            <table border="0" class="table table-hover vender-list-main-table-2nd" id="listArea2">
              <thead>
                <tr class="my-page-table-top">
                	<th style="width:200px;">구분</th>
                  <th colspan="2" style="width:400px; text-align:center;">거래처명</th>
                  <th style="width:200px;">대표자명</th>
                  <th style="width:200px">연락처</th>
                  <th style="width:200px;">이체정보</th>
                  <th></th>
                </tr>
              </thead>
              
              <tbody>
				<c:if test="${!empty sessionScope.loginCompany}">
              	<c:forEach var="v" items="${list}">
                <tr>
                <td id="venderType" style="text-align:center"><c:if test="${v.venderType==1}">일반거래처</c:if>
                					<c:if test="${v.venderType==null}">일반거래처</c:if>
                					<c:if test="${v.venderType==2}">은행</c:if>
                					<c:if test="${v.venderType==3 }">카드</c:if>
                </td>
                 <td colspan="2" id="vender-Name"><c:out value="${v.venderName}"/></td>
                 <td id="boss-name"><c:out value="${v.bossName}"/></td>
               	 <td id="vender-tel"><c:out value="${v.venderTel}"/></td>
               	 <td id="account-status"> <c:if test="${!empty v.accountNum}">등록</c:if>
               	 							<c:if test="${empty v.accountNum }">미등록</c:if>
                  </td> 
                <td><input type="hidden"  style="display:none;" name="venderCode" value="${v.venderCode}" ><div style="display:none;">${v.venderCode}</div></td> 
              	 </tr>
              	 </c:forEach>
				</c:if>
                </tbody>
              </table>
              
              </div>
        </div>
        
        <div id="space"></div>
        
    		<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		
	</main>
	<jsp:include page="../common/menubar2.jsp" />
    
    <script>
	$(function(){
		$("#listArea2 td").mouseenter(function(){
			$(this).parent().css({"background":"#F0F0F0","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css("background","white");
		}).click(function(){
			var venderCode =$(this).parent().children().eq(5).text();
			console.log(venderCode);
			location.href="${contextPath}/venderSelectOne.vi?venderCode="+venderCode;
		});
	});
    </script>
		 


</body>
</html>